#include "zfp.h"

void 
_t2(compress, Scalar, 1)(zfp_stream* stream, const zfp_field* field)
{
  //jwang
  FuncName;
  const Scalar* data = (const Scalar*)field->data;
  uint nx = field->nx;
  uint mx = nx & ~3u;
  uint x;
  
  long int outputsize_bit = 0;

  for (x = 0; x < mx; x += 4, data += 4)
    outputsize_bit += _t2(zfp_encode_block, Scalar, 1)(stream, data); // return bits of each block
  if (x < nx)
    _t2(zfp_encode_partial_block_strided, Scalar, 1)(stream, data, nx - x, 1);

  printf("outputsize_bits=%ld\n", outputsize_bit);

  /* Single huffman tree to encode the transform coefficients */
  //Int* idata; // store the transformed coefficients.
  //idata = (Int *)malloc(sizeof(Int) * nx);
  //memset(idata, 0, sizeof(Int) * nx);

  ///* jwang: until DCT */
  //for (x = 0; x < mx; x += 4, data += 4, idata += 4){
  //  //for(int i = 0; i < BLOCK_SIZE; i++) printf("fblock=%d\n", data[i]);
  //  int emax = _t1(exponent_block, Scalar)(data, BLOCK_SIZE);
  //  //printf("emax=%d\n", emax);
  //  int maxprec = precision(emax, stream->maxprec, stream->minexp, 1);
  //  //printf("maxprec=%d\n", maxprec);
  //  uint e = maxprec ? emax + EBIAS : 0; 
  //  //printf("e=%u\n", e);
  //  
  //  if (e) {
  //    cache_align_(Int iblock[BLOCK_SIZE]);
  //    /* perform forward block-floating-point transform */
  //    _t1(fwd_cast, Scalar)(iblock, data, BLOCK_SIZE, emax); // get mantisa.

  //    /* perform decorrelating transform */
  //    _t2(fwd_xform, Int, 1)(iblock);
  //    for(int i = 0; i < BLOCK_SIZE; i++){
  //      idata[i] = iblock[i];
  //    }
  //    //for(int i = 0; i < BLOCK_SIZE; i++) printf("idata=%lld ", idata[i]);
  //    //printf("\n");
  //  }
  //}
  ////printf("mx = %d\n", mx);
  //idata -= mx;
  ////printf("%lld, %lld, %lld, %lld\n", idata[0], idata[1], idata[2], idata[3]);

  ////printf("%d\n", sizeof(Int));
  ///* huffman encoding */
  //int stateNum = 1; 
  //for (int i = 1; i < nx; i++){
  //  int j = 0;
  //  for (j = 0; j < i; j++){
  //    if(idata[i] == idata[j])
  //      break;
  //  }
  //  if (i == j) stateNum++;
  //}

  //printf("nx = %d, stateNum = %d\n", nx, stateNum);
  //int stateNum = 65536;
  //unsigned char* typeArray;
  //*typeArray = (unsigned char *)malloc(nx/4);
  //size_t typeArray_size = 0;
  
  //HuffmanTree* huffmanTree = createHuffmanTree(stateNum);
  //encode_withTree(huffmanTree, idata, nx, &typeArray, &typeArray_size);
  //SZ_ReleaseHuffman(huffmanTree);
  //printf("typeArray_size=%u\n", typeArray_size);
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
