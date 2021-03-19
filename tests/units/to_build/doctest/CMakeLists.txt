cmake_minimum_required(VERSION 3.15)

project(DoctestTest
        VERSION "1"
        DESCRIPTION "Doctest Test"
        HOMEPAGE_URL "https://github.com/flagarde/CMakeCM/blob/master/modules/Doctest.cmake"
        LANGUAGES CXX
       )

set(CMAKE_MODULE_PATH "${MODULES_PATH}")

include(Testings)
include(Doctest)

# ---- Create binary ----
add_executable(TestDoctest main.cpp)
target_link_libraries(TestDoctest PRIVATE doctest::doctest)
doctest_discover_tests(TestDoctest)
