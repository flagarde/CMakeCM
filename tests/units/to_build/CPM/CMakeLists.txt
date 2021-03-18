cmake_minimum_required(VERSION 3.15)

project(CPMTest
        VERSION "1"
        DESCRIPTION "CPM Test"
        HOMEPAGE_URL "https://github.com/flagarde/CMakeCM/blob/master/modules/CPM.cmake"
        LANGUAGES CXX
       )

set(CMAKE_MODULE_PATH "${MODULES_PATH}")

include(Testings)
include(CPM)

cpm(VERSION 0.31.1)

declare_option(REPOSITORY fibonacci OPTION CMAKE_CXX_STANDARD VALUE 17)
declare_option(REPOSITORY fibonacci OPTION CMAKE_CXX_STANDARD_REQUIRED VALUE TRUE)
declare_option(REPOSITORY fibonacci OPTION CMAKE_CXX_EXTENSIONS VALUE FALSE)
print_options(REPOSITORY  fibonacci)

CPMAddPackage(
  NAME fibonacci
  GIT_REPOSITORY https://github.com/cpm-cmake/testpack-fibonacci.git
  VERSION "2.0"
  OPTIONS "${fibonacci_OPTIONS}"
)

# ---- Create binary ----
add_executable(TestCPM main.cpp)
target_link_libraries(TestCPM fibonacci)
set_target_properties(TestCPM PROPERTIES CXX_STANDARD 17 COMPILE_FLAGS "-Wall -pedantic -Wextra -Werror")
add_test(TestCPM COMMAND TestCPM)
