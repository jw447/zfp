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
include tests/array/CMakeFiles/testArray1d.dir/depend.make

# Include the progress variables for this target.
include tests/array/CMakeFiles/testArray1d.dir/progress.make

# Include the compile flags for this target's objects.
include tests/array/CMakeFiles/testArray1d.dir/flags.make

tests/array/CMakeFiles/testArray1d.dir/testArray1d.cpp.o: tests/array/CMakeFiles/testArray1d.dir/flags.make
tests/array/CMakeFiles/testArray1d.dir/testArray1d.cpp.o: ../tests/array/testArray1d.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/array/CMakeFiles/testArray1d.dir/testArray1d.cpp.o"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/array && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/testArray1d.dir/testArray1d.cpp.o -c /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/array/testArray1d.cpp

tests/array/CMakeFiles/testArray1d.dir/testArray1d.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/testArray1d.dir/testArray1d.cpp.i"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/array && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/array/testArray1d.cpp > CMakeFiles/testArray1d.dir/testArray1d.cpp.i

tests/array/CMakeFiles/testArray1d.dir/testArray1d.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/testArray1d.dir/testArray1d.cpp.s"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/array && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/array/testArray1d.cpp -o CMakeFiles/testArray1d.dir/testArray1d.cpp.s

# Object files for target testArray1d
testArray1d_OBJECTS = \
"CMakeFiles/testArray1d.dir/testArray1d.cpp.o"

# External object files for target testArray1d
testArray1d_EXTERNAL_OBJECTS =

bin/testArray1d: tests/array/CMakeFiles/testArray1d.dir/testArray1d.cpp.o
bin/testArray1d: tests/array/CMakeFiles/testArray1d.dir/build.make
bin/testArray1d: lib64/libgtest_main.so
bin/testArray1d: lib64/libzfp.so.0.5.5
bin/testArray1d: lib64/libzfpHashLib.so
bin/testArray1d: lib64/libgenSmoothRandNumsLib.so
bin/testArray1d: lib64/libzfpChecksumsLib.so
bin/testArray1d: lib64/libgtest.so
bin/testArray1d: tests/array/CMakeFiles/testArray1d.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/testArray1d"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/array && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testArray1d.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/array/CMakeFiles/testArray1d.dir/build: bin/testArray1d

.PHONY : tests/array/CMakeFiles/testArray1d.dir/build

tests/array/CMakeFiles/testArray1d.dir/clean:
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/array && $(CMAKE_COMMAND) -P CMakeFiles/testArray1d.dir/cmake_clean.cmake
.PHONY : tests/array/CMakeFiles/testArray1d.dir/clean

tests/array/CMakeFiles/testArray1d.dir/depend:
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/array /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/array /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/array/CMakeFiles/testArray1d.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/array/CMakeFiles/testArray1d.dir/depend

