# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /autofs/nccs-svm1_sw/summit/.swci/0-core/opt/spack/20180914/linux-rhel7-ppc64le/gcc-4.8.5/cmake-3.15.2-xit2o3iepxvqbyku77lwcugufilztu7t/bin/cmake

# The command to remove a file.
RM = /autofs/nccs-svm1_sw/summit/.swci/0-core/opt/spack/20180914/linux-rhel7-ppc64le/gcc-4.8.5/cmake-3.15.2-xit2o3iepxvqbyku77lwcugufilztu7t/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug

# Include any dependencies generated for this target.
include tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/depend.make

# Include the progress variables for this target.
include tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/progress.make

# Include the compile flags for this target's objects.
include tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/flags.make

tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/testZfpOmp3dInt32.c.o: tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/flags.make
tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/testZfpOmp3dInt32.c.o: ../tests/src/endtoend/testZfpOmp3dInt32.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/testZfpOmp3dInt32.c.o"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/endtoend && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/testZfpOmp3dInt32.dir/testZfpOmp3dInt32.c.o   -c /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/src/endtoend/testZfpOmp3dInt32.c

tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/testZfpOmp3dInt32.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/testZfpOmp3dInt32.dir/testZfpOmp3dInt32.c.i"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/endtoend && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/src/endtoend/testZfpOmp3dInt32.c > CMakeFiles/testZfpOmp3dInt32.dir/testZfpOmp3dInt32.c.i

tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/testZfpOmp3dInt32.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/testZfpOmp3dInt32.dir/testZfpOmp3dInt32.c.s"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/endtoend && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/src/endtoend/testZfpOmp3dInt32.c -o CMakeFiles/testZfpOmp3dInt32.dir/testZfpOmp3dInt32.c.s

# Object files for target testZfpOmp3dInt32
testZfpOmp3dInt32_OBJECTS = \
"CMakeFiles/testZfpOmp3dInt32.dir/testZfpOmp3dInt32.c.o"

# External object files for target testZfpOmp3dInt32
testZfpOmp3dInt32_EXTERNAL_OBJECTS =

bin/testZfpOmp3dInt32: tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/testZfpOmp3dInt32.c.o
bin/testZfpOmp3dInt32: tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/build.make
bin/testZfpOmp3dInt32: cmocka-build/src/libcmocka.a
bin/testZfpOmp3dInt32: lib64/libzfp.so.0.5.5
bin/testZfpOmp3dInt32: lib64/libzfpHashLib.so
bin/testZfpOmp3dInt32: lib64/libgenSmoothRandNumsLib.so
bin/testZfpOmp3dInt32: lib64/libstridedOperationsLib.so
bin/testZfpOmp3dInt32: lib64/libzfpChecksumsLib.so
bin/testZfpOmp3dInt32: lib64/libzfpTimerLib.so
bin/testZfpOmp3dInt32: lib64/libzfpCompressionParamsLib.so
bin/testZfpOmp3dInt32: /usr/lib/gcc/ppc64le-redhat-linux/4.8.5/libgomp.so
bin/testZfpOmp3dInt32: /usr/lib64/libpthread.so
bin/testZfpOmp3dInt32: tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../bin/testZfpOmp3dInt32"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/endtoend && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testZfpOmp3dInt32.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/build: bin/testZfpOmp3dInt32

.PHONY : tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/build

tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/clean:
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/endtoend && $(CMAKE_COMMAND) -P CMakeFiles/testZfpOmp3dInt32.dir/cmake_clean.cmake
.PHONY : tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/clean

tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/depend:
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/src/endtoend /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/endtoend /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/src/endtoend/CMakeFiles/testZfpOmp3dInt32.dir/depend

