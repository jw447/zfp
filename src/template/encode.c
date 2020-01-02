#include <limits.h>
#include <zfp.h>

static void _t2(fwd_xform, Int, DIMS)(Int* p);

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
_t1(fwd_lift, Int)(Int* p, uint s)
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
_t1(fwd_order, Int)(UInt* ublock, const Int* iblock, const uchar* perm, uint n)
{
  //jwang
  //FuncName;
  do
    *ublock++ = _t1(int2uint, Int)(iblock[*perm++]);
  while (--n);
}

/* compress sequence of size unsigned integers */
static uint
_t1(encode_ints, UInt)(bitstream* restrict_ stream, uint maxbits, uint maxprec, const UInt* restrict_ data, uint size)
{
  //jwang
  FuncName;
  /* make a copy of bit stream to avoid aliasing */
  bitstream s = *stream;
  uint intprec = CHAR_BIT * (uint)sizeof(UInt);
  uint kmin = intprec > maxprec ? intprec - maxprec : 0;
  uint bits = maxbits;
  uint i, k, m, n;
  uint64 x;

  //jwang
  //printf("intprec=%u, maxbits=%u, maxprec=%u, size=%u\n", intprec, maxbits, maxprec, size);
  //printf("NumBP=%d\n", intprec - kmin);
  //uint count=0;

  count_xou++;
  gettimeofday(&uintCostS, NULL);
  /* encode one bit plane at a time from MSB to LSB */
  for (k = intprec, n = 0; bits && k-- > kmin;) {
    //TODO
    /* step 1: extract bit plane #k to x */
    x = 0;
    for (i = 0; i < size; i++)
      x += (uint64)((data[i] >> k) & 1u) << i;
    /* step 2: encode first n bits of bit plane */
    m = MIN(n, bits);
    bits -= m;
    x = stream_write_bits(&s, x, m);
    /* step 3: unary run-length encode remainder of bit plane */
    for (; n < size && bits && (bits--, stream_write_bit(&s, !!x)); x >>= 1, n++)
      for (; n < size - 1 && bits && (bits--, !stream_write_bit(&s, x & 1u)); x >>= 1, n++)
        //count++;
	;
  }
  gettimeofday(&uintCostE, NULL);
  uintCost += ((uintCostE.tv_sec*1000000+uintCostE.tv_usec)-(uintCostS.tv_sec*1000000+uintCostS.tv_usec))/1000000.0;
  *stream = s;
  //printf("count=%u\n", count);
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
_t2(encode_block, Int, DIMS)(bitstream* stream, int minbits, int maxbits, int maxprec, Int* iblock)
{
  //jwang
  FuncName;

  int bits;
  cache_align_(UInt ublock[BLOCK_SIZE]);

  //printf("/* perform decorrelating transform */\n");
  gettimeofday(&XformCostS, NULL);
  _t2(fwd_xform, Int, DIMS)(iblock);
  gettimeofday(&XformCostE, NULL);


  //printf("/* reorder signed coefficients and convert to unsigned integer */\n");
  gettimeofday(&OrderCostS, NULL);
  _t1(fwd_order, Int)(ublock, iblock, PERM, BLOCK_SIZE);
  gettimeofday(&OrderCostE, NULL);

  /* encode integer coefficients */
  if (BLOCK_SIZE <= 64)
    bits = _t1(encode_ints, UInt)(stream, maxbits, maxprec, ublock, BLOCK_SIZE);
  else
    bits = _t1(encode_many_ints, UInt)(stream, maxbits, maxprec, ublock, BLOCK_SIZE);
  /* write at least minbits bits by padding with zeros */
  if (bits < minbits) {
    stream_pad(stream, minbits - bits);
    bits = minbits;
  }
  XformCost += ((XformCostE.tv_sec*1000000+XformCostE.tv_usec)-(XformCostS.tv_sec*1000000+XformCostS.tv_usec))/1000000.0; 
  OrderCost += ((OrderCostE.tv_sec*1000000+OrderCostE.tv_usec)-(OrderCostS.tv_sec*1000000+OrderCostS.tv_usec))/1000000.0;

  return bits;
}
