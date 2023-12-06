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

# Include any dependencies generated for this target.
include runtime_lib/CMakeFiles/llfi-rt.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include runtime_lib/CMakeFiles/llfi-rt.dir/compiler_depend.make

# Include the progress variables for this target.
include runtime_lib/CMakeFiles/llfi-rt.dir/progress.make

# Include the compile flags for this target's objects.
include runtime_lib/CMakeFiles/llfi-rt.dir/flags.make

runtime_lib/CMakeFiles/llfi-rt.dir/CommonFaultInjectors.cpp.o: runtime_lib/CMakeFiles/llfi-rt.dir/flags.make
runtime_lib/CMakeFiles/llfi-rt.dir/CommonFaultInjectors.cpp.o: ../runtime_lib/CommonFaultInjectors.cpp
runtime_lib/CMakeFiles/llfi-rt.dir/CommonFaultInjectors.cpp.o: runtime_lib/CMakeFiles/llfi-rt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hjiang/LLTFI/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object runtime_lib/CMakeFiles/llfi-rt.dir/CommonFaultInjectors.cpp.o"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT runtime_lib/CMakeFiles/llfi-rt.dir/CommonFaultInjectors.cpp.o -MF CMakeFiles/llfi-rt.dir/CommonFaultInjectors.cpp.o.d -o CMakeFiles/llfi-rt.dir/CommonFaultInjectors.cpp.o -c /home/hjiang/LLTFI/runtime_lib/CommonFaultInjectors.cpp

runtime_lib/CMakeFiles/llfi-rt.dir/CommonFaultInjectors.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/llfi-rt.dir/CommonFaultInjectors.cpp.i"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hjiang/LLTFI/runtime_lib/CommonFaultInjectors.cpp > CMakeFiles/llfi-rt.dir/CommonFaultInjectors.cpp.i

runtime_lib/CMakeFiles/llfi-rt.dir/CommonFaultInjectors.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/llfi-rt.dir/CommonFaultInjectors.cpp.s"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hjiang/LLTFI/runtime_lib/CommonFaultInjectors.cpp -o CMakeFiles/llfi-rt.dir/CommonFaultInjectors.cpp.s

runtime_lib/CMakeFiles/llfi-rt.dir/FaultInjectionLib.c.o: runtime_lib/CMakeFiles/llfi-rt.dir/flags.make
runtime_lib/CMakeFiles/llfi-rt.dir/FaultInjectionLib.c.o: ../runtime_lib/FaultInjectionLib.c
runtime_lib/CMakeFiles/llfi-rt.dir/FaultInjectionLib.c.o: runtime_lib/CMakeFiles/llfi-rt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hjiang/LLTFI/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object runtime_lib/CMakeFiles/llfi-rt.dir/FaultInjectionLib.c.o"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT runtime_lib/CMakeFiles/llfi-rt.dir/FaultInjectionLib.c.o -MF CMakeFiles/llfi-rt.dir/FaultInjectionLib.c.o.d -o CMakeFiles/llfi-rt.dir/FaultInjectionLib.c.o -c /home/hjiang/LLTFI/runtime_lib/FaultInjectionLib.c

runtime_lib/CMakeFiles/llfi-rt.dir/FaultInjectionLib.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/llfi-rt.dir/FaultInjectionLib.c.i"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hjiang/LLTFI/runtime_lib/FaultInjectionLib.c > CMakeFiles/llfi-rt.dir/FaultInjectionLib.c.i

runtime_lib/CMakeFiles/llfi-rt.dir/FaultInjectionLib.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/llfi-rt.dir/FaultInjectionLib.c.s"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hjiang/LLTFI/runtime_lib/FaultInjectionLib.c -o CMakeFiles/llfi-rt.dir/FaultInjectionLib.c.s

runtime_lib/CMakeFiles/llfi-rt.dir/FaultInjectorManager.cpp.o: runtime_lib/CMakeFiles/llfi-rt.dir/flags.make
runtime_lib/CMakeFiles/llfi-rt.dir/FaultInjectorManager.cpp.o: ../runtime_lib/FaultInjectorManager.cpp
runtime_lib/CMakeFiles/llfi-rt.dir/FaultInjectorManager.cpp.o: runtime_lib/CMakeFiles/llfi-rt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hjiang/LLTFI/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object runtime_lib/CMakeFiles/llfi-rt.dir/FaultInjectorManager.cpp.o"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT runtime_lib/CMakeFiles/llfi-rt.dir/FaultInjectorManager.cpp.o -MF CMakeFiles/llfi-rt.dir/FaultInjectorManager.cpp.o.d -o CMakeFiles/llfi-rt.dir/FaultInjectorManager.cpp.o -c /home/hjiang/LLTFI/runtime_lib/FaultInjectorManager.cpp

runtime_lib/CMakeFiles/llfi-rt.dir/FaultInjectorManager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/llfi-rt.dir/FaultInjectorManager.cpp.i"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hjiang/LLTFI/runtime_lib/FaultInjectorManager.cpp > CMakeFiles/llfi-rt.dir/FaultInjectorManager.cpp.i

