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
include tests/array/CMakeFiles/testArray1fRefs.dir/depend.make

# Include the progress variables for this target.
include tests/array/CMakeFiles/testArray1fRefs.dir/progress.make

# Include the compile flags for this target's objects.
include tests/array/CMakeFiles/testArray1fRefs.dir/flags.make

tests/array/CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.o: tests/array/CMakeFiles/testArray1fRefs.dir/flags.make
tests/array/CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.o: ../tests/array/testArray1fRefs.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cc/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/array/CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.o"
	cd /home/cc/local_build/zfp/build_debug/tests/array && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.o -c /home/cc/local_build/zfp/tests/array/testArray1fRefs.cpp

tests/array/CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.i"
	cd /home/cc/local_build/zfp/build_debug/tests/array && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cc/local_build/zfp/tests/array/testArray1fRefs.cpp > CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.i

tests/array/CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.s"
	cd /home/cc/local_build/zfp/build_debug/tests/array && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cc/local_build/zfp/tests/array/testArray1fRefs.cpp -o CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.s

tests/array/CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.o.requires:

.PHONY : tests/array/CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.o.requires

tests/array/CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.o.provides: tests/array/CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.o.requires
	$(MAKE) -f tests/array/CMakeFiles/testArray1fRefs.dir/build.make tests/array/CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.o.provides.build
.PHONY : tests/array/CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.o.provides

tests/array/CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.o.provides.build: tests/array/CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.o


# Object files for target testArray1fRefs
testArray1fRefs_OBJECTS = \
"CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.o"

# External object files for target testArray1fRefs
testArray1fRefs_EXTERNAL_OBJECTS =

bin/testArray1fRefs: tests/array/CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.o
bin/testArray1fRefs: tests/array/CMakeFiles/testArray1fRefs.dir/build.make
bin/testArray1fRefs: lib/libgtest_main.so
bin/testArray1fRefs: lib/libzfp.so.0.5.5
bin/testArray1fRefs: lib/libzfpHashLib.so
bin/testArray1fRefs: lib/librand32Lib.so
bin/testArray1fRefs: lib/libgtest.so
bin/testArray1fRefs: tests/array/CMakeFiles/testArray1fRefs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cc/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/testArray1fRefs"
	cd /home/cc/local_build/zfp/build_debug/tests/array && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testArray1fRefs.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/array/CMakeFiles/testArray1fRefs.dir/build: bin/testArray1fRefs

.PHONY : tests/array/CMakeFiles/testArray1fRefs.dir/build

tests/array/CMakeFiles/testArray1fRefs.dir/requires: tests/array/CMakeFiles/testArray1fRefs.dir/testArray1fRefs.cpp.o.requires

.PHONY : tests/array/CMakeFiles/testArray1fRefs.dir/requires

tests/array/CMakeFiles/testArray1fRefs.dir/clean:
	cd /home/cc/local_build/zfp/build_debug/tests/array && $(CMAKE_COMMAND) -P CMakeFiles/testArray1fRefs.dir/cmake_clean.cmake
.PHONY : tests/array/CMakeFiles/testArray1fRefs.dir/clean

tests/array/CMakeFiles/testArray1fRefs.dir/depend:
	cd /home/cc/local_build/zfp/build_debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cc/local_build/zfp /home/cc/local_build/zfp/tests/array /home/cc/local_build/zfp/build_debug /home/cc/local_build/zfp/build_debug/tests/array /home/cc/local_build/zfp/build_debug/tests/array/CMakeFiles/testArray1fRefs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/array/CMakeFiles/testArray1fRefs.dir/depend

