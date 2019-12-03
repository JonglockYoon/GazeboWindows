cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

find_package(Boost REQUIRED COMPONENTS system)
include_directories(${Boost_INCLUDE_DIRS})
link_directories(${Boost_LIBRARY_DIRS})

find_package(gazebo REQUIRED) #!!!
include (FindPkgConfig)
if (PKG_CONFIG_FOUND)
 pkg_check_modules(GAZEBO gazebo)
endif()
include_directories(${GAZEBO_INCLUDE_DIRS})
link_directories(${GAZEOB_LIBRARY_DIRS})

add_library(ganzang_spin SHARED ganzang_spin.cc)
target_link_libraries(ganzang_spin ${GAZEBO_LIBRARIES} ${Boost_LIBRARIES})
