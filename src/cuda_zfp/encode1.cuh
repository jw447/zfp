#ifndef CUZFP_ENCODE1_CUH
#define CUZFP_ENCODE1_CUH

#include "cuZFP.h"
#include "shared.h"
#include "encode.cuh"
#include "type_info.cuh"

#include "cuda_profiler_api.h"

#include <iostream>
#include <stdio.h>
#include <math.h>
#define ZFP_1D_BLOCK_SIZE 4 


namespace cuZFP
{

template<typename Scalar> 
__device__ __host__ inline 
void gather_partial1(Scalar* q, const Scalar* p, int nx, int sx)
{
  uint x;
  for (x = 0; x < nx; x++, p += sx)
    q[x] = *p;
  pad_block(q, nx, 1);
}

template<typename Scalar> 
__device__ __host__ inline 
void gather1(Scalar* q, const Scalar* p, int sx)
{
  uint x;
  for (x = 0; x < 4; x++, p += sx)
    *q++ = *p;
}

template<class Scalar>
__global__
void cudaEncode1(const uint maxbits,
           const Scalar* scalars,
           Word *stream,
           const uint dim,
           const int sx,
           const uint padded_dim,
           const uint tot_blocks,
           GPU_timing* gpu_timing_d) // pass device pointer here
{
  clock_t start_time = clock();
  typedef unsigned long long int ull;
  typedef long long int ll;
  const ull blockId = blockIdx.x +
                      blockIdx.y * gridDim.x +
                      gridDim.x * gridDim.y * blockIdx.z;

  // each thread gets a block so the block index is 
  // the global thread index
  const uint block_idx = blockId * blockDim.x + threadIdx.x;

  if(block_idx >= tot_blocks)
  {
    // we can't launch the exact number of blocks
    // so just exit if this isn't real
    return;
  }

  uint block_dim;
  block_dim = padded_dim >> 2; 

  // logical pos in 3d array
  uint block;
  block = (block_idx % block_dim) * 4; 

  const ll offset = (ll)block * sx; 

  Scalar fblock[ZFP_1D_BLOCK_SIZE]; 

  bool partial = false;
  if(block + 4 > dim) partial = true;
 
  if(partial) 
  {
    uint nx = 4 - (padded_dim - dim);
    gather_partial1(fblock, scalars + offset, nx, sx);
  }
  else
  {
    gather1(fblock, scalars + offset, sx);
  }
  clock_t pre_time = clock();
  zfp_encode_block<Scalar, ZFP_1D_BLOCK_SIZE>(fblock, maxbits, block_idx, stream, gpu_timing_d);
  clock_t end_time = clock();
  (*gpu_timing_d).pre_clock = (int)(pre_time - start_time);
  (*gpu_timing_d).encode_clock = (int)(end_time - pre_time);
  (*gpu_timing_d).kernel_clock = (int)(end_time - start_time);
}
//
// Launch the encode kernel
//
template<class Scalar>
size_t encode1launch(uint dim, 
                     int sx,
                     const Scalar *d_data,
                     Word *stream,
                     const int maxbits,
                     CPU_timing* cpu_timing,
                     GPU_timing* gpu_timing_h) // pass host device here
{
  //struct timeval cuda_start213S, cuda_start213E;
  //struct timeval cuda_start214S, cuda_start214E;
  //gettimeofday(&cuda_start212S, NULL); //cuda_22
  //gettimeofday(&cuda_start213S, NULL); //cuda_22
  const int cuda_block_size = 1024;
  dim3 block_size = dim3(cuda_block_size, 1, 1);
  uint zfp_pad(dim); 
  if(zfp_pad % 4 != 0) zfp_pad += 4 - dim % 4;

  const uint zfp_blocks = (zfp_pad) / 4; 
  //
  // we need to ensure that we launch a multiple of the 
  // cuda block size
  //
  int block_pad = 0; 
  if(zfp_blocks % cuda_block_size != 0)
  {
    block_pad = cuda_block_size - zfp_blocks % cuda_block_size; 
  }

  size_t total_blocks = block_pad + zfp_blocks;
 
  dim3 grid_size = calculate_grid_size(total_blocks, cuda_block_size);

  size_t stream_bytes = calc_device_mem1d(zfp_pad, maxbits);
  // ensure we have zeros
  cudaMemset(stream, 0, stream_bytes);

  //gettimeofday(&cuda_start213E, NULL); //cuda_22
  //float cuda_23 = (float)((cuda_start213E.tv_sec*1000000+cuda_start213E.tv_usec)-(cuda_start213S.tv_sec*1000000+cuda_start213S.tv_usec))/1000000.0;
  //printf("cuda_23=%f\n", cuda_23);

  GPU_timing *gpu_timing_d;
  cudaMalloc(&gpu_timing_d, sizeof(GPU_timing));
  cudaMemset(gpu_timing_d, 0, sizeof(GPU_timing));
 
#ifdef CUDA_ZFP_RATE_PRINT
  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  cudaEventRecord(start);
#endif
  //gettimeofday(&cuda_start214S, NULL);
  cudaEncode1<Scalar> <<<grid_size, block_size>>>
  (maxbits,
     d_data,
     stream,
     dim,
     sx,
     zfp_pad,
     zfp_blocks,
     gpu_timing_d);

#ifdef CUDA_ZFP_RATE_PRINT
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);

  //gettimeofday(&cuda_start214E, NULL);
  //float cuda_24 = (float)((cuda_start214E.tv_sec*1000000+cuda_start214E.tv_usec)-(cuda_start214S.tv_sec*1000000+cuda_start214S.tv_usec))/1000000.0;
  //printf("cuda_24=%f\n", cuda_24);

  float miliseconds = 0.f;
  cudaEventElapsedTime(&miliseconds, start, stop);
  (*cpu_timing).cuda_kernel_time = miliseconds / 1000.f;
  cudaMemcpy(gpu_timing_h, gpu_timing_d, sizeof(GPU_timing), cudaMemcpyDeviceToHost);
  cudaFree(gpu_timing_d);
#endif
  //gettimeofday(&cuda_start212E, NULL);
  //float cuda_22 = (float)((cuda_start212E.tv_sec*1000000+cuda_start212E.tv_usec)-(cuda_start212S.tv_sec*1000000+cuda_start212S.tv_usec))/1000000.0;
  //printf("cuda_22=%f\n", cuda_22); 
  return stream_bytes;
}

//
// Encode a host vector and output a encoded device vector
//
template<class Scalar>
size_t encode1(int dim,
               int sx,
               Scalar *d_data,
               Word *stream,
               const int maxbits,
               CPU_timing* cpu_timing,
               GPU_timing* gpu_timing)
{
  return encode1launch<Scalar>(dim, sx, d_data, stream, maxbits, cpu_timing, gpu_timing);
}

}

#endif
