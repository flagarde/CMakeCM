cmake_minimum_required(VERSION 3.10)

project(PythonStandalone
        VERSION "1"
        DESCRIPTION "Python Standalone Test"
        HOMEPAGE_URL "https://github.com/flagarde/CMakeCM/blob/master/modules/PythonStandalone"
        LANGUAGES NONE
       )

set(CMAKE_MODULE_PATH "${MODULES_PATH}")

set(STANDALONE_PROJECT TRUE)
include(Python)
