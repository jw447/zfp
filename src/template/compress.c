#include "zfp.h"

void 
_t2(compress, Scalar, 1)(zfp_stream* stream, const zfp_field* field)
{
  //jwang
  FuncName;
  const Scalar* data = (const Scalar*)field->data;
  uint nx = field->nx;
  uint mx = nx & ~3u;
  uint64 x;
  uint bits = 0;
  uint outputsize_bit = 0;
  printf("mx=%u, nx=%u\n", mx, nx); 
  //for (x = 0; x < mx; x += 4, data += 4)
  //{
  //  bits = _t2(zfp_encode_block, Scalar, 1)(stream, data); // return bits of each block
  //  outputsize_bit = outputsize_bit + bits;
  //}
  //printf("outputsize_bits=%u\n", outputsize_bit);
  //if (x < nx)
  //  _t2(zfp_encode_partial_block_strided, Scalar, 1)(stream, data, nx - x, 1);

  /* Single huffman tree to encode the transform coefficients */
  #define Int int64
  #define EBITS 11
  #define UInt uint64
  #define EBIAS ((1 << (EBITS - 1)) - 1) /* exponent bias */
  #define BLOCK_SIZE 4
  #define FABS(x) fabs(x)
  #define FREXP(x, e) frexp(x, e)
  #define LDEXP(x, e) ldexp(x, e)
  #define NBMASK UINT64C(0xaaaaaaaaaaaaaaaa)

  cache_align_(static const uchar perm_1[4]) = { 0, 1, 2, 3};

  int ebitsize = 0;
  int n;
  int e;
  int emax;
  double max;
  double f;
  int maxprec;
  double s;
  int index = 0;
  UInt* idata; // store the bit planes.
  idata = (Int *)malloc(sizeof(Int) * nx/4*32); // test with double data
  memset(idata, 0, (long)(sizeof(Int) * nx/4 * 32));
  printf("num of bit plane at most: %ld\n",(long)(nx/4 * 32));

  for (int i = 0; i < mx; i += 4, data += 4){
    n = 0;
    while(n<4){
      f = FABS(data[n]);
      if (max < f)
        max = f;
      n++;
    }
    if (max > 0){
      FREXP(max, &e);
      emax = MAX(e, 1 - EBIAS);  
    }
    else{
      emax = -EBIAS;
    }

    //int maxprec = precision(emax, stream->maxprec, stream->minexp, 1);
    maxprec = MIN(stream->maxprec, (uint)MAX(0, emax - stream->minexp + 2 * (1 + 1)));
    e = maxprec ? emax + EBIAS : 0; 
    if (e) {
      cache_align_(Int iblock[BLOCK_SIZE]);
      cache_align_(UInt ublock[BLOCK_SIZE]);
      ebitsize += EBITS;
      /* perform forward block-floating-point transform */
      //_t1(fwd_cast, Scalar)(iblock, data, BLOCK_SIZE, emax); // get mantisa.
      s = LDEXP(1, (CHAR_BIT * (int)sizeof(Scalar) - 2) - emax);
      n = 0;
      while(n<4){
        iblock[n] = (Int)(s * data[n]);
        n++;
      }
      /* perform decorrelating transform */
      _t2(fwd_xform, Int, 1)(iblock);
      //_t1(fwd_order, Int)(ublock, iblock, perm_1, BLOCK_SIZE);
      n = 0;
      while(n<4){
        UInt temp = ((UInt)iblock[n] + NBMASK) ^ NBMASK;
        ublock[n] = temp;
        n++;
      }

      uint intprec = CHAR_BIT * (uint)sizeof(UInt);
      uint kmin = intprec > maxprec ? intprec - maxprec : 0;
      for(int k = intprec; k-- > kmin;){
        x = 0;
        for (int i = 0; i< BLOCK_SIZE; i++)
          x += (uint64)((ublock[i] >> k) & 1u) << i;
        //printf("%lu\n", x);
        idata[index] = x;
        index++;
      }
    }
  } // end of for-loop that goes over the entire dataet
  //for(int i = 0; i< 64; i++) printf("%lu ", idata[i]); // 4 block each with 8 bit planes 
  
  HuffmanTree* huffmanTree = createHuffmanTree(65536);
  //printf("tree created\n");
  encode_withTree(huffmanTree, idata, nx/4*32);
  SZ_ReleaseHuffman(huffmanTree);
  //printf("done\n");
}

