#!/bin/bash

set -e 
set -x

module load cmake/3.15.2
module load cuda/10.1.168
which nvcc

cd build_debug
cmake -DZFP_WITH_OPENMP=ON -DZFP_WITH_CUDA=ON -DBUILD_EXAMPLES=OFF ..
make -j4

