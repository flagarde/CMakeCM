cmake_minimum_required(VERSION 3.10)

project(Python
        VERSION "1"
        DESCRIPTION "Python Test"
        HOMEPAGE_URL "https://github.com/flagarde/CMakeCM/blob/master/modules/PythonStandalone"
        LANGUAGES NONE
       )

set(CMAKE_MODULE_PATH "${MODULES_PATH}")

set(STANDALONE_PROJECT FALSE)
set(PYTHON_ALLOW_FALLBACK FALSE)
include(Python)
