#include <assert.h>

#include "cuZFP.h"

#include "encode1.cuh"
#include "encode2.cuh"
#include "encode3.cuh"

#include "decode1.cuh"
#include "decode2.cuh"
#include "decode3.cuh"

#include "ErrorCheck.h"

#include "constant_setup.cuh"
#include "pointers.cuh"
#include "type_info.cuh"
#include <iostream>
#include <assert.h>

// we need to know about bitstream, but we don't 
// want duplicate symbols.
#ifndef inline_
  #define inline_ inline
#endif

#include "../inline/bitstream.c"
namespace internal 
{ 
  
bool is_contigous3d(const uint dims[3], const int3 &stride, long long int &offset)
{
  typedef long long int int64;
  int64 idims[3];
  idims[0] = dims[0];
  idims[1] = dims[1];
  idims[2] = dims[2];

  int64 imin = std::min(stride.x,0) * (idims[0] - 1) + 
               std::min(stride.y,0) * (idims[1] - 1) + 
               std::min(stride.z,0) * (idims[2] - 1);

  int64 imax = std::max(stride.x,0) * (idims[0] - 1) + 
               std::max(stride.y,0) * (idims[1] - 1) + 
               std::max(stride.z,0) * (idims[2] - 1);
  offset = imin;
  int64 ns = idims[0] * idims[1] * idims[2];

  return (imax - imin + 1 == ns);
}

bool is_contigous2d(const uint dims[3], const int3 &stride, long long int &offset)
{
  typedef long long int int64;
  int64 idims[2];
  idims[0] = dims[0];
  idims[1] = dims[1];

  int64 imin = std::min(stride.x,0) * (idims[0] - 1) + 
               std::min(stride.y,0) * (idims[1] - 1);

  int64  imax = std::max(stride.x,0) * (idims[0] - 1) + 
                std::max(stride.y,0) * (idims[1] - 1); 

  offset = imin;
  return (imax - imin + 1) == (idims[0] * idims[1]);
}

bool is_contigous1d(uint dim, const int &stride, long long int &offset)
{
  offset = 0;
  if(stride < 0) offset = stride * (int(dim) - 1);
  return std::abs(stride) == 1;
}

bool is_contigous(const uint dims[3], const int3 &stride, long long int &offset)
{
  int d = 0;
  
  if(dims[0] != 0) d++;
  if(dims[1] != 0) d++;
  if(dims[2] != 0) d++;

  if(d == 3)
  {
    return is_contigous3d(dims, stride, offset);
  }
  else if(d == 2)
  {
   return is_contigous2d(dims, stride, offset);
  }
  else
  {
    return is_contigous1d(dims[0], stride.x, offset);
  } 

}
//
// encode expects device pointers
//
template<typename T>
size_t encode(uint dims[3], int3 stride, int bits_per_block, T *d_data, Word *d_stream)
{
  int d = 0;
  size_t len = 1;
  for(int i = 0; i < 3; ++i)
  {
    if(dims[i] != 0)
    {
      d++;
      len *= dims[i];
    }
  }

  ErrorCheck errors;
  size_t stream_size = 0;
  if(d == 1)
  {
    int dim = dims[0];
    int sx = stride.x;
    gettimeofday(&cuda_start20S, NULL);
    cuZFP::ConstantSetup::setup_1d();
    gettimeofday(&cuda_start20E, NULL);
    cuda20 = ((cuda_start20E.tv_sec*1000000+cuda_start20E.tv_usec)-(cuda_start20S.tv_sec*1000000+cuda_start20S.tv_usec))/1000000.0;

    gettimeofday(&cuda_start21S, NULL);
    stream_size = cuZFP::encode1<T>(dim, sx, d_data, d_stream, bits_per_block); // kernel run time 
    gettimeofday(&cuda_start21E, NULL);
    cuda21 = ((cuda_start21E.tv_sec*1000000+cuda_start21E.tv_usec)-(cuda_start21S.tv_sec*1000000+cuda_start21S.tv_usec))/1000000.0;
  }
  else if(d == 2)
  {
    uint2 ndims = make_uint2(dims[0], dims[1]);
    int2 s;
    s.x = stride.x; 
    s.y = stride.y; 
    cuZFP::ConstantSetup::setup_2d();
    stream_size = cuZFP::encode2<T>(ndims, s, d_data, d_stream, bits_per_block); 
  }
  else if(d == 3)
  {
    int3 s;
    s.x = stride.x; 
    s.y = stride.y; 
    s.z = stride.z; 
    uint3 ndims = make_uint3(dims[0], dims[1], dims[2]);
    cuZFP::ConstantSetup::setup_3d();
    stream_size = cuZFP::encode<T>(ndims, s, d_data, d_stream, bits_per_block); 
  }

  errors.chk("Encode");
  
  return stream_size; 
}

template<typename T>
size_t decode(uint ndims[3], int3 stride, int bits_per_block, Word *stream, T *out)
{

  int d = 0;
  size_t out_size = 1;
  size_t stream_bytes = 0;
  for(int i = 0; i < 3; ++i)
  {
    if(ndims[i] != 0)
    {
      d++;
      out_size *= ndims[i];
    }
  }

  if(d == 3)
  {
    uint3 dims = make_uint3(ndims[0], ndims[1], ndims[2]);

    int3 s;
    s.x = stride.x; 
    s.y = stride.y; 
    s.z = stride.z; 

    cuZFP::ConstantSetup::setup_3d();
    stream_bytes = cuZFP::decode3<T>(dims, s, stream, out, bits_per_block); 
  }
  else if(d == 1)
  {
    uint dim = ndims[0];
    int sx = stride.x;

    cuZFP::ConstantSetup::setup_1d();
    stream_bytes = cuZFP::decode1<T>(dim, sx, stream, out, bits_per_block); 

  }
  else if(d == 2)
  {
    uint2 dims;
    dims.x = ndims[0];
    dims.y = ndims[1];

    int2 s;
    s.x = stride.x; 
    s.y = stride.y; 

    cuZFP::ConstantSetup::setup_2d();
    stream_bytes = cuZFP::decode2<T>(dims, s, stream, out, bits_per_block); 
  }
  else std::cerr<<" d ==  "<<d<<" not implemented\n";
 
  return stream_bytes;
}

Word *setup_device_stream(zfp_stream *stream,const zfp_field *field)
{
  gettimeofday(&cuda_start110S, NULL);
  bool stream_device = cuZFP::is_gpu_ptr(stream->stream->begin);
  gettimeofday(&cuda_start110E, NULL);
  cuda110 = ((cuda_start110E.tv_sec*1000000+cuda_start110E.tv_usec)-(cuda_start110S.tv_sec*1000000+cuda_start110S.tv_usec))/1000000.0;

  assert(sizeof(word) == sizeof(Word)); // "CUDA version currently only supports 64bit words");

  if(stream_device)
  {
    return (Word*) stream->stream->begin;
  } 

  Word *d_stream = NULL;
  // TODO: we we have a real stream we can just ask it how big it is
  size_t max_size = zfp_stream_maximum_size(stream, field);

  printf("max_size=%u\n", max_size);
  gettimeofday(&cuda_start111S, NULL);
  cudaMalloc(&d_stream, max_size); // zfp buffer size. 
  cudaMemcpy(d_stream, stream->stream->begin, max_size, cudaMemcpyHostToDevice);
  gettimeofday(&cuda_start111E, NULL);
  cuda111 = ((cuda_start111E.tv_sec*1000000+cuda_start111E.tv_usec)-(cuda_start111S.tv_sec*1000000+cuda_start111S.tv_usec))/1000000.0; 
  return d_stream;
}

void * offset_void(zfp_type type, void *ptr, long long int offset)
{
  void * offset_ptr = NULL;
  if(type == zfp_type_float)
  {
    float* data = (float*) ptr;
    offset_ptr = (void*)(&data[offset]);
  }
  else if(type == zfp_type_double)
  {
    double* data = (double*) ptr;
    offset_ptr = (void*)(&data[offset]);
  }
  else if(type == zfp_type_int32)
  {
    int * data = (int*) ptr;
    offset_ptr = (void*)(&data[offset]);
  }
  else if(type == zfp_type_int64)
  {
    long long int * data = (long long int*) ptr;
    offset_ptr = (void*)(&data[offset]);
  }
  return offset_ptr;
}

void *setup_device_field(const zfp_field *field, const int3 &stride, long long int &offset)
{

  gettimeofday(&cuda_start100S, NULL);
  bool field_device = cuZFP::is_gpu_ptr(field->data);
  gettimeofday(&cuda_start100E, NULL);
  cuda100 = ((cuda_start100E.tv_sec*1000000+cuda_start100E.tv_usec)-(cuda_start100S.tv_sec*1000000+cuda_start100S.tv_usec))/1000000.0;

  if(field_device)
  {
    offset = 0;
    return field->data; // return the pointer to the array data.
  }
  uint dims[3];
  dims[0] = field->nx;
  dims[1] = field->ny;
  dims[2] = field->nz;

  size_t type_size = zfp_type_size(field->type);

  size_t field_size = 1;
  for(int i = 0; i < 3; ++i)
  {
    if(dims[i] != 0)
    {
      field_size *= dims[i];
    }
  }

  bool contig = internal::is_contigous(dims, stride, offset);
  
  void * host_ptr = offset_void(field->type, field->data, offset);;

  void *d_data = NULL;
  if(contig)
  {
    size_t field_bytes = type_size * field_size;
    printf("field_bytes=%u\n",  field_bytes);
    gettimeofday(&cuda_start101S, NULL);
    cudaMalloc(&d_data, field_bytes); // field_bytes=
    cudaMemcpy(d_data, host_ptr, field_bytes, cudaMemcpyHostToDevice);
    gettimeofday(&cuda_start101E, NULL);
    cuda101 = ((cuda_start101E.tv_sec*1000000+cuda_start101E.tv_usec)-(cuda_start101S.tv_sec*1000000+cuda_start101S.tv_usec))/1000000.0;

  }

  return offset_void(field->type, d_data, -offset);
}

void cleanup_device_ptr(void *orig_ptr, void *d_ptr, size_t bytes, long long int offset, zfp_type type)
{
  gettimeofday(&cuda_start30S, NULL);
  bool device = cuZFP::is_gpu_ptr(orig_ptr);
  gettimeofday(&cuda_start30E, NULL);
  cuda30 = ((cuda_start30E.tv_sec*1000000+cuda_start30E.tv_usec)-(cuda_start30S.tv_sec*1000000+cuda_start30S.tv_usec))/1000000.0;


  if(device)
  {
    return;
  }
  // from whence it came
  void *d_offset_ptr = offset_void(type, d_ptr, offset);
  void *h_offset_ptr = offset_void(type, orig_ptr, offset);

  if(bytes > 0)
  {
    gettimeofday(&cuda_start31S, NULL);
    cudaMemcpy(h_offset_ptr, d_offset_ptr, bytes, cudaMemcpyDeviceToHost);
    gettimeofday(&cuda_start31E, NULL);
    cuda31 = ((cuda_start31E.tv_sec*1000000+cuda_start31E.tv_usec)-(cuda_start31S.tv_sec*1000000+cuda_start31S.tv_usec))/1000000.0;
  }

  gettimeofday(&cuda_start32S, NULL);
  cudaFree(d_offset_ptr);
  gettimeofday(&cuda_start32E, NULL);
  cuda32 = ((cuda_start32E.tv_sec*1000000+cuda_start32E.tv_usec)-(cuda_start32S.tv_sec*1000000+cuda_start32S.tv_usec))/1000000.0;
}

} // namespace internal

