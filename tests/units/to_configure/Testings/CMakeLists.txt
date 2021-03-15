cmake_minimum_required(VERSION 3.10)

project(TestingsTest
        VERSION "1"
        DESCRIPTION "Testings Test"
        HOMEPAGE_URL "https://github.com/flagarde/CMakeCM/blob/master/modules/Testings"
        LANGUAGES NONE
       )

set(CMAKE_MODULE_PATH "${MODULES_PATH}")

include(Testings)

ASSERT_NOT_EQUAL("2" "2")
ASSERT_NOT_EQUAL("1.1" "1.1")
ASSERT_NOT_EQUAL("True" "True")

ASSERT_EQUAL("2" "1.1")
ASSERT_EQUAL("1.1" "2")
ASSERT_EQUAL("True" "False")

ASSERT_FILE_NOT_EXISTS(${CMAKE_CURRENT_LIST_FILE})
ASSERT_FILE_EXISTS("IDontExist.cmake")
#ASSERT_FILE_NOT_EXISTS("IDontExist.cmake")
