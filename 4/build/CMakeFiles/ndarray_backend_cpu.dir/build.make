# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/dlsys/4

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/dlsys/4/build

# Include any dependencies generated for this target.
include CMakeFiles/ndarray_backend_cpu.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/ndarray_backend_cpu.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/ndarray_backend_cpu.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ndarray_backend_cpu.dir/flags.make

CMakeFiles/ndarray_backend_cpu.dir/src/ndarray_backend_cpu.cc.o: CMakeFiles/ndarray_backend_cpu.dir/flags.make
CMakeFiles/ndarray_backend_cpu.dir/src/ndarray_backend_cpu.cc.o: /home/ubuntu/dlsys/4/src/ndarray_backend_cpu.cc
CMakeFiles/ndarray_backend_cpu.dir/src/ndarray_backend_cpu.cc.o: CMakeFiles/ndarray_backend_cpu.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/ubuntu/dlsys/4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/ndarray_backend_cpu.dir/src/ndarray_backend_cpu.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/ndarray_backend_cpu.dir/src/ndarray_backend_cpu.cc.o -MF CMakeFiles/ndarray_backend_cpu.dir/src/ndarray_backend_cpu.cc.o.d -o CMakeFiles/ndarray_backend_cpu.dir/src/ndarray_backend_cpu.cc.o -c /home/ubuntu/dlsys/4/src/ndarray_backend_cpu.cc

CMakeFiles/ndarray_backend_cpu.dir/src/ndarray_backend_cpu.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/ndarray_backend_cpu.dir/src/ndarray_backend_cpu.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/dlsys/4/src/ndarray_backend_cpu.cc > CMakeFiles/ndarray_backend_cpu.dir/src/ndarray_backend_cpu.cc.i

CMakeFiles/ndarray_backend_cpu.dir/src/ndarray_backend_cpu.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/ndarray_backend_cpu.dir/src/ndarray_backend_cpu.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/dlsys/4/src/ndarray_backend_cpu.cc -o CMakeFiles/ndarray_backend_cpu.dir/src/ndarray_backend_cpu.cc.s

# Object files for target ndarray_backend_cpu
ndarray_backend_cpu_OBJECTS = \
"CMakeFiles/ndarray_backend_cpu.dir/src/ndarray_backend_cpu.cc.o"

# External object files for target ndarray_backend_cpu
ndarray_backend_cpu_EXTERNAL_OBJECTS =

/home/ubuntu/dlsys/4/python/needle/backend_ndarray/ndarray_backend_cpu.cpython-312-x86_64-linux-gnu.so: CMakeFiles/ndarray_backend_cpu.dir/src/ndarray_backend_cpu.cc.o
/home/ubuntu/dlsys/4/python/needle/backend_ndarray/ndarray_backend_cpu.cpython-312-x86_64-linux-gnu.so: CMakeFiles/ndarray_backend_cpu.dir/build.make
/home/ubuntu/dlsys/4/python/needle/backend_ndarray/ndarray_backend_cpu.cpython-312-x86_64-linux-gnu.so: CMakeFiles/ndarray_backend_cpu.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/ubuntu/dlsys/4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared module /home/ubuntu/dlsys/4/python/needle/backend_ndarray/ndarray_backend_cpu.cpython-312-x86_64-linux-gnu.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ndarray_backend_cpu.dir/link.txt --verbose=$(VERBOSE)
	/usr/bin/strip /home/ubuntu/dlsys/4/python/needle/backend_ndarray/ndarray_backend_cpu.cpython-312-x86_64-linux-gnu.so

# Rule to build all files generated by this target.
CMakeFiles/ndarray_backend_cpu.dir/build: /home/ubuntu/dlsys/4/python/needle/backend_ndarray/ndarray_backend_cpu.cpython-312-x86_64-linux-gnu.so
.PHONY : CMakeFiles/ndarray_backend_cpu.dir/build

CMakeFiles/ndarray_backend_cpu.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ndarray_backend_cpu.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ndarray_backend_cpu.dir/clean

CMakeFiles/ndarray_backend_cpu.dir/depend:
	cd /home/ubuntu/dlsys/4/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/dlsys/4 /home/ubuntu/dlsys/4 /home/ubuntu/dlsys/4/build /home/ubuntu/dlsys/4/build /home/ubuntu/dlsys/4/build/CMakeFiles/ndarray_backend_cpu.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/ndarray_backend_cpu.dir/depend

