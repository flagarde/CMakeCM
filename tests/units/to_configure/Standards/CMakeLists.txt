cmake_minimum_required(VERSION 3.10)

project(StandardsTest
        VERSION "1"
        DESCRIPTION "Testings Test"
        HOMEPAGE_URL "https://github.com/flagarde/CMakeCM/blob/master/modules/Standards.cmake"
        LANGUAGES NONE
       )

set(CMAKE_MODULE_PATH "${MODULES_PATH}")

include(Testings)
include(Standards)

cxx_20()
c_90()

ASSERT_NOT_EQUAL("90" "${CMAKE_C_STANDARD}")
ASSERT_NOT_EQUAL("20" "${CMAKE_CXX_STANDARD}")

ASSERT_NOT_EQUAL("ON" "${CMAKE_C_STANDARD_REQUIRED}")
ASSERT_NOT_EQUAL("ON" "${CMAKE_CXX_STANDARD_REQUIRED}")

ASSERT_NOT_EQUAL("OFF" "${CMAKE_C_EXTENSIONS}")
ASSERT_NOT_EQUAL("OFF" "${CMAKE_C_EXTENSIONS}")
