# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/cc/local_build/zfp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cc/local_build/zfp/build_debug

# Include any dependencies generated for this target.
include tests/array/CMakeFiles/testArray1dRefs.dir/depend.make

# Include the progress variables for this target.
include tests/array/CMakeFiles/testArray1dRefs.dir/progress.make

# Include the compile flags for this target's objects.
include tests/array/CMakeFiles/testArray1dRefs.dir/flags.make

tests/array/CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.o: tests/array/CMakeFiles/testArray1dRefs.dir/flags.make
tests/array/CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.o: ../tests/array/testArray1dRefs.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cc/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/array/CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.o"
	cd /home/cc/local_build/zfp/build_debug/tests/array && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.o -c /home/cc/local_build/zfp/tests/array/testArray1dRefs.cpp

tests/array/CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.i"
	cd /home/cc/local_build/zfp/build_debug/tests/array && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cc/local_build/zfp/tests/array/testArray1dRefs.cpp > CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.i

tests/array/CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.s"
	cd /home/cc/local_build/zfp/build_debug/tests/array && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cc/local_build/zfp/tests/array/testArray1dRefs.cpp -o CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.s

tests/array/CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.o.requires:

.PHONY : tests/array/CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.o.requires

tests/array/CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.o.provides: tests/array/CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.o.requires
	$(MAKE) -f tests/array/CMakeFiles/testArray1dRefs.dir/build.make tests/array/CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.o.provides.build
.PHONY : tests/array/CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.o.provides

tests/array/CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.o.provides.build: tests/array/CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.o


# Object files for target testArray1dRefs
testArray1dRefs_OBJECTS = \
"CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.o"

# External object files for target testArray1dRefs
testArray1dRefs_EXTERNAL_OBJECTS =

bin/testArray1dRefs: tests/array/CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.o
bin/testArray1dRefs: tests/array/CMakeFiles/testArray1dRefs.dir/build.make
bin/testArray1dRefs: lib/libgtest_main.so
bin/testArray1dRefs: lib/libzfp.so.0.5.5
bin/testArray1dRefs: lib/libzfpHashLib.so
bin/testArray1dRefs: lib/librand64Lib.so
bin/testArray1dRefs: lib/libgtest.so
bin/testArray1dRefs: tests/array/CMakeFiles/testArray1dRefs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cc/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/testArray1dRefs"
	cd /home/cc/local_build/zfp/build_debug/tests/array && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testArray1dRefs.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/array/CMakeFiles/testArray1dRefs.dir/build: bin/testArray1dRefs

.PHONY : tests/array/CMakeFiles/testArray1dRefs.dir/build

tests/array/CMakeFiles/testArray1dRefs.dir/requires: tests/array/CMakeFiles/testArray1dRefs.dir/testArray1dRefs.cpp.o.requires

.PHONY : tests/array/CMakeFiles/testArray1dRefs.dir/requires

tests/array/CMakeFiles/testArray1dRefs.dir/clean:
	cd /home/cc/local_build/zfp/build_debug/tests/array && $(CMAKE_COMMAND) -P CMakeFiles/testArray1dRefs.dir/cmake_clean.cmake
.PHONY : tests/array/CMakeFiles/testArray1dRefs.dir/clean

tests/array/CMakeFiles/testArray1dRefs.dir/depend:
	cd /home/cc/local_build/zfp/build_debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cc/local_build/zfp /home/cc/local_build/zfp/tests/array /home/cc/local_build/zfp/build_debug /home/cc/local_build/zfp/build_debug/tests/array /home/cc/local_build/zfp/build_debug/tests/array/CMakeFiles/testArray1dRefs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/array/CMakeFiles/testArray1dRefs.dir/depend

