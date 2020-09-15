# CMake generated Testfile for 
# Source directory: /home/ubuntu/local_build/zfp/tests
# Build directory: /home/ubuntu/local_build/zfp/build_debug/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(small-arrays-1d-fp32 "/home/ubuntu/local_build/zfp/build_debug/bin/testzfp" "small" "1d" "fp32")
add_test(small-arrays-1d-fp64 "/home/ubuntu/local_build/zfp/build_debug/bin/testzfp" "small" "1d" "fp64")
add_test(small-arrays-2d-fp32 "/home/ubuntu/local_build/zfp/build_debug/bin/testzfp" "small" "2d" "fp32")
add_test(small-arrays-2d-fp64 "/home/ubuntu/local_build/zfp/build_debug/bin/testzfp" "small" "2d" "fp64")
add_test(small-arrays-3d-fp32 "/home/ubuntu/local_build/zfp/build_debug/bin/testzfp" "small" "3d" "fp32")
add_test(small-arrays-3d-fp64 "/home/ubuntu/local_build/zfp/build_debug/bin/testzfp" "small" "3d" "fp64")
add_test(small-arrays-4d-fp32 "/home/ubuntu/local_build/zfp/build_debug/bin/testzfp" "small" "4d" "fp32")
add_test(small-arrays-4d-fp64 "/home/ubuntu/local_build/zfp/build_debug/bin/testzfp" "small" "4d" "fp64")
subdirs(utils)
subdirs(src)
subdirs(../googletest-build)
subdirs(array)
