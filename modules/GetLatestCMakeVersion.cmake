include_guard(GLOBAL)

if(NOT EXISTS "${CMAKE_BINARY_DIR}/CMakeVersion.txt")
  file(DOWNLOAD "https://cmake.org/download" "${CMAKE_BINARY_DIR}/CMakeVersion.txt")
endif()

file(READ "${CMAKE_BINARY_DIR}/CMakeVersion.txt" CMakeVersion)

string(REGEX MATCH "\\((([0-9]+\\.)+[0-9]+[a-zA-Z0-9]*)\\)" FOUND "${CMakeVersion}")
string(LENGTH ${FOUND} NBR)
math(EXPR NBR "${NBR}-2")

string(SUBSTRING ${FOUND} 1 ${NBR} CMAKE_LATEST_VERSION)
