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
include tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/depend.make

# Include the progress variables for this target.
include tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/progress.make

# Include the compile flags for this target's objects.
include tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/flags.make

tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.o: tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/flags.make
tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.o: ../tests/src/decode/testZfpDecodeBlockStrided1dFloat.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.o"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/decode && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.o   -c /home/ubuntu/local_build/zfp/tests/src/decode/testZfpDecodeBlockStrided1dFloat.c

tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.i"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/decode && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/local_build/zfp/tests/src/decode/testZfpDecodeBlockStrided1dFloat.c > CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.i

tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.s"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/decode && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/local_build/zfp/tests/src/decode/testZfpDecodeBlockStrided1dFloat.c -o CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.s

tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.o.requires:

.PHONY : tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.o.requires

tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.o.provides: tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.o.requires
	$(MAKE) -f tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/build.make tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.o.provides.build
.PHONY : tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.o.provides

tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.o.provides.build: tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.o


# Object files for target testZfpDecodeBlockStrided1dFloat
testZfpDecodeBlockStrided1dFloat_OBJECTS = \
"CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.o"

# External object files for target testZfpDecodeBlockStrided1dFloat
testZfpDecodeBlockStrided1dFloat_EXTERNAL_OBJECTS =

bin/testZfpDecodeBlockStrided1dFloat: tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.o
bin/testZfpDecodeBlockStrided1dFloat: tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/build.make
bin/testZfpDecodeBlockStrided1dFloat: cmocka-build/src/libcmocka.a
bin/testZfpDecodeBlockStrided1dFloat: lib/libzfp.so.0.5.5
bin/testZfpDecodeBlockStrided1dFloat: lib/librand32Lib.so
bin/testZfpDecodeBlockStrided1dFloat: lib/libzfpHashLib.so
bin/testZfpDecodeBlockStrided1dFloat: lib/libzfpChecksumsLib.so
bin/testZfpDecodeBlockStrided1dFloat: tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../bin/testZfpDecodeBlockStrided1dFloat"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/decode && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/build: bin/testZfpDecodeBlockStrided1dFloat

.PHONY : tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/build

tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/requires: tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/testZfpDecodeBlockStrided1dFloat.c.o.requires

.PHONY : tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/requires

tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/clean:
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/decode && $(CMAKE_COMMAND) -P CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/cmake_clean.cmake
.PHONY : tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/clean

tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/depend:
	cd /home/ubuntu/local_build/zfp/build_debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/local_build/zfp /home/ubuntu/local_build/zfp/tests/src/decode /home/ubuntu/local_build/zfp/build_debug /home/ubuntu/local_build/zfp/build_debug/tests/src/decode /home/ubuntu/local_build/zfp/build_debug/tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/src/decode/CMakeFiles/testZfpDecodeBlockStrided1dFloat.dir/depend

