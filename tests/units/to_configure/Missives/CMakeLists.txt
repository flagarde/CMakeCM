cmake_minimum_required(VERSION 3.10)

project(MessagesTest
        VERSION "1"
        DESCRIPTION "Missives Test"
        HOMEPAGE_URL "https://github.com/flagarde/CMakeCM/blob/master/modules/Missives.cmake"
        LANGUAGES NONE
       )

set(CMAKE_MODULE_PATH "${MODULES_PATH}")

include(Testings)
include(Missives)

missive_mode(NAME "VERY_IMPORTANT"
             STYLE "BoldRed"
             APPEND_BEGIN "!!!!!"
             APPEND_END "!!!!!"
             APPEND_STYLE "BoldYellow")

#missive(SEND_ERROR "SEND_ERROR")
missive(WARNING "WARNING")
missive(AUTHOR_WARNING "AUTHOR_WARNING")
missive(DEPRECATION "DEPRECATION")
missive(STATUS "STATUS")
missive(NOTICE "NOTICE")
missive(VERBOSE "VERBOSE")
missive(DEBUG "DEBUG")
missive(TRACE "TRACE")
missive(ERROR "ERROR")
missive(WARN "WARN")
missive(INFO "INFO")
missive(NOTE "NOTE")
missive(TO_ADD "TO ADD")
missive(TO_REMOVE "TO REMOVE")
missive(VERY_IMPORTANT "VERY_IMPORTANT")
