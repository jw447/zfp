#include <limits.h>
#include <zfp.h>

static void _t2(fwd_xform, Int, DIMS)(Int* p, CPU_timing* cpu_timing);

/* private functions ------------------------------------------------------- */

/* pad partial block of width n <= 4 and stride s */
static void
_t1(pad_block, Scalar)(Scalar* p, uint n, uint s)
{
  switch (n) {
    case 0:
      p[0 * s] = 0;
      /* FALLTHROUGH */
    case 1:
      p[1 * s] = p[0 * s];
      /* FALLTHROUGH */
    case 2:
      p[2 * s] = p[1 * s];
      /* FALLTHROUGH */
    case 3:
      p[3 * s] = p[0 * s];
      /* FALLTHROUGH */
    default:
      break;
  }
}

/* forward lifting transform of 4-vector */
static void
_t1(fwd_lift, Int)(Int* p, uint s, CPU_timing* cpu_timing)
{
  //jwang
  //FuncName;
  Int x, y, z, w;
  x = *p; p += s;
  y = *p; p += s;
  z = *p; p += s;
  w = *p; p += s;

  /*
  ** non-orthogonal transform
  **        ( 4  4  4  4) (x)
  ** 1/16 * ( 5  1 -1 -5) (y)
  **        (-4  4  4 -4) (z)
  **        (-2  6 -6  2) (w)
  */
  x += w; x >>= 1; w -= x;
  z += y; z >>= 1; y -= z;
  x += z; x >>= 1; z -= x;
  w += y; w >>= 1; y -= w;
  w += y >> 1; y -= w >> 1;

  p -= s; *p = w;
  p -= s; *p = z;
  p -= s; *p = y;
  p -= s; *p = x;
}

/* map two's complement signed integer to negabinary unsigned integer */
static UInt
_t1(int2uint, Int)(Int x)
{
  return ((UInt)x + NBMASK) ^ NBMASK;
}

/* reorder signed coefficients and convert to unsigned integer */
static void
_t1(fwd_order, Int)(UInt* ublock, const Int* iblock, const uchar* perm, uint n, CPU_timing* cpu_timing)
{
  //jwang
  gettimeofday(&reorderS, NULL);
  do
    *ublock++ = _t1(int2uint, Int)(iblock[*perm++]);
  while (--n);
  gettimeofday(&reorderE, NULL);
  (*cpu_timing).order_loop_time += ((reorderE.tv_sec*1000000+reorderE.tv_usec)-(reorderS.tv_sec*1000000+reorderS.tv_usec))/1000000.0;
}

/* compress sequence of size unsigned integers */
static uint
_t1(encode_ints, UInt)(bitstream* restrict_ stream, uint maxbits, uint maxprec, const UInt* restrict_ data, uint size, CPU_timing* cpu_timing)
{
  //jwang
  /* make a copy of bit stream to avoid aliasing */
  bitstream s = *stream;
  uint intprec = CHAR_BIT * (uint)sizeof(UInt);
  uint kmin = intprec > maxprec ? intprec - maxprec : 0;
  uint bits = maxbits;
  uint i, k, m, n;
  uint64 x;

  //struct timespec tpstart;
  //struct timespec tpend;
  //clock_gettime(CLOCK_MONOTONIC, &tpstart);
  gettimeofday(&bpS, NULL);
  /* encode one bit plane at a time from MSB to LSB */
  for (k = intprec, n = 0; bits && k-- > kmin;) {
    //TODO
    /* step 1: extract bit plane #k to x */
    //gettimeofday(&stepS, NULL);
    x = 0;
    for (i = 0; i < size; i++)
      x += (uint64)((data[i] >> k) & 1u) << i;
    //gettimeofday(&stepE, NULL);

    /* step 2: encode first n bits of bit plane */
    //gettimeofday(&stepS, NULL);
    m = MIN(n, bits);
    bits -= m;
    x = stream_write_bits(&s, x, m);
    //gettimeofday(&stepE, NULL);

    /* step 3: unary run-length encode remainder of bit plane */
    //gettimeofday(&stepS, NULL);
    for (; n < size && bits && (bits--, stream_write_bit(&s, !!x)); x >>= 1, n++)
      for (; n < size - 1 && bits && (bits--, !stream_write_bit(&s, x & 1u)); x >>= 1, n++)
	;
    //gettimeofday(&stepE, NULL);
    //(*cpu_timing).num_bp++;
    //(*cpu_timing).step1 += ((stepE.tv_sec*1000000+stepE.tv_usec)-(stepS.tv_sec*1000000+stepS.tv_usec))/1000000.0;
    //(*cpu_timing).step2 += ((stepE.tv_sec*1000000+stepE.tv_usec)-(stepS.tv_sec*1000000+stepS.tv_usec))/1000000.0;
    //(*cpu_timing).step3 += ((stepE.tv_sec*1000000+stepE.tv_usec)-(stepS.tv_sec*1000000+stepS.tv_usec))/1000000.0;
  }
  gettimeofday(&bpE, NULL);
  (*cpu_timing).bp_time += ((bpE.tv_sec*1000000+bpE.tv_usec)-(bpS.tv_sec*1000000+bpS.tv_usec))/1000000.0;
  //clock_gettime(CLOCK_MONOTONIC, &tpend);
  //uint64_t diff = BILLION * (tpend.tv_sec - tpstart.tv_sec) + tpend.tv_nsec - tpstart.tv_nsec;
  //printf("bp time = %llu\n", diff);
  *stream = s;
  return maxbits - bits;
}

