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
CMAKE_SOURCE_DIR = /home/toyama/Documents/8_Semestre/supercomp/work/MPI_Crawler

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/toyama/Documents/8_Semestre/supercomp/work/MPI_Crawler

# Include any dependencies generated for this target.
include CMakeFiles/par_crawler.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/par_crawler.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/par_crawler.dir/flags.make

CMakeFiles/par_crawler.dir/main_par.cpp.o: CMakeFiles/par_crawler.dir/flags.make
CMakeFiles/par_crawler.dir/main_par.cpp.o: main_par.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/toyama/Documents/8_Semestre/supercomp/work/MPI_Crawler/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/par_crawler.dir/main_par.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/par_crawler.dir/main_par.cpp.o -c /home/toyama/Documents/8_Semestre/supercomp/work/MPI_Crawler/main_par.cpp

CMakeFiles/par_crawler.dir/main_par.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/par_crawler.dir/main_par.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/toyama/Documents/8_Semestre/supercomp/work/MPI_Crawler/main_par.cpp > CMakeFiles/par_crawler.dir/main_par.cpp.i

CMakeFiles/par_crawler.dir/main_par.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/par_crawler.dir/main_par.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/toyama/Documents/8_Semestre/supercomp/work/MPI_Crawler/main_par.cpp -o CMakeFiles/par_crawler.dir/main_par.cpp.s

CMakeFiles/par_crawler.dir/main_par.cpp.o.requires:

.PHONY : CMakeFiles/par_crawler.dir/main_par.cpp.o.requires

CMakeFiles/par_crawler.dir/main_par.cpp.o.provides: CMakeFiles/par_crawler.dir/main_par.cpp.o.requires
	$(MAKE) -f CMakeFiles/par_crawler.dir/build.make CMakeFiles/par_crawler.dir/main_par.cpp.o.provides.build
.PHONY : CMakeFiles/par_crawler.dir/main_par.cpp.o.provides

CMakeFiles/par_crawler.dir/main_par.cpp.o.provides.build: CMakeFiles/par_crawler.dir/main_par.cpp.o


CMakeFiles/par_crawler.dir/web_crawler.cpp.o: CMakeFiles/par_crawler.dir/flags.make
CMakeFiles/par_crawler.dir/web_crawler.cpp.o: web_crawler.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/toyama/Documents/8_Semestre/supercomp/work/MPI_Crawler/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/par_crawler.dir/web_crawler.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/par_crawler.dir/web_crawler.cpp.o -c /home/toyama/Documents/8_Semestre/supercomp/work/MPI_Crawler/web_crawler.cpp

CMakeFiles/par_crawler.dir/web_crawler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/par_crawler.dir/web_crawler.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/toyama/Documents/8_Semestre/supercomp/work/MPI_Crawler/web_crawler.cpp > CMakeFiles/par_crawler.dir/web_crawler.cpp.i

CMakeFiles/par_crawler.dir/web_crawler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/par_crawler.dir/web_crawler.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/toyama/Documents/8_Semestre/supercomp/work/MPI_Crawler/web_crawler.cpp -o CMakeFiles/par_crawler.dir/web_crawler.cpp.s

CMakeFiles/par_crawler.dir/web_crawler.cpp.o.requires:

.PHONY : CMakeFiles/par_crawler.dir/web_crawler.cpp.o.requires

CMakeFiles/par_crawler.dir/web_crawler.cpp.o.provides: CMakeFiles/par_crawler.dir/web_crawler.cpp.o.requires
	$(MAKE) -f CMakeFiles/par_crawler.dir/build.make CMakeFiles/par_crawler.dir/web_crawler.cpp.o.provides.build
.PHONY : CMakeFiles/par_crawler.dir/web_crawler.cpp.o.provides

CMakeFiles/par_crawler.dir/web_crawler.cpp.o.provides.build: CMakeFiles/par_crawler.dir/web_crawler.cpp.o


# Object files for target par_crawler
par_crawler_OBJECTS = \
"CMakeFiles/par_crawler.dir/main_par.cpp.o" \
"CMakeFiles/par_crawler.dir/web_crawler.cpp.o"

# External object files for target par_crawler
par_crawler_EXTERNAL_OBJECTS =

par_crawler: CMakeFiles/par_crawler.dir/main_par.cpp.o
par_crawler: CMakeFiles/par_crawler.dir/web_crawler.cpp.o
par_crawler: CMakeFiles/par_crawler.dir/build.make
par_crawler: lib/libcpr.a
par_crawler: /usr/lib/x86_64-linux-gnu/libboost_regex.so
par_crawler: lib/libcurl.so
par_crawler: /usr/lib/x86_64-linux-gnu/libssl.so
par_crawler: /usr/lib/x86_64-linux-gnu/libcrypto.so
par_crawler: /usr/lib/x86_64-linux-gnu/libz.so
par_crawler: CMakeFiles/par_crawler.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/toyama/Documents/8_Semestre/supercomp/work/MPI_Crawler/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable par_crawler"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/par_crawler.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/par_crawler.dir/build: par_crawler

.PHONY : CMakeFiles/par_crawler.dir/build

CMakeFiles/par_crawler.dir/requires: CMakeFiles/par_crawler.dir/main_par.cpp.o.requires
CMakeFiles/par_crawler.dir/requires: CMakeFiles/par_crawler.dir/web_crawler.cpp.o.requires

.PHONY : CMakeFiles/par_crawler.dir/requires

CMakeFiles/par_crawler.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/par_crawler.dir/cmake_clean.cmake
.PHONY : CMakeFiles/par_crawler.dir/clean

CMakeFiles/par_crawler.dir/depend:
	cd /home/toyama/Documents/8_Semestre/supercomp/work/MPI_Crawler && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/toyama/Documents/8_Semestre/supercomp/work/MPI_Crawler /home/toyama/Documents/8_Semestre/supercomp/work/MPI_Crawler /home/toyama/Documents/8_Semestre/supercomp/work/MPI_Crawler /home/toyama/Documents/8_Semestre/supercomp/work/MPI_Crawler /home/toyama/Documents/8_Semestre/supercomp/work/MPI_Crawler/CMakeFiles/par_crawler.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/par_crawler.dir/depend

