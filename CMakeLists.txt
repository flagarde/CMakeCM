cmake_minimum_required(VERSION 3.15)

project(CMakeCM VERSION 1.0 DESCRIPTION "CMake Community Modules" HOMEPAGE_URL "https://github.com/flagarde/CMakeCM" LANGUAGES NONE)

option(BUILD_TESTS "Build the tests." OFF)
option(BUILD_DOCS "Build the docs." OFF)
option(BUILD_EXAMPLES "Build the examples." OFF)

if(BUILD_TESTS)
  include(CTest)
  add_subdirectory(tests)
endif()

if(BUILD_DOCS)
  include(modules/Documentations.cmake)
  add_subdirectory(docs)
endif()

if(BUILD_EXAMPLES)
  add_subdirectory(examples)
endif()
