cmake_minimum_required(VERSION 3.10)

project(MessagesTest
        VERSION "1"
        DESCRIPTION "Messages Test"
        HOMEPAGE_URL "https://github.com/flagarde/CMakeCM/blob/master/modules/Messages.cmake"
        LANGUAGES NONE
       )

set(CMAKE_MODULE_PATH "${MODULES_PATH}")

include(Testings)
include(Messages)

message_mode(NAME "VERY_IMPORTANT"
             STYLE "BoldRed"
             APPEND_BEGIN "!!!!!"
             APPEND_END "!!!!!"
             APPEND_STYLE "BoldYellow")

#message(SEND_ERROR "SEND_ERROR")
message(WARNING "WARNING")
message(AUTHOR_WARNING "AUTHOR_WARNING")
message(DEPRECATION "DEPRECATION")
message(STATUS "STATUS")
message(NOTICE "NOTICE")
message(VERBOSE "VERBOSE")
message(DEBUG "DEBUG")
message(TRACE "TRACE")
message(ERROR "ERROR")
message(WARN "WARN")
message(INFO "INFO")
message(NOTE "NOTE")
message(TODO "TODO")
message(TOADD "TO ADD")
message(TOREMOVE "TO REMOVE")
message(SUCCESS "SUCCESS")
message(FAILURE "FAILURE")
message(VERY_IMPORTANT "VERY_IMPORTANT")

