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
include tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/depend.make

# Include the progress variables for this target.
include tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/progress.make

# Include the compile flags for this target's objects.
include tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/flags.make

tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.o: tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/flags.make
tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.o: ../tests/src/endtoend/testZfpSerial4dInt64.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.o"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.o   -c /home/ubuntu/local_build/zfp/tests/src/endtoend/testZfpSerial4dInt64.c

tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.i"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/local_build/zfp/tests/src/endtoend/testZfpSerial4dInt64.c > CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.i

tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.s"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/local_build/zfp/tests/src/endtoend/testZfpSerial4dInt64.c -o CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.s

tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.o.requires:

.PHONY : tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.o.requires

tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.o.provides: tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.o.requires
	$(MAKE) -f tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/build.make tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.o.provides.build
.PHONY : tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.o.provides

tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.o.provides.build: tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.o


# Object files for target testZfpSerial4dInt64
testZfpSerial4dInt64_OBJECTS = \
"CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.o"

# External object files for target testZfpSerial4dInt64
testZfpSerial4dInt64_EXTERNAL_OBJECTS =

bin/testZfpSerial4dInt64: tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.o
bin/testZfpSerial4dInt64: tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/build.make
bin/testZfpSerial4dInt64: cmocka-build/src/libcmocka.a
bin/testZfpSerial4dInt64: lib/libzfp.so.0.5.5
bin/testZfpSerial4dInt64: lib/libzfpHashLib.so
bin/testZfpSerial4dInt64: lib/libgenSmoothRandNumsLib.so
bin/testZfpSerial4dInt64: lib/libstridedOperationsLib.so
bin/testZfpSerial4dInt64: lib/libzfpChecksumsLib.so
bin/testZfpSerial4dInt64: lib/libzfpCompressionParamsLib.so
bin/testZfpSerial4dInt64: lib/libzfpTimerLib.so
bin/testZfpSerial4dInt64: tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../bin/testZfpSerial4dInt64"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testZfpSerial4dInt64.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/build: bin/testZfpSerial4dInt64

.PHONY : tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/build

tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/requires: tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/testZfpSerial4dInt64.c.o.requires

.PHONY : tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/requires

tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/clean:
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend && $(CMAKE_COMMAND) -P CMakeFiles/testZfpSerial4dInt64.dir/cmake_clean.cmake
.PHONY : tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/clean

tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/depend:
	cd /home/ubuntu/local_build/zfp/build_debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/local_build/zfp /home/ubuntu/local_build/zfp/tests/src/endtoend /home/ubuntu/local_build/zfp/build_debug /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/src/endtoend/CMakeFiles/testZfpSerial4dInt64.dir/depend