size_t
cuda_compress(zfp_stream *stream, const zfp_field *field)
{
  //jwang
  
  gettimeofday(&cuda_start1S, NULL); //cuda1
  uint dims[3];
  dims[0] = field->nx;
  dims[1] = field->ny;
  dims[2] = field->nz;
  
  int3 stride;  
  stride.x = field->sx ? field->sx : 1;
  stride.y = field->sy ? field->sy : field->nx;
  stride.z = field->sz ? field->sz : field->nx * field->ny;
  
  size_t stream_bytes = 0;
  long long int offset = 0; 

  gettimeofday(&cuda_start10S, NULL); // cuda10
  void *d_data = internal::setup_device_field(field, stride, offset);
  gettimeofday(&cuda_start10E, NULL); // cuda10
  cuda10 = ((cuda_start10E.tv_sec*1000000+cuda_start10E.tv_usec)-(cuda_start10S.tv_sec*1000000+cuda_start10S.tv_usec))/1000000.0;

  if(d_data == NULL)
  {
    // null means the array is non-contiguous host mem which is not supported
    return 0;
  }
  gettimeofday(&cuda_start11S, NULL); // cuda11
  Word *d_stream = internal::setup_device_stream(stream, field);
  gettimeofday(&cuda_start11E, NULL); // cuda11
  cuda11 = ((cuda_start11E.tv_sec*1000000+cuda_start11E.tv_usec)-(cuda_start11S.tv_sec*1000000+cuda_start11S.tv_usec))/1000000.0;

  gettimeofday(&cuda_start1E, NULL); //cuda1
  gettimeofday(&cuda_start2S, NULL);
  
  if(field->type == zfp_type_float)
  {
    float* data = (float*) d_data;
    stream_bytes = internal::encode<float>(dims, stride, (int)stream->maxbits, data, d_stream); //
  }
  else if(field->type == zfp_type_double)
  {
    double* data = (double*) d_data;
    stream_bytes = internal::encode<double>(dims, stride, (int)stream->maxbits, data, d_stream); //
  }
  else if(field->type == zfp_type_int32)
  {
    int * data = (int*) d_data;
    stream_bytes = internal::encode<int>(dims, stride, (int)stream->maxbits, data, d_stream);
  }
  else if(field->type == zfp_type_int64)
  {
    long long int * data = (long long int*) d_data;
    stream_bytes = internal::encode<long long int>(dims, stride, (int)stream->maxbits, data, d_stream);
  }

  gettimeofday(&cuda_start2E, NULL); //cuda2
  gettimeofday(&cuda_start3S, NULL); //cuda3

  internal::cleanup_device_ptr(stream->stream->begin, d_stream, stream_bytes, 0, field->type);
  internal::cleanup_device_ptr(field->data, d_data, 0, offset, field->type);

  // zfp wants to flush the stream.
  // set bits to wsize because we already did that.
  size_t compressed_size = stream_bytes / sizeof(Word);
  stream->stream->bits = wsize;
  // set stream pointer to end of stream
  stream->stream->ptr = stream->stream->begin + compressed_size;
  gettimeofday(&cuda_start3E, NULL); //cuda3
  
  cuda1 = ((cuda_start1E.tv_sec*1000000+cuda_start1E.tv_usec)-(cuda_start1S.tv_sec*1000000+cuda_start1S.tv_usec))/1000000.0;
  cuda2 = ((cuda_start2E.tv_sec*1000000+cuda_start2E.tv_usec)-(cuda_start2S.tv_sec*1000000+cuda_start2S.tv_usec))/1000000.0;
  cuda3 = ((cuda_start3E.tv_sec*1000000+cuda_start3E.tv_usec)-(cuda_start3S.tv_sec*1000000+cuda_start3S.tv_usec))/1000000.0;

  return stream_bytes;
}


  
void 
cuda_decompress(zfp_stream *stream, zfp_field *field)
{
  uint dims[3];
  dims[0] = field->nx;
  dims[1] = field->ny;
  dims[2] = field->nz;
   
  int3 stride;  
  stride.x = field->sx ? field->sx : 1;
  stride.y = field->sy ? field->sy : field->nx;
  stride.z = field->sz ? field->sz : field->nx * field->ny;

  size_t decoded_bytes = 0;
  long long int offset = 0;
  void *d_data = internal::setup_device_field(field, stride, offset);
  
  if(d_data == NULL)
  {
    // null means the array is non-contiguous host mem which is not supported
    return;
  }

  Word *d_stream = internal::setup_device_stream(stream, field);

  if(field->type == zfp_type_float)
  {
    float *data = (float*) d_data;
    decoded_bytes = internal::decode(dims, stride, (int)stream->maxbits, d_stream, data);
    d_data = (void*) data;
  }
  else if(field->type == zfp_type_double)
  {
    double *data = (double*) d_data;
    decoded_bytes = internal::decode(dims, stride, (int)stream->maxbits, d_stream, data);
    d_data = (void*) data;
  }
  else if(field->type == zfp_type_int32)
  {
    int *data = (int*) d_data;
    decoded_bytes = internal::decode(dims, stride, (int)stream->maxbits, d_stream, data);
    d_data = (void*) data;
  }
  else if(field->type == zfp_type_int64)
  {
    long long int *data = (long long int*) d_data;
    decoded_bytes = internal::decode(dims, stride, (int)stream->maxbits, d_stream, data);
    d_data = (void*) data;
  }
  else
  {
    std::cerr<<"Cannot decompress: type unknown\n";
  }

   
  size_t type_size = zfp_type_size(field->type);

  size_t field_size = 1;
  for(int i = 0; i < 3; ++i)
  {
    if(dims[i] != 0)
    {
      field_size *= dims[i];
    }
  }
  
  size_t bytes = type_size * field_size;
  internal::cleanup_device_ptr(stream->stream->begin, d_stream, 0, 0, field->type);
  internal::cleanup_device_ptr(field->data, d_data, bytes, offset, field->type);
  
  // this is how zfp determins if this was a success
  size_t words_read = decoded_bytes / sizeof(Word);
  stream->stream->bits = wsize;
  // set stream pointer to end of stream
  stream->stream->ptr = stream->stream->begin + words_read;
}
