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
include tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/depend.make

# Include the progress variables for this target.
include tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/progress.make

# Include the compile flags for this target's objects.
include tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/flags.make

tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.o: tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/flags.make
tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.o: ../tests/src/endtoend/testZfpOmp3dDouble.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.o"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.o   -c /home/ubuntu/local_build/zfp/tests/src/endtoend/testZfpOmp3dDouble.c

tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.i"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/local_build/zfp/tests/src/endtoend/testZfpOmp3dDouble.c > CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.i

tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.s"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/local_build/zfp/tests/src/endtoend/testZfpOmp3dDouble.c -o CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.s

tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.o.requires:

.PHONY : tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.o.requires

tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.o.provides: tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.o.requires
	$(MAKE) -f tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/build.make tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.o.provides.build
.PHONY : tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.o.provides

tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.o.provides.build: tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.o


# Object files for target testZfpOmp3dDouble
testZfpOmp3dDouble_OBJECTS = \
"CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.o"

# External object files for target testZfpOmp3dDouble
testZfpOmp3dDouble_EXTERNAL_OBJECTS =

bin/testZfpOmp3dDouble: tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.o
bin/testZfpOmp3dDouble: tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/build.make
bin/testZfpOmp3dDouble: cmocka-build/src/libcmocka.a
bin/testZfpOmp3dDouble: lib/libzfp.so.0.5.5
bin/testZfpOmp3dDouble: lib/libzfpHashLib.so
bin/testZfpOmp3dDouble: lib/libgenSmoothRandNumsLib.so
bin/testZfpOmp3dDouble: lib/libstridedOperationsLib.so
bin/testZfpOmp3dDouble: lib/libzfpChecksumsLib.so
bin/testZfpOmp3dDouble: lib/libzfpTimerLib.so
bin/testZfpOmp3dDouble: lib/libzfpCompressionParamsLib.so
bin/testZfpOmp3dDouble: tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../bin/testZfpOmp3dDouble"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testZfpOmp3dDouble.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/build: bin/testZfpOmp3dDouble

.PHONY : tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/build

tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/requires: tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/testZfpOmp3dDouble.c.o.requires

.PHONY : tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/requires

tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/clean:
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend && $(CMAKE_COMMAND) -P CMakeFiles/testZfpOmp3dDouble.dir/cmake_clean.cmake
.PHONY : tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/clean

tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/depend:
	cd /home/ubuntu/local_build/zfp/build_debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/local_build/zfp /home/ubuntu/local_build/zfp/tests/src/endtoend /home/ubuntu/local_build/zfp/build_debug /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/src/endtoend/CMakeFiles/testZfpOmp3dDouble.dir/depend

