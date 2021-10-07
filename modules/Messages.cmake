include_guard(GLOBAL)

if(NOT CMAKECM_MESSAGES_MODULE_LOADED)
  set(CMAKECM_MESSAGES_MODULE_LOADED "TRUE")

  include(Colors)

  # CMake default message groups
  list(
    APPEND
    DEFAULT_MESSAGE_MODES
    "FATAL_ERROR"
    "SEND_ERROR"
    "WARNING"
    "AUTHOR_WARNING"
    "DEPRECATION"
    "NOTICE"
    "STATUS"
    "VERBOSE"
    "DEBUG"
    "TRACE"
    "CHECK_START"
    "CHECK_FAIL"
    "CHECK_PASS"
    )

  list(APPEND MESSAGE_MODES ${DEFAULT_MESSAGE_MODES})

  function(message_mode)
    cmake_parse_arguments(ARG "" "NAME;PARENT_MODE;STYLE;APPEND_BEGIN;APPEND_END;APPEND_STYLE;APPEND_STYLE_BEGIN;APPEND_STYLE_END" "" ${ARGN})
    if(NOT DEFINED ARG_NAME)
      message(FATAL_ERROR "NAME is mandatory !")
    endif()
    string(STRIP ${ARG_NAME} ARG_NAME)
    if(ARG_NAME STREQUAL "")
      message(FATAL_ERROR "NAME cannot be blank !")
    endif()
    string(TOUPPER ${ARG_NAME} UPPER_ARG_NAME)
    if(NOT ${ARG_NAME} STREQUAL ${UPPER_ARG_NAME})
      message(FATAL_ERROR "NAME is not an upper case word !")
    endif()

    list(APPEND MESSAGE_MODES "${MESSAGE_MODES}" "${UPPER_ARG_NAME}")
    list(REMOVE_DUPLICATES MESSAGE_MODES)
    set(MESSAGE_MODES "${MESSAGE_MODES}" PARENT_SCOPE)

    if(NOT DEFINED ARG_PARENT_MODE)
      # If PARENT_MODE is not present it means :
      # -- For new Mode it don't want to be the daughter or some previously defined mode.
      # -- For CMake predefined Mode it's just mean it redefined it.
      list(FIND DEFAULT_MESSAGE_MODES ${ARG_NAME} MODE_FOUND)
      if(${MODE_FOUND} STREQUAL "-1")
        set_property(GLOBAL PROPERTY "${ARG_NAME}_PARENT_MODE" "")
      else()
        set_property(GLOBAL PROPERTY "${ARG_NAME}_PARENT_MODE" "${ARG_NAME}")
      endif()
    else()
      string(STRIP ${ARG_PARENT_MODE} ARG_PARENT_MODE)
      list(FIND MESSAGE_MODES ${ARG_PARENT_MODE} MODE_FOUND)
      if(${MODE_FOUND} STREQUAL "-1")
        list(JOIN MESSAGE_MODES ", " STRING_DEFAULT_MESSAGE_MODES)
        message(FATAL_ERROR "PARENT_MODE must be in this list : ${STRING_DEFAULT_MESSAGE_MODES}.")
      else()
        set_property(GLOBAL PROPERTY "${ARG_NAME}_PARENT_MODE" "${ARG_PARENT_MODE}")
      endif()
    endif()

    if(DEFINED ARG_STYLE)
      set_property(GLOBAL PROPERTY "${ARG_NAME}_STYLE" "${ARG_STYLE}")
    else()
      get_property(STYLE GLOBAL PROPERTY "${ARG_PARENT_MODE}_STYLE")
      set_property(GLOBAL PROPERTY "${ARG_NAME}_STYLE" "${STYLE}")
    endif()

    if(DEFINED ARG_APPEND_BEGIN)
      set_property(GLOBAL PROPERTY "${ARG_NAME}_APPEND_BEGIN" "${ARG_APPEND_BEGIN}")
    else()
      get_property(APPEND_BEGIN GLOBAL PROPERTY "${ARG_PARENT_MODE}_APPEND_BEGIN")
      set_property(GLOBAL PROPERTY "${ARG_NAME}_APPEND_BEGIN" "${APPEND_BEGIN}")
    endif()

    if(DEFINED ARG_APPEND_END)
      set_property(GLOBAL PROPERTY "${ARG_NAME}_APPEND_END" "${ARG_APPEND_END}")
    else()
      get_property(APPEND_END GLOBAL PROPERTY "${ARG_PARENT_MODE}_APPEND_END")
      set_property(GLOBAL PROPERTY "${ARG_NAME}_APPEND_END" "${APPEND_END}")
    endif()

    if(DEFINED ARG_APPEND_STYLE)
      set_property(GLOBAL PROPERTY "${ARG_NAME}_APPEND_STYLE_BEGIN" "${ARG_APPEND_STYLE}")
      set_property(GLOBAL PROPERTY "${ARG_NAME}_APPEND_STYLE_END" "${ARG_APPEND_STYLE}")
    else()
      if(DEFINED ARG_APPEND_STYLE_BEGIN)
        set_property(GLOBAL PROPERTY "${ARG_NAME}_APPEND_STYLE_BEGIN" "${ARG_APPEND_STYLE_BEGIN}")
      else()
        get_property(APPEND_STYLE_BEGIN GLOBAL PROPERTY "${ARG_PARENT_MODE}_APPEND_STYLE_BEGIN")
        set_property(GLOBAL PROPERTY "${ARG_NAME}_APPEND_STYLE_BEGIN" "${APPEND_STYLE_BEGIN}")
      endif()
      if(DEFINED ARG_APPEND_STYLE_END)
        set_property(GLOBAL PROPERTY "${ARG_NAME}_APPEND_STYLE_END" "${ARG_APPEND_STYLE_END}")
      else()
        get_property(APPEND_STYLE_END GLOBAL PROPERTY "${ARG_PARENT_MODE}_APPEND_STYLE_END")
        set_property(GLOBAL PROPERTY "${ARG_NAME}_APPEND_STYLE_END" "${APPEND_STYLE_END}")
      endif()
    endif()
  endfunction()

  # Restore the default MODES
  function(restore_to_default MODE)
    list(FIND DEFAULT_MESSAGE_MODES ${MODE} MODE_FOUND)
    if(${MODE_FOUND} STREQUAL "-1")
      list(JOIN MESSAGE_MODES ", " STRING_DEFAULT_MESSAGE_MODES)
      message(WARNING "Mode ${MODE} is not a CMake Mode : ${STRING_DEFAULT_MESSAGE_MODES}")
    else()
      message_mode(NAME ${MODE})
    endif()
  endfunction()

  function(restore_to_default_all_modes)
    foreach(MODE IN LISTS DEFAULT_MESSAGE_MODES)
      restore_to_default(${MODE})
    endforeach()
  endfunction()

  # This call is to register the default CMake modes
  restore_to_default_all_modes()

  set(Default "\${Default}")

  function(missive)
    if(${ARGC} STREQUAL "1")
      string(REPLACE "\${Default}" "${Reset}" ARGV ${ARGV})
      message("${ARGV}")
      return()
    endif()

    list(GET ARGV 0 MESSAGE_MODE)
    list(FIND MESSAGE_MODES ${MESSAGE_MODE} MESSAGE_MODE_FOUND)
    if(NOT ${MESSAGE_MODE_FOUND} STREQUAL "-1")
      list(REMOVE_AT ARGV 0)
      list(JOIN ARGV ";" STRING_ARGV)
      get_property(PARENT_MODE GLOBAL PROPERTY "${MESSAGE_MODE}_PARENT_MODE")
      get_property(APPEND_BEGIN GLOBAL PROPERTY "${MESSAGE_MODE}_APPEND_BEGIN")
      get_property(APPEND_END GLOBAL PROPERTY "${MESSAGE_MODE}_APPEND_END")
      get_property(APPEND_STYLE_BEGIN GLOBAL PROPERTY "${MESSAGE_MODE}_APPEND_STYLE_BEGIN")
      get_property(APPEND_STYLE_END GLOBAL PROPERTY "${MESSAGE_MODE}_APPEND_STYLE_END")
      get_property(STYLE GLOBAL PROPERTY "${MESSAGE_MODE}_STYLE")
      if(NOT STRING_ARGV STREQUAL "")
        string(REPLACE "\${Default}" "${${STYLE}}" STRING_ARGV ${STRING_ARGV})
      endif()
      message(
        ${PARENT_MODE}
        ${${APPEND_STYLE_BEGIN}}
        ${APPEND_BEGIN}
        ${Reset}
        ${${STYLE}}
        ${STRING_ARGV}
        ${Reset}
        ${${APPEND_STYLE_END}}
        ${APPEND_END}${Reset}
        )
    else()
      message(${ARGV})
    endif()
  endfunction()

  function(message)
    if(${ARGC} STREQUAL "1")
      string(REPLACE "\${Default}" "${Reset}" ARGV ${ARGV})
      _message("${ARGV}")
      return()
    endif()

    list(GET ARGV 0 MESSAGE_MODE)
    list(FIND MESSAGE_MODES ${MESSAGE_MODE} MESSAGE_MODE_FOUND)
    if(NOT ${MESSAGE_MODE_FOUND} STREQUAL "-1")
      list(REMOVE_AT ARGV 0)
      list(JOIN ARGV ";" STRING_ARGV)
      get_property(PARENT_MODE GLOBAL PROPERTY "${MESSAGE_MODE}_PARENT_MODE")
      get_property(APPEND_BEGIN GLOBAL PROPERTY "${MESSAGE_MODE}_APPEND_BEGIN")
      get_property(APPEND_END GLOBAL PROPERTY "${MESSAGE_MODE}_APPEND_END")
      get_property(APPEND_STYLE_BEGIN GLOBAL PROPERTY "${MESSAGE_MODE}_APPEND_STYLE_BEGIN")
      get_property(APPEND_STYLE_END GLOBAL PROPERTY "${MESSAGE_MODE}_APPEND_STYLE_END")
      get_property(STYLE GLOBAL PROPERTY "${MESSAGE_MODE}_STYLE")
      if(NOT STRING_ARGV STREQUAL "")
        string(REPLACE "\${Default}" "${${STYLE}}" STRING_ARGV ${STRING_ARGV})
      endif()
      _message(
        ${PARENT_MODE}
        ${${APPEND_STYLE_BEGIN}}
        ${APPEND_BEGIN}
        ${Reset}
        ${${STYLE}}
        ${STRING_ARGV}
        ${Reset}
        ${${APPEND_STYLE_END}}
        ${APPEND_END}${Reset}
        )
    else()
      _message(${ARGV})
    endif()
  endfunction()

  if(NOT NOT_REDEFINE_CMAKE_MODES)
    message_mode(NAME "FATAL_ERROR" STYLE "Red")
    message_mode(NAME "SEND_ERROR" STYLE "Red")
    message_mode(NAME "WARNING" STYLE "Yellow")
    message_mode(NAME "AUTHOR_WARNING" STYLE "Yellow")
    message_mode(NAME "DEPRECATION" STYLE "White")
  endif()

  if(NOT NOT_DEFINE_MODES)
    message_mode(NAME "ERROR" STYLE "BoldRed" APPEND_BEGIN "!! " APPEND_END " !!" APPEND_STYLE "BoldRed")
    message_mode(NAME "WARN" STYLE "BoldYellow" APPEND_BEGIN "## " APPEND_END " ##" APPEND_STYLE "BoldYellow")
    message_mode(NAME "INFO" STYLE "BoldGreen" APPEND_BEGIN "** " APPEND_END " **" APPEND_STYLE "BoldGreen")
    message_mode(NAME "NOTE" STYLE "BoldMagenta" APPEND_BEGIN "-- " APPEND_END " --" APPEND_STYLE "BoldMagenta")
    message_mode(NAME "TOREMOVE" PARENT_SCOPE "DEBUG" APPEND_BEGIN "-- " APPEND_END " --" APPEND_STYLE "Red" STYLE "Red")
    message_mode(NAME "TOADD" PARENT_SCOPE "DEBUG" APPEND_BEGIN "++ " APPEND_END " ++" APPEND_STYLE "Green" STYLE "Green")
  endif()
endif()
