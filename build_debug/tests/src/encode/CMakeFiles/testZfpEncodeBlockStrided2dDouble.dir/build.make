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
include tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/depend.make

# Include the progress variables for this target.
include tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/progress.make

# Include the compile flags for this target's objects.
include tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/flags.make

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/testZfpEncodeBlockStrided2dDouble.c.o: tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/flags.make
tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/testZfpEncodeBlockStrided2dDouble.c.o: ../tests/src/encode/testZfpEncodeBlockStrided2dDouble.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/testZfpEncodeBlockStrided2dDouble.c.o"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/encode && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/testZfpEncodeBlockStrided2dDouble.c.o   -c /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/src/encode/testZfpEncodeBlockStrided2dDouble.c

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/testZfpEncodeBlockStrided2dDouble.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/testZfpEncodeBlockStrided2dDouble.c.i"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/encode && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/src/encode/testZfpEncodeBlockStrided2dDouble.c > CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/testZfpEncodeBlockStrided2dDouble.c.i

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/testZfpEncodeBlockStrided2dDouble.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/testZfpEncodeBlockStrided2dDouble.c.s"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/encode && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/src/encode/testZfpEncodeBlockStrided2dDouble.c -o CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/testZfpEncodeBlockStrided2dDouble.c.s

# Object files for target testZfpEncodeBlockStrided2dDouble
testZfpEncodeBlockStrided2dDouble_OBJECTS = \
"CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/testZfpEncodeBlockStrided2dDouble.c.o"

# External object files for target testZfpEncodeBlockStrided2dDouble
testZfpEncodeBlockStrided2dDouble_EXTERNAL_OBJECTS =

bin/testZfpEncodeBlockStrided2dDouble: tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/testZfpEncodeBlockStrided2dDouble.c.o
bin/testZfpEncodeBlockStrided2dDouble: tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/build.make
bin/testZfpEncodeBlockStrided2dDouble: cmocka-build/src/libcmocka.a
bin/testZfpEncodeBlockStrided2dDouble: lib64/libzfp.so.0.5.5
bin/testZfpEncodeBlockStrided2dDouble: lib64/librand64Lib.so
bin/testZfpEncodeBlockStrided2dDouble: lib64/libzfpHashLib.so
bin/testZfpEncodeBlockStrided2dDouble: lib64/libzfpChecksumsLib.so
bin/testZfpEncodeBlockStrided2dDouble: tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../bin/testZfpEncodeBlockStrided2dDouble"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/encode && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/build: bin/testZfpEncodeBlockStrided2dDouble

.PHONY : tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/build

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/clean:
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/encode && $(CMAKE_COMMAND) -P CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/cmake_clean.cmake
.PHONY : tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/clean

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/depend:
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/src/encode /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/encode /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dDouble.dir/depend

