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
include CMakeFiles/ndarray_backend_cuda.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/ndarray_backend_cuda.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/ndarray_backend_cuda.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ndarray_backend_cuda.dir/flags.make

CMakeFiles/ndarray_backend_cuda.dir/src/ndarray_backend_cuda_generated_ndarray_backend_cuda.cu.o: /home/ubuntu/dlsys/4/src/ndarray_backend_cuda.cu
CMakeFiles/ndarray_backend_cuda.dir/src/ndarray_backend_cuda_generated_ndarray_backend_cuda.cu.o: CMakeFiles/ndarray_backend_cuda.dir/src/ndarray_backend_cuda_generated_ndarray_backend_cuda.cu.o.depend
CMakeFiles/ndarray_backend_cuda.dir/src/ndarray_backend_cuda_generated_ndarray_backend_cuda.cu.o: CMakeFiles/ndarray_backend_cuda.dir/src/ndarray_backend_cuda_generated_ndarray_backend_cuda.cu.o.cmake
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/ubuntu/dlsys/4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building NVCC (Device) object CMakeFiles/ndarray_backend_cuda.dir/src/ndarray_backend_cuda_generated_ndarray_backend_cuda.cu.o"
	cd /home/ubuntu/dlsys/4/build/CMakeFiles/ndarray_backend_cuda.dir/src && /usr/bin/cmake -E make_directory /home/ubuntu/dlsys/4/build/CMakeFiles/ndarray_backend_cuda.dir/src/.
	cd /home/ubuntu/dlsys/4/build/CMakeFiles/ndarray_backend_cuda.dir/src && /usr/bin/cmake -D verbose:BOOL=$(VERBOSE) -D build_configuration:STRING= -D generated_file:STRING=/home/ubuntu/dlsys/4/build/CMakeFiles/ndarray_backend_cuda.dir/src/./ndarray_backend_cuda_generated_ndarray_backend_cuda.cu.o -D generated_cubin_file:STRING=/home/ubuntu/dlsys/4/build/CMakeFiles/ndarray_backend_cuda.dir/src/./ndarray_backend_cuda_generated_ndarray_backend_cuda.cu.o.cubin.txt -P /home/ubuntu/dlsys/4/build/CMakeFiles/ndarray_backend_cuda.dir/src/ndarray_backend_cuda_generated_ndarray_backend_cuda.cu.o.cmake

# Object files for target ndarray_backend_cuda
ndarray_backend_cuda_OBJECTS =

# External object files for target ndarray_backend_cuda
ndarray_backend_cuda_EXTERNAL_OBJECTS = \
"/home/ubuntu/dlsys/4/build/CMakeFiles/ndarray_backend_cuda.dir/src/ndarray_backend_cuda_generated_ndarray_backend_cuda.cu.o"

/home/ubuntu/dlsys/4/python/needle/backend_ndarray/ndarray_backend_cuda.cpython-312-x86_64-linux-gnu.so: CMakeFiles/ndarray_backend_cuda.dir/src/ndarray_backend_cuda_generated_ndarray_backend_cuda.cu.o
/home/ubuntu/dlsys/4/python/needle/backend_ndarray/ndarray_backend_cuda.cpython-312-x86_64-linux-gnu.so: CMakeFiles/ndarray_backend_cuda.dir/build.make
/home/ubuntu/dlsys/4/python/needle/backend_ndarray/ndarray_backend_cuda.cpython-312-x86_64-linux-gnu.so: /usr/local/cuda/lib64/libcudart_static.a
/home/ubuntu/dlsys/4/python/needle/backend_ndarray/ndarray_backend_cuda.cpython-312-x86_64-linux-gnu.so: /usr/lib/x86_64-linux-gnu/librt.a
/home/ubuntu/dlsys/4/python/needle/backend_ndarray/ndarray_backend_cuda.cpython-312-x86_64-linux-gnu.so: /usr/local/cuda/lib64/libcudart.so
/home/ubuntu/dlsys/4/python/needle/backend_ndarray/ndarray_backend_cuda.cpython-312-x86_64-linux-gnu.so: CMakeFiles/ndarray_backend_cuda.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/ubuntu/dlsys/4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared module /home/ubuntu/dlsys/4/python/needle/backend_ndarray/ndarray_backend_cuda.cpython-312-x86_64-linux-gnu.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ndarray_backend_cuda.dir/link.txt --verbose=$(VERBOSE)
	/usr/bin/strip /home/ubuntu/dlsys/4/python/needle/backend_ndarray/ndarray_backend_cuda.cpython-312-x86_64-linux-gnu.so

# Rule to build all files generated by this target.
CMakeFiles/ndarray_backend_cuda.dir/build: /home/ubuntu/dlsys/4/python/needle/backend_ndarray/ndarray_backend_cuda.cpython-312-x86_64-linux-gnu.so
.PHONY : CMakeFiles/ndarray_backend_cuda.dir/build

CMakeFiles/ndarray_backend_cuda.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ndarray_backend_cuda.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ndarray_backend_cuda.dir/clean

CMakeFiles/ndarray_backend_cuda.dir/depend: CMakeFiles/ndarray_backend_cuda.dir/src/ndarray_backend_cuda_generated_ndarray_backend_cuda.cu.o
	cd /home/ubuntu/dlsys/4/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/dlsys/4 /home/ubuntu/dlsys/4 /home/ubuntu/dlsys/4/build /home/ubuntu/dlsys/4/build /home/ubuntu/dlsys/4/build/CMakeFiles/ndarray_backend_cuda.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/ndarray_backend_cuda.dir/depend

