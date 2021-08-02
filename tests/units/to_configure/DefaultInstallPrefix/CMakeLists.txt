cmake_minimum_required(VERSION 3.10)

project(DefaultInstallPrefixTest
        VERSION "1"
        DESCRIPTION "DefaultInstallPrefix Test"
        HOMEPAGE_URL "https://github.com/flagarde/CMakeCM/blob/master/modules/DefaultInstallPrefix.cmake"
        LANGUAGES NONE
       )

set(CMAKE_MODULE_PATH "${MODULES_PATH}")

include(Testings)
include(DefaultInstallPrefix)

default_install_prefix("${CMAKE_CURRENT_SOURCE_DIR}/install")

ASSERT_NOT_EQUAL("${CMAKE_CURRENT_SOURCE_DIR}/install" "${CMAKE_INSTALL_PREFIX}")
