#include "zfp.h"

/* compress 1d contiguous array */
static void
_t2(compress, Scalar, 1)(zfp_stream* stream, const zfp_field* field)
{
  //jwang
  FuncName;
  const Scalar* data = (const Scalar*)field->data;
  uint nx = field->nx;
  uint mx = nx & ~3u;
  uint x;

  BfCost = 0;
  BiCost = 0;
  mCost = 0;
  XformCost = 0;
  OrderCost = 0;
  uintCost = 0;
  zCost = 0;
  eCost = 0;
  count_emb=0;
  count_xou=0;
  
  gettimeofday(&NBCostS, NULL);
  /* compress array one block of 4 values at a time */
  //printf("mx=%d\n", mx); // mx is data length
  for (x = 0; x < mx; x += 4, data += 4)
    _t2(zfp_encode_block, Scalar, 1)(stream, data);
  if (x < nx)
    _t2(zfp_encode_partial_block_strided, Scalar, 1)(stream, data, nx - x, 1);
  gettimeofday(&NBCostE, NULL);
  NBCost = ((NBCostE.tv_sec*1000000+NBCostE.tv_usec)-(NBCostS.tv_sec*1000000+NBCostS.tv_usec))/1000000.0;

  printf("count_emb=%u, count_xou=%u\n", count_emb, count_xou);
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

  //gettimeofday(&StriCostS, NULL);
  /* compress array one block of 4 values at a time */
  for (x = 0; x < nx; x += 4) {
    const Scalar* p = data + sx * (ptrdiff_t)x;
    if (nx - x < 4)
      _t2(zfp_encode_partial_block_strided, Scalar, 1)(stream, p, nx - x, sx);
    else
      _t2(zfp_encode_block_strided, Scalar, 1)(stream, p, sx);
  }
  //gettimeofday(&StriCostE, NULL);
  //StriCost = ((StriCostE.tv_sec*1000000+StriCostE.tv_usec)-(StriCostS.tv_sec*1000000+StriCostS.tv_usec))/1000000.0;
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
