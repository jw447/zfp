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
CMAKE_SOURCE_DIR = /home/ubuntu/local_build/zfp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/local_build/zfp/build_debug

# Include any dependencies generated for this target.
include tests/src/execPolicy/CMakeFiles/testOmp.dir/depend.make

# Include the progress variables for this target.
include tests/src/execPolicy/CMakeFiles/testOmp.dir/progress.make

# Include the compile flags for this target's objects.
include tests/src/execPolicy/CMakeFiles/testOmp.dir/flags.make

tests/src/execPolicy/CMakeFiles/testOmp.dir/testOmp.c.o: tests/src/execPolicy/CMakeFiles/testOmp.dir/flags.make
tests/src/execPolicy/CMakeFiles/testOmp.dir/testOmp.c.o: ../tests/src/execPolicy/testOmp.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/src/execPolicy/CMakeFiles/testOmp.dir/testOmp.c.o"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/execPolicy && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/testOmp.dir/testOmp.c.o   -c /home/ubuntu/local_build/zfp/tests/src/execPolicy/testOmp.c

tests/src/execPolicy/CMakeFiles/testOmp.dir/testOmp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/testOmp.dir/testOmp.c.i"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/execPolicy && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/local_build/zfp/tests/src/execPolicy/testOmp.c > CMakeFiles/testOmp.dir/testOmp.c.i

tests/src/execPolicy/CMakeFiles/testOmp.dir/testOmp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/testOmp.dir/testOmp.c.s"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/execPolicy && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/local_build/zfp/tests/src/execPolicy/testOmp.c -o CMakeFiles/testOmp.dir/testOmp.c.s

tests/src/execPolicy/CMakeFiles/testOmp.dir/testOmp.c.o.requires:

.PHONY : tests/src/execPolicy/CMakeFiles/testOmp.dir/testOmp.c.o.requires

tests/src/execPolicy/CMakeFiles/testOmp.dir/testOmp.c.o.provides: tests/src/execPolicy/CMakeFiles/testOmp.dir/testOmp.c.o.requires
	$(MAKE) -f tests/src/execPolicy/CMakeFiles/testOmp.dir/build.make tests/src/execPolicy/CMakeFiles/testOmp.dir/testOmp.c.o.provides.build
.PHONY : tests/src/execPolicy/CMakeFiles/testOmp.dir/testOmp.c.o.provides

tests/src/execPolicy/CMakeFiles/testOmp.dir/testOmp.c.o.provides.build: tests/src/execPolicy/CMakeFiles/testOmp.dir/testOmp.c.o


# Object files for target testOmp
testOmp_OBJECTS = \
"CMakeFiles/testOmp.dir/testOmp.c.o"

# External object files for target testOmp
testOmp_EXTERNAL_OBJECTS =

bin/testOmp: tests/src/execPolicy/CMakeFiles/testOmp.dir/testOmp.c.o
bin/testOmp: tests/src/execPolicy/CMakeFiles/testOmp.dir/build.make
bin/testOmp: cmocka-build/src/libcmocka.a
bin/testOmp: lib/libzfp.so.0.5.5
bin/testOmp: tests/src/execPolicy/CMakeFiles/testOmp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../bin/testOmp"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/execPolicy && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testOmp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/src/execPolicy/CMakeFiles/testOmp.dir/build: bin/testOmp

.PHONY : tests/src/execPolicy/CMakeFiles/testOmp.dir/build

tests/src/execPolicy/CMakeFiles/testOmp.dir/requires: tests/src/execPolicy/CMakeFiles/testOmp.dir/testOmp.c.o.requires

.PHONY : tests/src/execPolicy/CMakeFiles/testOmp.dir/requires

tests/src/execPolicy/CMakeFiles/testOmp.dir/clean:
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/execPolicy && $(CMAKE_COMMAND) -P CMakeFiles/testOmp.dir/cmake_clean.cmake
.PHONY : tests/src/execPolicy/CMakeFiles/testOmp.dir/clean

tests/src/execPolicy/CMakeFiles/testOmp.dir/depend:
	cd /home/ubuntu/local_build/zfp/build_debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/local_build/zfp /home/ubuntu/local_build/zfp/tests/src/execPolicy /home/ubuntu/local_build/zfp/build_debug /home/ubuntu/local_build/zfp/build_debug/tests/src/execPolicy /home/ubuntu/local_build/zfp/build_debug/tests/src/execPolicy/CMakeFiles/testOmp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/src/execPolicy/CMakeFiles/testOmp.dir/depend

