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
include tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/depend.make

# Include the progress variables for this target.
include tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/progress.make

# Include the compile flags for this target's objects.
include tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/flags.make

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.o: tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/flags.make
tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.o: ../tests/src/encode/testZfpEncodeBlockStrided2dFloat.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cc/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.o"
	cd /home/cc/local_build/zfp/build_debug/tests/src/encode && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.o   -c /home/cc/local_build/zfp/tests/src/encode/testZfpEncodeBlockStrided2dFloat.c

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.i"
	cd /home/cc/local_build/zfp/build_debug/tests/src/encode && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cc/local_build/zfp/tests/src/encode/testZfpEncodeBlockStrided2dFloat.c > CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.i

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.s"
	cd /home/cc/local_build/zfp/build_debug/tests/src/encode && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cc/local_build/zfp/tests/src/encode/testZfpEncodeBlockStrided2dFloat.c -o CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.s

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.o.requires:

.PHONY : tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.o.requires

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.o.provides: tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.o.requires
	$(MAKE) -f tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/build.make tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.o.provides.build
.PHONY : tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.o.provides

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.o.provides.build: tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.o


# Object files for target testZfpEncodeBlockStrided2dFloat
testZfpEncodeBlockStrided2dFloat_OBJECTS = \
"CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.o"

# External object files for target testZfpEncodeBlockStrided2dFloat
testZfpEncodeBlockStrided2dFloat_EXTERNAL_OBJECTS =

bin/testZfpEncodeBlockStrided2dFloat: tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.o
bin/testZfpEncodeBlockStrided2dFloat: tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/build.make
bin/testZfpEncodeBlockStrided2dFloat: cmocka-build/src/libcmocka.a
bin/testZfpEncodeBlockStrided2dFloat: lib/libzfp.so.0.5.5
bin/testZfpEncodeBlockStrided2dFloat: lib/librand32Lib.so
bin/testZfpEncodeBlockStrided2dFloat: lib/libzfpHashLib.so
bin/testZfpEncodeBlockStrided2dFloat: lib/libzfpChecksumsLib.so
bin/testZfpEncodeBlockStrided2dFloat: tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cc/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../bin/testZfpEncodeBlockStrided2dFloat"
	cd /home/cc/local_build/zfp/build_debug/tests/src/encode && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/build: bin/testZfpEncodeBlockStrided2dFloat

.PHONY : tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/build

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/requires: tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/testZfpEncodeBlockStrided2dFloat.c.o.requires

.PHONY : tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/requires

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/clean:
	cd /home/cc/local_build/zfp/build_debug/tests/src/encode && $(CMAKE_COMMAND) -P CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/cmake_clean.cmake
.PHONY : tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/clean

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/depend:
	cd /home/cc/local_build/zfp/build_debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cc/local_build/zfp /home/cc/local_build/zfp/tests/src/encode /home/cc/local_build/zfp/build_debug /home/cc/local_build/zfp/build_debug/tests/src/encode /home/cc/local_build/zfp/build_debug/tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided2dFloat.dir/depend

