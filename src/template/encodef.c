#include <limits.h>
#include <math.h>

static uint _t2(rev_encode_block, Scalar, DIMS)(zfp_stream* zfp, const Scalar* fblock);

/* private functions ------------------------------------------------------- */

/* return normalized floating-point exponent for x >= 0 */
static int
_t1(exponent, Scalar)(Scalar x)
{
  if (x > 0) {
    int e;
    FREXP(x, &e);
    /* clamp exponent in case x is denormal */
    return MAX(e, 1 - EBIAS);
  }
  return -EBIAS;
}

/* compute maximum floating-point exponent in block of n values */
static int
_t1(exponent_block, Scalar)(const Scalar* p, uint n)
{
  Scalar max = 0;
  do {
    Scalar f = FABS(*p++);
    if (max < f)
      max = f;
  } while (--n);
  return _t1(exponent, Scalar)(max);
}

/* map floating-point number x to integer relative to exponent e */
static Scalar
_t1(quantize, Scalar)(Scalar x, int e)
{
  return LDEXP(x, (CHAR_BIT * (int)sizeof(Scalar) - 2) - e);
}

/* forward block-floating-point transform to signed integers */
static void
_t1(fwd_cast, Scalar)(Int* iblock, const Scalar* fblock, uint n, int emax, CPU_timing* cpu_timing)
{
  /* compute power-of-two scale factor s */
  Scalar s = _t1(quantize, Scalar)(1, emax);
  do
    *iblock++ = (Int)(s * *fblock++);
  while (--n);
}

/* encode contiguous floating-point block using lossy algorithm */
static uint
_t2(encode_block, Scalar, DIMS)(zfp_stream* zfp, const Scalar* fblock, CPU_timing* cpu_timing)
{
  //jwang
  FuncName;
  uint bits = 1;

  /* compute maximum exponent */
  gettimeofday(&ecostS, NULL);
  int emax = _t1(exponent_block, Scalar)(fblock, BLOCK_SIZE);
  int maxprec = precision(emax, zfp->maxprec, zfp->minexp, DIMS);
  uint e = maxprec ? emax + EBIAS : 0;
  gettimeofday(&ecostE, NULL);
  
  /* encode block only if biased exponent is nonzero */
  if (e) {
    cache_align_(Int iblock[BLOCK_SIZE]);
    /* encode common exponent; LSB indicates that exponent is nonzero */
    bits += EBITS;
    stream_write_bits(zfp->stream, 2 * e + 1, bits);

    /* perform forward block-floating-point transform */    
    gettimeofday(&mcostS, NULL);
    _t1(fwd_cast, Scalar)(iblock, fblock, BLOCK_SIZE, emax, cpu_timing); // get mantisa.
    gettimeofday(&mcostE, NULL);

    /* encode integer block */
    gettimeofday(&embedS, NULL);
    bits += _t2(encode_block, Int, DIMS)(zfp->stream, zfp->minbits - bits, zfp->maxbits - bits, maxprec, iblock, cpu_timing);
    gettimeofday(&embedE, NULL);
  }
  
  else {
    /* write single zero-bit to indicate that all values are zero */
    stream_write_bit(zfp->stream, 0);
    if (zfp->minbits > bits) {
      stream_pad(zfp->stream, zfp->minbits - bits);
      bits = zfp->minbits;
    }
  }
  (*cpu_timing).ecost_time += ((ecostE.tv_sec*1000000+ecostE.tv_usec)-(ecostS.tv_sec*1000000+ecostS.tv_usec))/1000000.0;
  (*cpu_timing).mcost_time += ((mcostE.tv_sec*1000000+mcostE.tv_usec)-(mcostS.tv_sec*1000000+mcostS.tv_usec))/1000000.0;
  (*cpu_timing).embed_time += ((embedE.tv_sec*1000000+embedE.tv_usec)-(embedS.tv_sec*1000000+embedS.tv_usec))/1000000.0;
   
  return bits;
}

/* public functions -------------------------------------------------------- */

/* encode contiguous floating-point block */
uint _t2(zfp_encode_block, Scalar, DIMS)(zfp_stream* zfp, const Scalar* fblock)
{
  //jwang
  //return REVERSIBLE(zfp) ? _t2(rev_encode_block, Scalar, DIMS)(zfp, fblock) : _t2(encode_block, Scalar, DIMS)(zfp, fblock, cpu_timing);
  printf("not available\n");
}

uint _t2(jw_zfp_encode_block, Scalar, DIMS)(zfp_stream* zfp, const Scalar* fblock, CPU_timing* cpu_timing)
{
  //jwang
  return _t2(encode_block, Scalar, DIMS)(zfp, fblock, cpu_timing);
}
