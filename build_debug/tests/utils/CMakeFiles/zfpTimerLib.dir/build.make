# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

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
CMAKE_COMMAND = /autofs/nccs-svm1_sw/summit/.swci/0-core/opt/spack/20180914/linux-rhel7-ppc64le/gcc-4.8.5/cmake-3.15.2-xit2o3iepxvqbyku77lwcugufilztu7t/bin/cmake

# The command to remove a file.
RM = /autofs/nccs-svm1_sw/summit/.swci/0-core/opt/spack/20180914/linux-rhel7-ppc64le/gcc-4.8.5/cmake-3.15.2-xit2o3iepxvqbyku77lwcugufilztu7t/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug

# Include any dependencies generated for this target.
include tests/utils/CMakeFiles/zfpTimerLib.dir/depend.make

# Include the progress variables for this target.
include tests/utils/CMakeFiles/zfpTimerLib.dir/progress.make

# Include the compile flags for this target's objects.
include tests/utils/CMakeFiles/zfpTimerLib.dir/flags.make

tests/utils/CMakeFiles/zfpTimerLib.dir/zfpTimer.c.o: tests/utils/CMakeFiles/zfpTimerLib.dir/flags.make
tests/utils/CMakeFiles/zfpTimerLib.dir/zfpTimer.c.o: ../tests/utils/zfpTimer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/utils/CMakeFiles/zfpTimerLib.dir/zfpTimer.c.o"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/utils && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zfpTimerLib.dir/zfpTimer.c.o   -c /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/utils/zfpTimer.c

tests/utils/CMakeFiles/zfpTimerLib.dir/zfpTimer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zfpTimerLib.dir/zfpTimer.c.i"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/utils && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/utils/zfpTimer.c > CMakeFiles/zfpTimerLib.dir/zfpTimer.c.i

tests/utils/CMakeFiles/zfpTimerLib.dir/zfpTimer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zfpTimerLib.dir/zfpTimer.c.s"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/utils && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/utils/zfpTimer.c -o CMakeFiles/zfpTimerLib.dir/zfpTimer.c.s

# Object files for target zfpTimerLib
zfpTimerLib_OBJECTS = \
"CMakeFiles/zfpTimerLib.dir/zfpTimer.c.o"

# External object files for target zfpTimerLib
zfpTimerLib_EXTERNAL_OBJECTS =

lib64/libzfpTimerLib.so: tests/utils/CMakeFiles/zfpTimerLib.dir/zfpTimer.c.o
lib64/libzfpTimerLib.so: tests/utils/CMakeFiles/zfpTimerLib.dir/build.make
lib64/libzfpTimerLib.so: tests/utils/CMakeFiles/zfpTimerLib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library ../../lib64/libzfpTimerLib.so"
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/utils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/zfpTimerLib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/utils/CMakeFiles/zfpTimerLib.dir/build: lib64/libzfpTimerLib.so

.PHONY : tests/utils/CMakeFiles/zfpTimerLib.dir/build

tests/utils/CMakeFiles/zfpTimerLib.dir/clean:
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/utils && $(CMAKE_COMMAND) -P CMakeFiles/zfpTimerLib.dir/cmake_clean.cmake
.PHONY : tests/utils/CMakeFiles/zfpTimerLib.dir/clean

tests/utils/CMakeFiles/zfpTimerLib.dir/depend:
	cd /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/tests/utils /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/utils /gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/utils/CMakeFiles/zfpTimerLib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/utils/CMakeFiles/zfpTimerLib.dir/depend

