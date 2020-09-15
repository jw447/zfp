# CMake generated Testfile for 
# Source directory: /home/cc/local_build/zfp/tests/src/execPolicy
# Build directory: /home/cc/local_build/zfp/build_debug/tests/src/execPolicy
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(testOmp "/home/cc/local_build/zfp/build_debug/bin/testOmp")
set_tests_properties(testOmp PROPERTIES  RUN_SERIAL "TRUE")
add_test(testOmpInternal "/home/cc/local_build/zfp/build_debug/bin/testOmpInternal")
add_test(testCuda "/home/cc/local_build/zfp/build_debug/bin/testCuda")