runtime_lib/CMakeFiles/llfi-rt.dir/FaultInjectorManager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/llfi-rt.dir/FaultInjectorManager.cpp.s"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hjiang/LLTFI/runtime_lib/FaultInjectorManager.cpp -o CMakeFiles/llfi-rt.dir/FaultInjectorManager.cpp.s

runtime_lib/CMakeFiles/llfi-rt.dir/InstTraceLib.c.o: runtime_lib/CMakeFiles/llfi-rt.dir/flags.make
runtime_lib/CMakeFiles/llfi-rt.dir/InstTraceLib.c.o: ../runtime_lib/InstTraceLib.c
runtime_lib/CMakeFiles/llfi-rt.dir/InstTraceLib.c.o: runtime_lib/CMakeFiles/llfi-rt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hjiang/LLTFI/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object runtime_lib/CMakeFiles/llfi-rt.dir/InstTraceLib.c.o"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT runtime_lib/CMakeFiles/llfi-rt.dir/InstTraceLib.c.o -MF CMakeFiles/llfi-rt.dir/InstTraceLib.c.o.d -o CMakeFiles/llfi-rt.dir/InstTraceLib.c.o -c /home/hjiang/LLTFI/runtime_lib/InstTraceLib.c

runtime_lib/CMakeFiles/llfi-rt.dir/InstTraceLib.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/llfi-rt.dir/InstTraceLib.c.i"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hjiang/LLTFI/runtime_lib/InstTraceLib.c > CMakeFiles/llfi-rt.dir/InstTraceLib.c.i

runtime_lib/CMakeFiles/llfi-rt.dir/InstTraceLib.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/llfi-rt.dir/InstTraceLib.c.s"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hjiang/LLTFI/runtime_lib/InstTraceLib.c -o CMakeFiles/llfi-rt.dir/InstTraceLib.c.s

runtime_lib/CMakeFiles/llfi-rt.dir/ProfilingLib.c.o: runtime_lib/CMakeFiles/llfi-rt.dir/flags.make
runtime_lib/CMakeFiles/llfi-rt.dir/ProfilingLib.c.o: ../runtime_lib/ProfilingLib.c
runtime_lib/CMakeFiles/llfi-rt.dir/ProfilingLib.c.o: runtime_lib/CMakeFiles/llfi-rt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hjiang/LLTFI/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object runtime_lib/CMakeFiles/llfi-rt.dir/ProfilingLib.c.o"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT runtime_lib/CMakeFiles/llfi-rt.dir/ProfilingLib.c.o -MF CMakeFiles/llfi-rt.dir/ProfilingLib.c.o.d -o CMakeFiles/llfi-rt.dir/ProfilingLib.c.o -c /home/hjiang/LLTFI/runtime_lib/ProfilingLib.c

runtime_lib/CMakeFiles/llfi-rt.dir/ProfilingLib.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/llfi-rt.dir/ProfilingLib.c.i"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hjiang/LLTFI/runtime_lib/ProfilingLib.c > CMakeFiles/llfi-rt.dir/ProfilingLib.c.i

runtime_lib/CMakeFiles/llfi-rt.dir/ProfilingLib.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/llfi-rt.dir/ProfilingLib.c.s"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hjiang/LLTFI/runtime_lib/ProfilingLib.c -o CMakeFiles/llfi-rt.dir/ProfilingLib.c.s

runtime_lib/CMakeFiles/llfi-rt.dir/Utils.c.o: runtime_lib/CMakeFiles/llfi-rt.dir/flags.make
runtime_lib/CMakeFiles/llfi-rt.dir/Utils.c.o: ../runtime_lib/Utils.c
runtime_lib/CMakeFiles/llfi-rt.dir/Utils.c.o: runtime_lib/CMakeFiles/llfi-rt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hjiang/LLTFI/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object runtime_lib/CMakeFiles/llfi-rt.dir/Utils.c.o"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT runtime_lib/CMakeFiles/llfi-rt.dir/Utils.c.o -MF CMakeFiles/llfi-rt.dir/Utils.c.o.d -o CMakeFiles/llfi-rt.dir/Utils.c.o -c /home/hjiang/LLTFI/runtime_lib/Utils.c

runtime_lib/CMakeFiles/llfi-rt.dir/Utils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/llfi-rt.dir/Utils.c.i"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hjiang/LLTFI/runtime_lib/Utils.c > CMakeFiles/llfi-rt.dir/Utils.c.i

runtime_lib/CMakeFiles/llfi-rt.dir/Utils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/llfi-rt.dir/Utils.c.s"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hjiang/LLTFI/runtime_lib/Utils.c -o CMakeFiles/llfi-rt.dir/Utils.c.s

