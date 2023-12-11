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

# Utility rule file for bin.

# Include any custom commands dependencies for this target.
include bin/CMakeFiles/bin.dir/compiler_depend.make

# Include the progress variables for this target.
include bin/CMakeFiles/bin.dir/progress.make

bin/CMakeFiles/bin: bin/instrument
bin/CMakeFiles/bin: bin/injectfault
bin/CMakeFiles/bin: bin/profile
bin/CMakeFiles/bin: bin/SoftwareFailureAutoScan
bin/CMakeFiles/bin: bin/batchInstrument
bin/CMakeFiles/bin: bin/batchProfile
bin/CMakeFiles/bin: bin/batchInjectfault
bin/CMakeFiles/bin: bin/llfi-gui
bin/CMakeFiles/bin: bin/HardwareFailureAutoScan
bin/CMakeFiles/bin: bin/InjectorAutoScan

bin/HardwareFailureAutoScan: ../bin/HardwareFailureAutoScan.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/hjiang/LLTFI/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating HardwareFailureAutoScan"
	cd /home/hjiang/LLTFI/BUILD/bin && /usr/local/bin/cmake -E copy /home/hjiang/LLTFI/bin/HardwareFailureAutoScan.py /home/hjiang/LLTFI/BUILD/bin/HardwareFailureAutoScan

bin/InjectorAutoScan: ../bin/InjectorAutoScan.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/hjiang/LLTFI/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating InjectorAutoScan"
	cd /home/hjiang/LLTFI/BUILD/bin && /usr/local/bin/cmake -E copy /home/hjiang/LLTFI/bin/InjectorAutoScan.py /home/hjiang/LLTFI/BUILD/bin/InjectorAutoScan

bin/SoftwareFailureAutoScan: ../bin/SoftwareFailureAutoScan.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/hjiang/LLTFI/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating SoftwareFailureAutoScan"
	cd /home/hjiang/LLTFI/BUILD/bin && /usr/local/bin/cmake -E copy /home/hjiang/LLTFI/bin/SoftwareFailureAutoScan.py /home/hjiang/LLTFI/BUILD/bin/SoftwareFailureAutoScan

bin/batchInjectfault: ../bin/batchInjectfault.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/hjiang/LLTFI/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating batchInjectfault"
	cd /home/hjiang/LLTFI/BUILD/bin && /usr/local/bin/cmake -E copy /home/hjiang/LLTFI/bin/batchInjectfault.py /home/hjiang/LLTFI/BUILD/bin/batchInjectfault

bin/batchInstrument: ../bin/batchInstrument.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/hjiang/LLTFI/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Generating batchInstrument"
	cd /home/hjiang/LLTFI/BUILD/bin && /usr/local/bin/cmake -E copy /home/hjiang/LLTFI/bin/batchInstrument.py /home/hjiang/LLTFI/BUILD/bin/batchInstrument

bin/batchProfile: ../bin/batchProfile.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/hjiang/LLTFI/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Generating batchProfile"
	cd /home/hjiang/LLTFI/BUILD/bin && /usr/local/bin/cmake -E copy /home/hjiang/LLTFI/bin/batchProfile.py /home/hjiang/LLTFI/BUILD/bin/batchProfile

bin/injectfault: ../bin/injectfault.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/hjiang/LLTFI/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Generating injectfault"
	cd /home/hjiang/LLTFI/BUILD/bin && /usr/local/bin/cmake -E copy /home/hjiang/LLTFI/bin/injectfault.py /home/hjiang/LLTFI/BUILD/bin/injectfault

bin/instrument: ../bin/instrument.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/hjiang/LLTFI/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Generating instrument"
	cd /home/hjiang/LLTFI/BUILD/bin && /usr/local/bin/cmake -E copy /home/hjiang/LLTFI/bin/instrument.py /home/hjiang/LLTFI/BUILD/bin/instrument

bin/llfi-gui: ../bin/llfi-gui.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/hjiang/LLTFI/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Generating llfi-gui"
	cd /home/hjiang/LLTFI/BUILD/bin && /usr/local/bin/cmake -E copy /home/hjiang/LLTFI/bin/llfi-gui.py /home/hjiang/LLTFI/BUILD/bin/llfi-gui

bin/profile: ../bin/profile.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/hjiang/LLTFI/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Generating profile"
	cd /home/hjiang/LLTFI/BUILD/bin && /usr/local/bin/cmake -E copy /home/hjiang/LLTFI/bin/profile.py /home/hjiang/LLTFI/BUILD/bin/profile

bin: bin/CMakeFiles/bin
bin: bin/HardwareFailureAutoScan
bin: bin/InjectorAutoScan
bin: bin/SoftwareFailureAutoScan
bin: bin/batchInjectfault
bin: bin/batchInstrument
bin: bin/batchProfile
bin: bin/injectfault
bin: bin/instrument
bin: bin/llfi-gui
bin: bin/profile
bin: bin/CMakeFiles/bin.dir/build.make
.PHONY : bin

# Rule to build all files generated by this target.
bin/CMakeFiles/bin.dir/build: bin
.PHONY : bin/CMakeFiles/bin.dir/build

bin/CMakeFiles/bin.dir/clean:
	cd /home/hjiang/LLTFI/BUILD/bin && $(CMAKE_COMMAND) -P CMakeFiles/bin.dir/cmake_clean.cmake
.PHONY : bin/CMakeFiles/bin.dir/clean

bin/CMakeFiles/bin.dir/depend:
	cd /home/hjiang/LLTFI/BUILD && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hjiang/LLTFI /home/hjiang/LLTFI/bin /home/hjiang/LLTFI/BUILD /home/hjiang/LLTFI/BUILD/bin /home/hjiang/LLTFI/BUILD/bin/CMakeFiles/bin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : bin/CMakeFiles/bin.dir/depend
