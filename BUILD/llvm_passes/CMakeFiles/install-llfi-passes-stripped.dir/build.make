# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/hjiang/LLTFI

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hjiang/LLTFI/BUILD

# Utility rule file for install-llfi-passes-stripped.

# Include any custom commands dependencies for this target.
include llvm_passes/CMakeFiles/install-llfi-passes-stripped.dir/compiler_depend.make

# Include the progress variables for this target.
include llvm_passes/CMakeFiles/install-llfi-passes-stripped.dir/progress.make

llvm_passes/CMakeFiles/install-llfi-passes-stripped:
	cd /home/hjiang/LLTFI/BUILD/llvm_passes && /usr/local/bin/cmake -DCMAKE_INSTALL_COMPONENT="llfi-passes" -DCMAKE_INSTALL_DO_STRIP=1 -P /home/hjiang/LLTFI/BUILD/cmake_install.cmake

install-llfi-passes-stripped: llvm_passes/CMakeFiles/install-llfi-passes-stripped
install-llfi-passes-stripped: llvm_passes/CMakeFiles/install-llfi-passes-stripped.dir/build.make
.PHONY : install-llfi-passes-stripped

# Rule to build all files generated by this target.
llvm_passes/CMakeFiles/install-llfi-passes-stripped.dir/build: install-llfi-passes-stripped
.PHONY : llvm_passes/CMakeFiles/install-llfi-passes-stripped.dir/build

llvm_passes/CMakeFiles/install-llfi-passes-stripped.dir/clean:
	cd /home/hjiang/LLTFI/BUILD/llvm_passes && $(CMAKE_COMMAND) -P CMakeFiles/install-llfi-passes-stripped.dir/cmake_clean.cmake
.PHONY : llvm_passes/CMakeFiles/install-llfi-passes-stripped.dir/clean

llvm_passes/CMakeFiles/install-llfi-passes-stripped.dir/depend:
	cd /home/hjiang/LLTFI/BUILD && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hjiang/LLTFI /home/hjiang/LLTFI/llvm_passes /home/hjiang/LLTFI/BUILD /home/hjiang/LLTFI/BUILD/llvm_passes /home/hjiang/LLTFI/BUILD/llvm_passes/CMakeFiles/install-llfi-passes-stripped.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : llvm_passes/CMakeFiles/install-llfi-passes-stripped.dir/depend

