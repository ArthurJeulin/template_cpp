# **********************************************************
#      2024 : Arthur JEULIN
#      Copyright (c) Arthur JEULIN 
#      Created by Arthur JEULIN on 06/22/2024.
# **********************************************************
#
# Module : Create a my_library library
#

find_package(glog 0.6.0 REQUIRED)

set(library_name my_library)

add_library(${library_name} 
  my_library.cpp
)

target_include_directories(${library_name} PUBLIC 
  ${CMAKE_SOURCE_DIR}/include
)

target_link_libraries(${library_name} PUBLIC 
  glog::glog
)

target_compile_features(${library_name} PUBLIC 
    cxx_std_17
)


install(TARGETS ${library_name})