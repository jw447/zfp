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
include tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/depend.make

# Include the progress variables for this target.
include tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/progress.make

# Include the compile flags for this target's objects.
include tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/flags.make

tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/testZfpDecodeBlock3dDouble.c.o: tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/flags.make
tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/testZfpDecodeBlock3dDouble.c.o: ../tests/src/decode/testZfpDecodeBlock3dDouble.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/testZfpDecodeBlock3dDouble.c.o"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/decode && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/testZfpDecodeBlock3dDouble.dir/testZfpDecodeBlock3dDouble.c.o   -c /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/src/decode/testZfpDecodeBlock3dDouble.c

tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/testZfpDecodeBlock3dDouble.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/testZfpDecodeBlock3dDouble.dir/testZfpDecodeBlock3dDouble.c.i"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/decode && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/src/decode/testZfpDecodeBlock3dDouble.c > CMakeFiles/testZfpDecodeBlock3dDouble.dir/testZfpDecodeBlock3dDouble.c.i

tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/testZfpDecodeBlock3dDouble.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/testZfpDecodeBlock3dDouble.dir/testZfpDecodeBlock3dDouble.c.s"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/decode && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/src/decode/testZfpDecodeBlock3dDouble.c -o CMakeFiles/testZfpDecodeBlock3dDouble.dir/testZfpDecodeBlock3dDouble.c.s

# Object files for target testZfpDecodeBlock3dDouble
testZfpDecodeBlock3dDouble_OBJECTS = \
"CMakeFiles/testZfpDecodeBlock3dDouble.dir/testZfpDecodeBlock3dDouble.c.o"

# External object files for target testZfpDecodeBlock3dDouble
testZfpDecodeBlock3dDouble_EXTERNAL_OBJECTS =

bin/testZfpDecodeBlock3dDouble: tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/testZfpDecodeBlock3dDouble.c.o
bin/testZfpDecodeBlock3dDouble: tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/build.make
bin/testZfpDecodeBlock3dDouble: cmocka-build/src/libcmocka.a
bin/testZfpDecodeBlock3dDouble: lib64/libzfp.so.0.5.5
bin/testZfpDecodeBlock3dDouble: lib64/librand64Lib.so
bin/testZfpDecodeBlock3dDouble: lib64/libzfpHashLib.so
bin/testZfpDecodeBlock3dDouble: lib64/libzfpChecksumsLib.so
bin/testZfpDecodeBlock3dDouble: tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../bin/testZfpDecodeBlock3dDouble"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/decode && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testZfpDecodeBlock3dDouble.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/build: bin/testZfpDecodeBlock3dDouble

.PHONY : tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/build

tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/clean:
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/decode && $(CMAKE_COMMAND) -P CMakeFiles/testZfpDecodeBlock3dDouble.dir/cmake_clean.cmake
.PHONY : tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/clean

tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/depend:
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/src/decode /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/decode /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/src/decode/CMakeFiles/testZfpDecodeBlock3dDouble.dir/depend