/* compress 1d strided array */
static void
_t2(compress_strided, Scalar, 1)(zfp_stream* stream, const zfp_field* field)
{
  //jwang
  FuncName;
  const Scalar* data = field->data;
  uint nx = field->nx;
  int sx = field->sx ? field->sx : 1;
  uint x;

  /* compress array one block of 4 values at a time */
  for (x = 0; x < nx; x += 4) {
    const Scalar* p = data + sx * (ptrdiff_t)x;
    if (nx - x < 4)
      _t2(zfp_encode_partial_block_strided, Scalar, 1)(stream, p, nx - x, sx);
    else
      _t2(zfp_encode_block_strided, Scalar, 1)(stream, p, sx);
  }
}

/* compress 2d strided array */
static void
_t2(compress_strided, Scalar, 2)(zfp_stream* stream, const zfp_field* field)
{
  //jwang
  FuncName;
  const Scalar* data = (const Scalar*)field->data;
  uint nx = field->nx;
  uint ny = field->ny;
  int sx = field->sx ? field->sx : 1;
  int sy = field->sy ? field->sy : (int)nx;
  uint x, y;

  /* compress array one block of 4x4 values at a time */
  for (y = 0; y < ny; y += 4)
    for (x = 0; x < nx; x += 4) {
      const Scalar* p = data + sx * (ptrdiff_t)x + sy * (ptrdiff_t)y;
      if (nx - x < 4 || ny - y < 4)
        _t2(zfp_encode_partial_block_strided, Scalar, 2)(stream, p, MIN(nx - x, 4u), MIN(ny - y, 4u), sx, sy);
      else
        _t2(zfp_encode_block_strided, Scalar, 2)(stream, p, sx, sy);
    }
}

/* compress 3d strided array */
static void
_t2(compress_strided, Scalar, 3)(zfp_stream* stream, const zfp_field* field)
{
  //jwang
  FuncName;
  const Scalar* data = (const Scalar*)field->data;
  uint nx = field->nx;
  uint ny = field->ny;
  uint nz = field->nz;
  int sx = field->sx ? field->sx : 1;
  int sy = field->sy ? field->sy : (int)nx;
  int sz = field->sz ? field->sz : (int)(nx * ny);
  uint x, y, z;

  /* compress array one block of 4x4x4 values at a time */
  for (z = 0; z < nz; z += 4)
    for (y = 0; y < ny; y += 4)
      for (x = 0; x < nx; x += 4) {
        const Scalar* p = data + sx * (ptrdiff_t)x + sy * (ptrdiff_t)y + sz * (ptrdiff_t)z;
        if (nx - x < 4 || ny - y < 4 || nz - z < 4)
          _t2(zfp_encode_partial_block_strided, Scalar, 3)(stream, p, MIN(nx - x, 4u), MIN(ny - y, 4u), MIN(nz - z, 4u), sx, sy, sz);
        else
          _t2(zfp_encode_block_strided, Scalar, 3)(stream, p, sx, sy, sz);
      }
}

/* compress 4d strided array */
static void
_t2(compress_strided, Scalar, 4)(zfp_stream* stream, const zfp_field* field)
{
  //jwang
  FuncName;
  const Scalar* data = field->data;
  uint nx = field->nx;
  uint ny = field->ny;
  uint nz = field->nz;
  uint nw = field->nw;
  int sx = field->sx ? field->sx : 1;
  int sy = field->sy ? field->sy : (int)nx;
  int sz = field->sz ? field->sz : (int)(nx * ny);
  int sw = field->sw ? field->sw : (int)(nx * ny * nz);
  uint x, y, z, w;

  /* compress array one block of 4x4x4x4 values at a time */
  for (w = 0; w < nw; w += 4)
    for (z = 0; z < nz; z += 4)
      for (y = 0; y < ny; y += 4)
        for (x = 0; x < nx; x += 4) {
          const Scalar* p = data + sx * (ptrdiff_t)x + sy * (ptrdiff_t)y + sz * (ptrdiff_t)z + sw * (ptrdiff_t)w;
          if (nx - x < 4 || ny - y < 4 || nz - z < 4 || nw - w < 4)
            _t2(zfp_encode_partial_block_strided, Scalar, 4)(stream, p, MIN(nx - x, 4u), MIN(ny - y, 4u), MIN(nz - z, 4u), MIN(nw - w, 4u), sx, sy, sz, sw);
          else
            _t2(zfp_encode_block_strided, Scalar, 4)(stream, p, sx, sy, sz, sw);
        }
}
