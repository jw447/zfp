#!/bin/bash

set -e 
set -x

module load cmake/3.15.2
module load cuda/10.1.243

cd build_debug
cmake -DZFP_WITH_OPENMP=OFF -DZFP_WITH_CUDA=ON -DBUILD_EXAMPLES=OFF ..
make -j8

