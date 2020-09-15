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
include tests/src/misc/CMakeFiles/testZfpStream.dir/depend.make

# Include the progress variables for this target.
include tests/src/misc/CMakeFiles/testZfpStream.dir/progress.make

# Include the compile flags for this target's objects.
include tests/src/misc/CMakeFiles/testZfpStream.dir/flags.make

tests/src/misc/CMakeFiles/testZfpStream.dir/testZfpStream.c.o: tests/src/misc/CMakeFiles/testZfpStream.dir/flags.make
tests/src/misc/CMakeFiles/testZfpStream.dir/testZfpStream.c.o: ../tests/src/misc/testZfpStream.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cc/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/src/misc/CMakeFiles/testZfpStream.dir/testZfpStream.c.o"
	cd /home/cc/local_build/zfp/build_debug/tests/src/misc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/testZfpStream.dir/testZfpStream.c.o   -c /home/cc/local_build/zfp/tests/src/misc/testZfpStream.c

tests/src/misc/CMakeFiles/testZfpStream.dir/testZfpStream.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/testZfpStream.dir/testZfpStream.c.i"
	cd /home/cc/local_build/zfp/build_debug/tests/src/misc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cc/local_build/zfp/tests/src/misc/testZfpStream.c > CMakeFiles/testZfpStream.dir/testZfpStream.c.i

tests/src/misc/CMakeFiles/testZfpStream.dir/testZfpStream.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/testZfpStream.dir/testZfpStream.c.s"
	cd /home/cc/local_build/zfp/build_debug/tests/src/misc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cc/local_build/zfp/tests/src/misc/testZfpStream.c -o CMakeFiles/testZfpStream.dir/testZfpStream.c.s

tests/src/misc/CMakeFiles/testZfpStream.dir/testZfpStream.c.o.requires:

.PHONY : tests/src/misc/CMakeFiles/testZfpStream.dir/testZfpStream.c.o.requires

tests/src/misc/CMakeFiles/testZfpStream.dir/testZfpStream.c.o.provides: tests/src/misc/CMakeFiles/testZfpStream.dir/testZfpStream.c.o.requires
	$(MAKE) -f tests/src/misc/CMakeFiles/testZfpStream.dir/build.make tests/src/misc/CMakeFiles/testZfpStream.dir/testZfpStream.c.o.provides.build
.PHONY : tests/src/misc/CMakeFiles/testZfpStream.dir/testZfpStream.c.o.provides

tests/src/misc/CMakeFiles/testZfpStream.dir/testZfpStream.c.o.provides.build: tests/src/misc/CMakeFiles/testZfpStream.dir/testZfpStream.c.o


# Object files for target testZfpStream
testZfpStream_OBJECTS = \
"CMakeFiles/testZfpStream.dir/testZfpStream.c.o"

# External object files for target testZfpStream
testZfpStream_EXTERNAL_OBJECTS =

bin/testZfpStream: tests/src/misc/CMakeFiles/testZfpStream.dir/testZfpStream.c.o
bin/testZfpStream: tests/src/misc/CMakeFiles/testZfpStream.dir/build.make
bin/testZfpStream: cmocka-build/src/libcmocka.a
bin/testZfpStream: lib/libzfp.so.0.5.5
bin/testZfpStream: tests/src/misc/CMakeFiles/testZfpStream.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cc/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../bin/testZfpStream"
	cd /home/cc/local_build/zfp/build_debug/tests/src/misc && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testZfpStream.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/src/misc/CMakeFiles/testZfpStream.dir/build: bin/testZfpStream

.PHONY : tests/src/misc/CMakeFiles/testZfpStream.dir/build

tests/src/misc/CMakeFiles/testZfpStream.dir/requires: tests/src/misc/CMakeFiles/testZfpStream.dir/testZfpStream.c.o.requires

.PHONY : tests/src/misc/CMakeFiles/testZfpStream.dir/requires

tests/src/misc/CMakeFiles/testZfpStream.dir/clean:
	cd /home/cc/local_build/zfp/build_debug/tests/src/misc && $(CMAKE_COMMAND) -P CMakeFiles/testZfpStream.dir/cmake_clean.cmake
.PHONY : tests/src/misc/CMakeFiles/testZfpStream.dir/clean

tests/src/misc/CMakeFiles/testZfpStream.dir/depend:
	cd /home/cc/local_build/zfp/build_debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cc/local_build/zfp /home/cc/local_build/zfp/tests/src/misc /home/cc/local_build/zfp/build_debug /home/cc/local_build/zfp/build_debug/tests/src/misc /home/cc/local_build/zfp/build_debug/tests/src/misc/CMakeFiles/testZfpStream.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/src/misc/CMakeFiles/testZfpStream.dir/depend