/* compress sequence of size > 64 unsigned integers */
static uint
_t1(encode_many_ints, UInt)(bitstream* restrict_ stream, uint maxbits, uint maxprec, const UInt* restrict_ data, uint size)
{
  //jwang
  FuncName;
  /* make a copy of bit stream to avoid aliasing */
  bitstream s = *stream;
  uint intprec = CHAR_BIT * (uint)sizeof(UInt);
  uint kmin = intprec > maxprec ? intprec - maxprec : 0;
  uint bits = maxbits;
  uint i, k, m, n, c;

  /* encode one bit plane at a time from MSB to LSB */
  for (k = intprec, n = 0; bits && k-- > kmin;) {
    /* step 1: encode first n bits of bit plane #k */
    m = MIN(n, bits);
    bits -= m;
    for (i = 0; i < m; i++)
      stream_write_bit(&s, (data[i] >> k) & 1u);
    /* step 2: count remaining one-bits in bit plane */
    c = 0;
    for (i = m; i < size; i++)
      c += (data[i] >> k) & 1u;
    /* step 3: unary run-length encode remainder of bit plane */
    for (; n < size && bits && (--bits, stream_write_bit(&s, !!c)); c--, n++)
      for (; n < size - 1 && bits && (--bits, !stream_write_bit(&s, (data[n] >> k) & 1u)); n++)
        ;
  }

  *stream = s;
  return maxbits - bits;
}

/* encode block of integers */
static uint
_t2(encode_block, Int, DIMS)(bitstream* stream, int minbits, int maxbits, int maxprec, Int* iblock, CPU_timing* cpu_timing)
{
  //jwang
  FuncName;

  int bits;
  cache_align_(UInt ublock[BLOCK_SIZE]);

  /* perform decorrelating transform */
  //struct timespec tpstart;
  //struct timespec tpend;
  //clock_gettime(CLOCK_MONOTONIC, &tpstart);
  gettimeofday(&xformS, NULL);
  _t2(fwd_xform, Int, DIMS)(iblock, cpu_timing);
  //clock_gettime(CLOCK_MONOTONIC, &tpend);
  //uint64_t diff = BILLION * (tpend.tv_sec - tpstart.tv_sec) + tpend.tv_nsec - tpstart.tv_nsec;
  //printf("xform time = %llu\n", diff);
  gettimeofday(&xformE, NULL);

  /* reorder signed coefficients and convert to unsigned integer */
  gettimeofday(&orderS, NULL);
  //clock_gettime(CLOCK_MONOTONIC, &tpstart);
  _t1(fwd_order, Int)(ublock, iblock, PERM, BLOCK_SIZE, cpu_timing);
  //clock_gettime(CLOCK_MONOTONIC, &tpend);
  //diff = BILLION * (tpend.tv_sec - tpstart.tv_sec) + tpend.tv_nsec - tpstart.tv_nsec;
  //printf("order time = %llu\n", diff);
  gettimeofday(&orderE, NULL);

  /* encode integer coefficients */
  if (BLOCK_SIZE <= 64)
  {
    bits = _t1(encode_ints, UInt)(stream, maxbits, maxprec, ublock, BLOCK_SIZE, cpu_timing);
    //printf("blocksize=%d\n", bits);
  }
  else
    bits = _t1(encode_many_ints, UInt)(stream, maxbits, maxprec, ublock, BLOCK_SIZE);
  /* write at least minbits bits by padding with zeros */
  if (bits < minbits) {
    stream_pad(stream, minbits - bits);
    bits = minbits;
  }
  (*cpu_timing).xform_time += ((xformE.tv_sec*1000000+xformE.tv_usec)-(xformS.tv_sec*1000000+xformS.tv_usec))/1000000.0;
  (*cpu_timing).order_time += ((orderE.tv_sec*1000000+orderE.tv_usec)-(orderS.tv_sec*1000000+orderS.tv_usec))/1000000.0;

  return bits;
}
