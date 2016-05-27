cmake_minimum_required(VERSION 3.0.2)
project(FaceDetection)

find_package(OpenCV REQUIRED)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
set(SOURCE_FILES main.cpp)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/")

add_executable(FaceDetection ${SOURCE_FILES})
target_link_libraries(FaceDetection ${OpenCV_LIBS})