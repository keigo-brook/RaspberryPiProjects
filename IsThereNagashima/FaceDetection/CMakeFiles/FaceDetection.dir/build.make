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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.5.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.5.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/KeigoOgawa/work/RaspberryPiProjects/IsThereNagashima/FaceDetection

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/KeigoOgawa/work/RaspberryPiProjects/IsThereNagashima/FaceDetection

# Include any dependencies generated for this target.
include CMakeFiles/FaceDetection.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/FaceDetection.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/FaceDetection.dir/flags.make

CMakeFiles/FaceDetection.dir/main.cpp.o: CMakeFiles/FaceDetection.dir/flags.make
CMakeFiles/FaceDetection.dir/main.cpp.o: main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/KeigoOgawa/work/RaspberryPiProjects/IsThereNagashima/FaceDetection/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/FaceDetection.dir/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/FaceDetection.dir/main.cpp.o -c /Users/KeigoOgawa/work/RaspberryPiProjects/IsThereNagashima/FaceDetection/main.cpp

CMakeFiles/FaceDetection.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/FaceDetection.dir/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/KeigoOgawa/work/RaspberryPiProjects/IsThereNagashima/FaceDetection/main.cpp > CMakeFiles/FaceDetection.dir/main.cpp.i

CMakeFiles/FaceDetection.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/FaceDetection.dir/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/KeigoOgawa/work/RaspberryPiProjects/IsThereNagashima/FaceDetection/main.cpp -o CMakeFiles/FaceDetection.dir/main.cpp.s

CMakeFiles/FaceDetection.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/FaceDetection.dir/main.cpp.o.requires

CMakeFiles/FaceDetection.dir/main.cpp.o.provides: CMakeFiles/FaceDetection.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/FaceDetection.dir/build.make CMakeFiles/FaceDetection.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/FaceDetection.dir/main.cpp.o.provides

CMakeFiles/FaceDetection.dir/main.cpp.o.provides.build: CMakeFiles/FaceDetection.dir/main.cpp.o


# Object files for target FaceDetection
FaceDetection_OBJECTS = \
"CMakeFiles/FaceDetection.dir/main.cpp.o"

# External object files for target FaceDetection
FaceDetection_EXTERNAL_OBJECTS =

FaceDetection: CMakeFiles/FaceDetection.dir/main.cpp.o
FaceDetection: CMakeFiles/FaceDetection.dir/build.make
FaceDetection: /usr/local/lib/libopencv_videostab.3.1.0.dylib
FaceDetection: /usr/local/lib/libopencv_superres.3.1.0.dylib
FaceDetection: /usr/local/lib/libopencv_stitching.3.1.0.dylib
FaceDetection: /usr/local/lib/libopencv_shape.3.1.0.dylib
FaceDetection: /usr/local/lib/libopencv_photo.3.1.0.dylib
FaceDetection: /usr/local/lib/libopencv_objdetect.3.1.0.dylib
FaceDetection: /usr/local/lib/libopencv_calib3d.3.1.0.dylib
FaceDetection: /usr/local/lib/libopencv_features2d.3.1.0.dylib
FaceDetection: /usr/local/lib/libopencv_ml.3.1.0.dylib
FaceDetection: /usr/local/lib/libopencv_highgui.3.1.0.dylib
FaceDetection: /usr/local/lib/libopencv_videoio.3.1.0.dylib
FaceDetection: /usr/local/lib/libopencv_imgcodecs.3.1.0.dylib
FaceDetection: /usr/local/lib/libopencv_flann.3.1.0.dylib
FaceDetection: /usr/local/lib/libopencv_video.3.1.0.dylib
FaceDetection: /usr/local/lib/libopencv_imgproc.3.1.0.dylib
FaceDetection: /usr/local/lib/libopencv_core.3.1.0.dylib
FaceDetection: CMakeFiles/FaceDetection.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/KeigoOgawa/work/RaspberryPiProjects/IsThereNagashima/FaceDetection/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable FaceDetection"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/FaceDetection.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/FaceDetection.dir/build: FaceDetection

.PHONY : CMakeFiles/FaceDetection.dir/build

CMakeFiles/FaceDetection.dir/requires: CMakeFiles/FaceDetection.dir/main.cpp.o.requires

.PHONY : CMakeFiles/FaceDetection.dir/requires

CMakeFiles/FaceDetection.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/FaceDetection.dir/cmake_clean.cmake
.PHONY : CMakeFiles/FaceDetection.dir/clean

CMakeFiles/FaceDetection.dir/depend:
	cd /Users/KeigoOgawa/work/RaspberryPiProjects/IsThereNagashima/FaceDetection && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/KeigoOgawa/work/RaspberryPiProjects/IsThereNagashima/FaceDetection /Users/KeigoOgawa/work/RaspberryPiProjects/IsThereNagashima/FaceDetection /Users/KeigoOgawa/work/RaspberryPiProjects/IsThereNagashima/FaceDetection /Users/KeigoOgawa/work/RaspberryPiProjects/IsThereNagashima/FaceDetection /Users/KeigoOgawa/work/RaspberryPiProjects/IsThereNagashima/FaceDetection/CMakeFiles/FaceDetection.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/FaceDetection.dir/depend
