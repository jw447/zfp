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
CMAKE_SOURCE_DIR = /home/cc/local-build/zfp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cc/local-build/zfp/build_debug

# Include any dependencies generated for this target.
include utils/CMakeFiles/zfpcmd.dir/depend.make

# Include the progress variables for this target.
include utils/CMakeFiles/zfpcmd.dir/progress.make

# Include the compile flags for this target's objects.
include utils/CMakeFiles/zfpcmd.dir/flags.make

utils/CMakeFiles/zfpcmd.dir/zfp.c.o: utils/CMakeFiles/zfpcmd.dir/flags.make
utils/CMakeFiles/zfpcmd.dir/zfp.c.o: ../utils/zfp.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cc/local-build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object utils/CMakeFiles/zfpcmd.dir/zfp.c.o"
	cd /home/cc/local-build/zfp/build_debug/utils && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zfpcmd.dir/zfp.c.o   -c /home/cc/local-build/zfp/utils/zfp.c

utils/CMakeFiles/zfpcmd.dir/zfp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zfpcmd.dir/zfp.c.i"
	cd /home/cc/local-build/zfp/build_debug/utils && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cc/local-build/zfp/utils/zfp.c > CMakeFiles/zfpcmd.dir/zfp.c.i

utils/CMakeFiles/zfpcmd.dir/zfp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zfpcmd.dir/zfp.c.s"
	cd /home/cc/local-build/zfp/build_debug/utils && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cc/local-build/zfp/utils/zfp.c -o CMakeFiles/zfpcmd.dir/zfp.c.s

utils/CMakeFiles/zfpcmd.dir/zfp.c.o.requires:

.PHONY : utils/CMakeFiles/zfpcmd.dir/zfp.c.o.requires

utils/CMakeFiles/zfpcmd.dir/zfp.c.o.provides: utils/CMakeFiles/zfpcmd.dir/zfp.c.o.requires
	$(MAKE) -f utils/CMakeFiles/zfpcmd.dir/build.make utils/CMakeFiles/zfpcmd.dir/zfp.c.o.provides.build
.PHONY : utils/CMakeFiles/zfpcmd.dir/zfp.c.o.provides

utils/CMakeFiles/zfpcmd.dir/zfp.c.o.provides.build: utils/CMakeFiles/zfpcmd.dir/zfp.c.o


# Object files for target zfpcmd
zfpcmd_OBJECTS = \
"CMakeFiles/zfpcmd.dir/zfp.c.o"

# External object files for target zfpcmd
zfpcmd_EXTERNAL_OBJECTS =

bin/zfp: utils/CMakeFiles/zfpcmd.dir/zfp.c.o
bin/zfp: utils/CMakeFiles/zfpcmd.dir/build.make
bin/zfp: lib/libzfp.so.0.5.5
bin/zfp: utils/CMakeFiles/zfpcmd.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cc/local-build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../bin/zfp"
	cd /home/cc/local-build/zfp/build_debug/utils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/zfpcmd.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
utils/CMakeFiles/zfpcmd.dir/build: bin/zfp

.PHONY : utils/CMakeFiles/zfpcmd.dir/build

utils/CMakeFiles/zfpcmd.dir/requires: utils/CMakeFiles/zfpcmd.dir/zfp.c.o.requires

.PHONY : utils/CMakeFiles/zfpcmd.dir/requires

utils/CMakeFiles/zfpcmd.dir/clean:
	cd /home/cc/local-build/zfp/build_debug/utils && $(CMAKE_COMMAND) -P CMakeFiles/zfpcmd.dir/cmake_clean.cmake
.PHONY : utils/CMakeFiles/zfpcmd.dir/clean

utils/CMakeFiles/zfpcmd.dir/depend:
	cd /home/cc/local-build/zfp/build_debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cc/local-build/zfp /home/cc/local-build/zfp/utils /home/cc/local-build/zfp/build_debug /home/cc/local-build/zfp/build_debug/utils /home/cc/local-build/zfp/build_debug/utils/CMakeFiles/zfpcmd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : utils/CMakeFiles/zfpcmd.dir/depend

