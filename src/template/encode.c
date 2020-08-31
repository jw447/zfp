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
  Int x, y, z, w;
  x = *p; p += s;
  y = *p; p += s;
  z = *p; p += s;
  w = *p; p += s;

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
  do
  {
    UInt temp = _t1(int2uint, Int)(iblock[*perm++]);
    *ublock++ = temp;
  }
  while (--n);
}


/* compress sequence of size unsigned integers */
static uint
_t1(encode_ints, UInt)(bitstream* restrict_ stream, uint maxbits, uint maxprec, const UInt* restrict_ data, uint size)
{
  //jwang
  /* make a copy of bit stream to avoid aliasing */
  bitstream s = *stream;
  uint intprec = CHAR_BIT * (uint)sizeof(UInt);
  uint kmin = intprec > maxprec ? intprec - maxprec : 0;
  uint bits = maxbits;
  uint i, k, m, n, nn;
  uint64 x;

  /* block-wise RLE encoding */
  //int elem[size];
  //int count[size];
  //int index = rle(&data, size, elem, count);
  //int outputsize_rle = sizeof(int)*(index)*2;
  ////printf("indexnum=%d, rle_size=%d ", index, outputsize_rle);

  //return outputsize_rle; // bytes

  /* huffman encoding approach */
  int bpNum = intprec - kmin;
  int type[bpNum];
  for (k = intprec; k > kmin; k--){
      x = 0;
      for (i = 0; i < size; i++)
      x += (uint64)((data[i] >> k) & 1u) << i; 
      type[intprec - k] = (int)x;
  }
  
  int stateNum = size; // at most 4 unique values for 1d. 0 - 3.

  TightDataPointStorageD* tdps;
  tdps = (TightDataPointStorageD*)malloc(sizeof(TightDataPointStorageD));
  tdps->allSameData = 0;
  tdps->realPrecision = 0.0;
  tdps->medianValue = 0.0;
  tdps->reqLength = 0;
  
  tdps->dataSeriesLength = 0;
  tdps->exactDataNum = 0;
  
  tdps->rtypeArray = NULL;
  tdps->rtypeArray_size = 0;

  HuffmanTree* huffmanTree = createHuffmanTree(stateNum);
  encode_withTree(huffmanTree, type, bpNum, &tdps->typeArray, &tdps->typeArray_size);
  SZ_ReleaseHuffman(huffmanTree);

  //printf("typeArray_size=%u\n", tdps->typeArray_size);
  return tdps->typeArray_size;

  ///* encode one bit plane at a time from MSB to LSB */
  //for (k = intprec, n = 0; bits && k-- > kmin;) {
  //  //cbits = bits;
  //  /* step 1: extract bit plane #k to x */
  //  x = 0;
  //  for (i = 0; i < size; i++)
  //    x += (uint64)((data[i] >> k) & 1u) << i;
  //  //xx = x;

  //  /* step 2: encode first n bits of bit plane */
  //  //nn = n;
  //  m = MIN(n, bits);
  //  bits -= m;
  //  x = stream_write_bits(&s, x, m);

  //  /* step 3: unary run-length encode remainder of bit plane */
  //  for (; n < size && bits && (bits--, stream_write_bit(&s, !!x)); x >>= 1, n++)
  //    for (; n < size - 1 && bits && (bits--, !stream_write_bit(&s, x & 1u)); x >>= 1, n++)
  //      ;
  //}
  //*stream = s;

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
  
  int bytes;
  cache_align_(UInt ublock[BLOCK_SIZE]);
  //printf("BLOCKSIZE=%d, DIMs=%d\n", (int)BLOCK_SIZE, (int)DIMS);

  /* perform decorrelating transform */
  _t2(fwd_xform, Int, DIMS)(iblock);

  /* reorder signed coefficients and convert to unsigned integer */
  _t1(fwd_order, Int)(ublock, iblock, PERM, BLOCK_SIZE);
   
  /* encode integer coefficients */
  if (BLOCK_SIZE <= 64){
    //printf("minbits=%d maxbits=%d maxprec=%d ", minbits, maxbits, maxprec);
    bytes = _t1(encode_ints, UInt)(stream, maxbits, maxprec, ublock, BLOCK_SIZE);
    //printf("encodingsize(bits)=%d\n", bytes*8);
  }
  //else
  // bits = _t1(encode_many_ints, UInt)(stream, maxbits, maxprec, ublock, BLOCK_SIZE);
  ///* write at least minbits bits by padding with zeros */
  //if (bits < minbits) {
  //  stream_pad(stream, minbits - bits);
  //  bits = minbits;
  //}

  return bytes*8; // bits
}
