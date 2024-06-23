# **********************************************************
#      2024 : Arthur JEULIN
#      Copyright (c) Arthur JEULIN 
#      Created by Arthur JEULIN on 06/22/2024.
# **********************************************************

cmake_minimum_required(VERSION 3.27.5)

set(POSITION_INDEPENDENT_CODE ON)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/example)

# Find all example cpp files in the example directory
file(GLOB EXAMPLE_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")

foreach(example_source ${EXAMPLE_SOURCES})
  # Get a human readable name
  get_filename_component(example_name ${example_source} NAME_WE)

  # Add executable for this example
  add_executable(${example_name} ${example_source})

  
  target_include_directories(${example_name} PUBLIC  
    ${PROJECT_SOURCE_DIR}/include
    )
  
  target_link_libraries(${example_name} PRIVATE 
     my_library
    )
  
  if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    add_compile_options(-fpermissive)
  endif()
  
  target_compile_features(${example_name} PRIVATE cxx_std_17)
  
  install(TARGETS ${example_name})
endforeach()