runtime_lib/CMakeFiles/llfi-rt.dir/_FIDLSoftwareFaultInjectors.cpp.o: runtime_lib/CMakeFiles/llfi-rt.dir/flags.make
runtime_lib/CMakeFiles/llfi-rt.dir/_FIDLSoftwareFaultInjectors.cpp.o: ../runtime_lib/_FIDLSoftwareFaultInjectors.cpp
runtime_lib/CMakeFiles/llfi-rt.dir/_FIDLSoftwareFaultInjectors.cpp.o: runtime_lib/CMakeFiles/llfi-rt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hjiang/LLTFI/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object runtime_lib/CMakeFiles/llfi-rt.dir/_FIDLSoftwareFaultInjectors.cpp.o"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT runtime_lib/CMakeFiles/llfi-rt.dir/_FIDLSoftwareFaultInjectors.cpp.o -MF CMakeFiles/llfi-rt.dir/_FIDLSoftwareFaultInjectors.cpp.o.d -o CMakeFiles/llfi-rt.dir/_FIDLSoftwareFaultInjectors.cpp.o -c /home/hjiang/LLTFI/runtime_lib/_FIDLSoftwareFaultInjectors.cpp

runtime_lib/CMakeFiles/llfi-rt.dir/_FIDLSoftwareFaultInjectors.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/llfi-rt.dir/_FIDLSoftwareFaultInjectors.cpp.i"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hjiang/LLTFI/runtime_lib/_FIDLSoftwareFaultInjectors.cpp > CMakeFiles/llfi-rt.dir/_FIDLSoftwareFaultInjectors.cpp.i

runtime_lib/CMakeFiles/llfi-rt.dir/_FIDLSoftwareFaultInjectors.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/llfi-rt.dir/_FIDLSoftwareFaultInjectors.cpp.s"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hjiang/LLTFI/runtime_lib/_FIDLSoftwareFaultInjectors.cpp -o CMakeFiles/llfi-rt.dir/_FIDLSoftwareFaultInjectors.cpp.s

# Object files for target llfi-rt
llfi__rt_OBJECTS = \
"CMakeFiles/llfi-rt.dir/CommonFaultInjectors.cpp.o" \
"CMakeFiles/llfi-rt.dir/FaultInjectionLib.c.o" \
"CMakeFiles/llfi-rt.dir/FaultInjectorManager.cpp.o" \
"CMakeFiles/llfi-rt.dir/InstTraceLib.c.o" \
"CMakeFiles/llfi-rt.dir/ProfilingLib.c.o" \
"CMakeFiles/llfi-rt.dir/Utils.c.o" \
"CMakeFiles/llfi-rt.dir/_FIDLSoftwareFaultInjectors.cpp.o"

# External object files for target llfi-rt
llfi__rt_EXTERNAL_OBJECTS =

runtime_lib/libllfi-rt.so: runtime_lib/CMakeFiles/llfi-rt.dir/CommonFaultInjectors.cpp.o
runtime_lib/libllfi-rt.so: runtime_lib/CMakeFiles/llfi-rt.dir/FaultInjectionLib.c.o
runtime_lib/libllfi-rt.so: runtime_lib/CMakeFiles/llfi-rt.dir/FaultInjectorManager.cpp.o
runtime_lib/libllfi-rt.so: runtime_lib/CMakeFiles/llfi-rt.dir/InstTraceLib.c.o
runtime_lib/libllfi-rt.so: runtime_lib/CMakeFiles/llfi-rt.dir/ProfilingLib.c.o
runtime_lib/libllfi-rt.so: runtime_lib/CMakeFiles/llfi-rt.dir/Utils.c.o
runtime_lib/libllfi-rt.so: runtime_lib/CMakeFiles/llfi-rt.dir/_FIDLSoftwareFaultInjectors.cpp.o
runtime_lib/libllfi-rt.so: runtime_lib/CMakeFiles/llfi-rt.dir/build.make
runtime_lib/libllfi-rt.so: runtime_lib/CMakeFiles/llfi-rt.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hjiang/LLTFI/BUILD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX shared library libllfi-rt.so"
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/llfi-rt.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
runtime_lib/CMakeFiles/llfi-rt.dir/build: runtime_lib/libllfi-rt.so
.PHONY : runtime_lib/CMakeFiles/llfi-rt.dir/build

runtime_lib/CMakeFiles/llfi-rt.dir/clean:
	cd /home/hjiang/LLTFI/BUILD/runtime_lib && $(CMAKE_COMMAND) -P CMakeFiles/llfi-rt.dir/cmake_clean.cmake
.PHONY : runtime_lib/CMakeFiles/llfi-rt.dir/clean

runtime_lib/CMakeFiles/llfi-rt.dir/depend:
	cd /home/hjiang/LLTFI/BUILD && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hjiang/LLTFI /home/hjiang/LLTFI/runtime_lib /home/hjiang/LLTFI/BUILD /home/hjiang/LLTFI/BUILD/runtime_lib /home/hjiang/LLTFI/BUILD/runtime_lib/CMakeFiles/llfi-rt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : runtime_lib/CMakeFiles/llfi-rt.dir/depend

