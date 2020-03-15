# CMake generated Testfile for 
# Source directory: /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests
# Build directory: /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(small-arrays-1d-fp32 "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/bin/testzfp" "small" "1d" "fp32")
set_tests_properties(small-arrays-1d-fp32 PROPERTIES  _BACKTRACE_TRIPLES "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/CMakeLists.txt;118;add_test;/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/CMakeLists.txt;0;")
add_test(small-arrays-1d-fp64 "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/bin/testzfp" "small" "1d" "fp64")
set_tests_properties(small-arrays-1d-fp64 PROPERTIES  _BACKTRACE_TRIPLES "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/CMakeLists.txt;118;add_test;/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/CMakeLists.txt;0;")
add_test(small-arrays-2d-fp32 "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/bin/testzfp" "small" "2d" "fp32")
set_tests_properties(small-arrays-2d-fp32 PROPERTIES  _BACKTRACE_TRIPLES "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/CMakeLists.txt;118;add_test;/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/CMakeLists.txt;0;")
add_test(small-arrays-2d-fp64 "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/bin/testzfp" "small" "2d" "fp64")
set_tests_properties(small-arrays-2d-fp64 PROPERTIES  _BACKTRACE_TRIPLES "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/CMakeLists.txt;118;add_test;/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/CMakeLists.txt;0;")
add_test(small-arrays-3d-fp32 "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/bin/testzfp" "small" "3d" "fp32")
set_tests_properties(small-arrays-3d-fp32 PROPERTIES  _BACKTRACE_TRIPLES "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/CMakeLists.txt;118;add_test;/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/CMakeLists.txt;0;")
add_test(small-arrays-3d-fp64 "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/bin/testzfp" "small" "3d" "fp64")
set_tests_properties(small-arrays-3d-fp64 PROPERTIES  _BACKTRACE_TRIPLES "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/CMakeLists.txt;118;add_test;/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/CMakeLists.txt;0;")
add_test(small-arrays-4d-fp32 "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/bin/testzfp" "small" "4d" "fp32")
set_tests_properties(small-arrays-4d-fp32 PROPERTIES  _BACKTRACE_TRIPLES "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/CMakeLists.txt;118;add_test;/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/CMakeLists.txt;0;")
add_test(small-arrays-4d-fp64 "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/bin/testzfp" "small" "4d" "fp64")
set_tests_properties(small-arrays-4d-fp64 PROPERTIES  _BACKTRACE_TRIPLES "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/CMakeLists.txt;118;add_test;/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/CMakeLists.txt;0;")
subdirs("utils")
subdirs("src")
subdirs("../googletest-build")
subdirs("array")
