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
include tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/depend.make

# Include the progress variables for this target.
include tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/progress.make

# Include the compile flags for this target's objects.
include tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/flags.make

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.o: tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/flags.make
tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.o: ../tests/src/encode/testZfpEncodeBlockStrided3dInt64.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.o"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/encode && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.o   -c /home/ubuntu/local_build/zfp/tests/src/encode/testZfpEncodeBlockStrided3dInt64.c

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.i"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/encode && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/local_build/zfp/tests/src/encode/testZfpEncodeBlockStrided3dInt64.c > CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.i

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.s"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/encode && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/local_build/zfp/tests/src/encode/testZfpEncodeBlockStrided3dInt64.c -o CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.s

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.o.requires:

.PHONY : tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.o.requires

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.o.provides: tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.o.requires
	$(MAKE) -f tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/build.make tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.o.provides.build
.PHONY : tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.o.provides

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.o.provides.build: tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.o


# Object files for target testZfpEncodeBlockStrided3dInt64
testZfpEncodeBlockStrided3dInt64_OBJECTS = \
"CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.o"

# External object files for target testZfpEncodeBlockStrided3dInt64
testZfpEncodeBlockStrided3dInt64_EXTERNAL_OBJECTS =

bin/testZfpEncodeBlockStrided3dInt64: tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.o
bin/testZfpEncodeBlockStrided3dInt64: tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/build.make
bin/testZfpEncodeBlockStrided3dInt64: cmocka-build/src/libcmocka.a
bin/testZfpEncodeBlockStrided3dInt64: lib/libzfp.so.0.5.5
bin/testZfpEncodeBlockStrided3dInt64: lib/librand64Lib.so
bin/testZfpEncodeBlockStrided3dInt64: lib/libzfpHashLib.so
bin/testZfpEncodeBlockStrided3dInt64: lib/libzfpChecksumsLib.so
bin/testZfpEncodeBlockStrided3dInt64: tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/local_build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../bin/testZfpEncodeBlockStrided3dInt64"
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/encode && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/build: bin/testZfpEncodeBlockStrided3dInt64

.PHONY : tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/build

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/requires: tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/testZfpEncodeBlockStrided3dInt64.c.o.requires

.PHONY : tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/requires

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/clean:
	cd /home/ubuntu/local_build/zfp/build_debug/tests/src/encode && $(CMAKE_COMMAND) -P CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/cmake_clean.cmake
.PHONY : tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/clean

tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/depend:
	cd /home/ubuntu/local_build/zfp/build_debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/local_build/zfp /home/ubuntu/local_build/zfp/tests/src/encode /home/ubuntu/local_build/zfp/build_debug /home/ubuntu/local_build/zfp/build_debug/tests/src/encode /home/ubuntu/local_build/zfp/build_debug/tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/src/encode/CMakeFiles/testZfpEncodeBlockStrided3dInt64.dir/depend

