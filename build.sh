#!/bin/bash

set -e 

set -x

module load cmake/3.15.2
module load cuda/9.2.148

cd build
cmake -DZFP_WITH_OPENMP=ON -DZFP_WITH_CUDA=ON ..
make

