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
include tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/depend.make

# Include the progress variables for this target.
include tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/progress.make

# Include the compile flags for this target's objects.
include tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/flags.make

tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.o: tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/flags.make
tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.o: ../tests/src/endtoend/testZfpSerial4dFloat.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.o"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.o   -c /home/ubuntu/local_build/zfp/tests/src/endtoend/testZfpSerial4dFloat.c

tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.i"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/local_build/zfp/tests/src/endtoend/testZfpSerial4dFloat.c > CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.i

tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.s"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/local_build/zfp/tests/src/endtoend/testZfpSerial4dFloat.c -o CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.s

tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.o.requires:

.PHONY : tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.o.requires

tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.o.provides: tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.o.requires
	$(MAKE) -f tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/build.make tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.o.provides.build
.PHONY : tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.o.provides

tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.o.provides.build: tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.o


# Object files for target testZfpSerial4dFloat
testZfpSerial4dFloat_OBJECTS = \
"CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.o"

# External object files for target testZfpSerial4dFloat
testZfpSerial4dFloat_EXTERNAL_OBJECTS =

bin/testZfpSerial4dFloat: tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.o
bin/testZfpSerial4dFloat: tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/build.make
bin/testZfpSerial4dFloat: cmocka-build/src/libcmocka.a
bin/testZfpSerial4dFloat: lib/libzfp.so.0.5.5
bin/testZfpSerial4dFloat: lib/libzfpHashLib.so
bin/testZfpSerial4dFloat: lib/libgenSmoothRandNumsLib.so
bin/testZfpSerial4dFloat: lib/libstridedOperationsLib.so
bin/testZfpSerial4dFloat: lib/libzfpChecksumsLib.so
bin/testZfpSerial4dFloat: lib/libzfpCompressionParamsLib.so
bin/testZfpSerial4dFloat: lib/libzfpTimerLib.so
bin/testZfpSerial4dFloat: tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../bin/testZfpSerial4dFloat"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testZfpSerial4dFloat.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/build: bin/testZfpSerial4dFloat

.PHONY : tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/build

tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/requires: tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/testZfpSerial4dFloat.c.o.requires

.PHONY : tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/requires

tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/clean:
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend && $(CMAKE_COMMAND) -P CMakeFiles/testZfpSerial4dFloat.dir/cmake_clean.cmake
.PHONY : tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/clean

tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/depend:
	cd /home/ubuntu/local_build/zfp/build_debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/local_build/zfp /home/ubuntu/local_build/zfp/tests/src/endtoend /home/ubuntu/local_build/zfp/build_debug /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend /home/ubuntu/local_build/zfp/build_debug/tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/src/endtoend/CMakeFiles/testZfpSerial4dFloat.dir/depend

