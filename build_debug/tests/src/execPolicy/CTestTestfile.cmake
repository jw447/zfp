# CMake generated Testfile for 
# Source directory: /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/src/execPolicy
# Build directory: /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/execPolicy
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(testOmp "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/bin/testOmp")
set_tests_properties(testOmp PROPERTIES  _BACKTRACE_TRIPLES "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/src/execPolicy/CMakeLists.txt;3;add_test;/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/src/execPolicy/CMakeLists.txt;0;")
add_test(testCuda "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/bin/testCuda")
set_tests_properties(testCuda PROPERTIES  _BACKTRACE_TRIPLES "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/src/execPolicy/CMakeLists.txt;21;add_test;/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/src/execPolicy/CMakeLists.txt;0;")
