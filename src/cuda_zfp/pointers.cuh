#ifndef CUZFP_POINTERS_CUH
#define CUZFP_POINTERS_CUH

#include "ErrorCheck.h"
#include <iostream>


namespace cuZFP
{
// https://gitlab.kitware.com/third-party/nvpipe/blob/master/encode.c
bool is_gpu_ptr(const void *ptr)
{
  //struct timeval cuda_ptrS;
  //struct timeval cuda_ptrE;

  //gettimeofday(&cuda_ptrS, NULL); 
  cudaPointerAttributes atts;
  const cudaError_t perr = cudaPointerGetAttributes(&atts, ptr);
  //gettimeofday(&cuda_ptrE, NULL);

  // clear last error so other error checking does
  // not pick it up
  cudaError_t error = cudaGetLastError();
  // CUDART_VERSION=9020
#if CUDART_VERSION >= 10000
  int result = perr == cudaSuccess &&
                (atts.type == cudaMemoryTypeDevice ||
                 atts.type == cudaMemoryTypeManaged);
#else
  int result = perr == cudaSuccess && atts.memoryType == cudaMemoryTypeDevice;

#endif
  //double cuda_ptr = ((cuda_ptrE.tv_sec*1000000+cuda_ptrE.tv_usec)-(cuda_ptrS.tv_sec*1000000+cuda_ptrS.tv_usec))/1000000.0;
  //printf("cuda_ptr=%f\n", cuda_1);

  
  
  return result;
}

} // namespace cuZFP

#endif
