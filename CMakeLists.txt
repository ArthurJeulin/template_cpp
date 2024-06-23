# **********************************************************
#      2024 : Arthur JEULIN
#      Copyright (c) Arthur JEULIN
#      Created by Arthur JEULIN on 06/22/2024.
# **********************************************************
cmake_minimum_required(VERSION 3.27.5)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Indiquez à CMake d'utiliser les outils de vcpkg
if(UNIX)
endif()
if(WIN32)
  set(CMAKE_GENERATOR_TOOLSET "v142") 
endif()

set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake"
  CACHE STRING "Vcpkg toolchain file")

  
project(template
DESCRIPTION "Template Project Library "
LANGUAGES CXX
)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

option(BUILD_SHARED_LIBS "Build shared libraries" OFF)

  
include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)
# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)
enable_testing() #to  discover tests in test explorer 

include_directories(include)
include_directories( "${PROJECT_SOURCE_DIR}/build/vcpkg_installed/x64-windows/include")

add_subdirectory(src)
add_subdirectory(example)
add_subdirectory(test)