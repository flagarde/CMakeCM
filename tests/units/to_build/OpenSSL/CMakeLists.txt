cmake_minimum_required(VERSION 3.15)

project(OpenSSLTest
        VERSION "1"
        DESCRIPTION "OpenSSL Test"
        HOMEPAGE_URL "https://github.com/flagarde/CMakeCM/blob/master/modules/OpenSSL.cmake"
        LANGUAGES CXX)

set(CMAKE_MODULE_PATH "${MODULES_PATH}")

include(Testings)
include(OpenSSL)

# ---- Create binary ----
add_executable(TestOpenSSL main.cpp)
target_link_libraries(TestOpenSSL PRIVATE OpenSSL::SSL)
add_test(TestOpenSSL COMMAND TestOpenSSL 80)
