include_guard(GLOBAL)

find_package(Doxygen QUIET OPTIONAL_COMPONENTS mscgen dia dot)

if(DOXYGEN_FOUND)
  if(NOT DEFINED DOXYGEN_OUTPUT_DIRECTORY)
    set(DOXYGEN_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/doxygen")
  endif()

  if(NOT EXISTS "${CMAKE_CURRENT_BINARY_DIR}/doxygen")
    file(MAKE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/doxygen")
  endif()

  if(NOT DOCS_ADD_TO_ALL)
    set(DOCS_ADD_TO_ALL_STRING "")
  else()
    set(DOCS_ADD_TO_ALL_STRING "ALL")
  endif()
endif()

function(configure_doxyfile)
  if(DOXYGEN_FOUND)
    if(NOT DEFINED CONFIG_FILE)
      if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile")
        set(CONFIG_FILE "${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile")
      else()
        include(Doxyfile)
        set(CONFIG_FILE_TO_CONFIGURE "${CMAKE_CURRENT_BINARY_DIR}/Doxyfile.in")
        set(CONFIG_FILE "${CMAKE_CURRENT_BINARY_DIR}/Doxyfile")
      endif()
    endif()

    if(NOT DEFINED DOXYGEN_PROJECT_NAME)
      set(DOXYGEN_PROJECT_NAME ${PROJECT_NAME})
    endif()

    if(NOT DEFINED DOXYGEN_PROJECT_NUMBER)
      set(DOXYGEN_PROJECT_NUMBER ${PROJECT_VERSION})
    endif()

    if(NOT DEFINED DOXYGEN_PROJECT_BRIEF)
      set(DOXYGEN_PROJECT_BRIEF ${PROJECT_DESCRIPTION})
    endif()

    configure_file(${CONFIG_FILE_TO_CONFIGURE} "${CONFIG_FILE}" @ONLY)

    add_custom_target(docs ${DOCS_ADD_TO_ALL_STRING} COMMAND Doxygen::doxygen ${CONFIG_FILE} COMMENT "Generating API documentation with Doxygen" VERBATIM)
  else()
    add_custom_target(docs ${DOCS_ADD_TO_ALL_STRING} COMMAND ${CMAKE_COMMAND} -E echo "Doxygen is not found !!" COMMENT "Generating API documentation with Doxygen" VERBATIM)
  endif()
endfunction()

if(DOXYGEN_FOUND)
  install(DIRECTORY "${DOXYGEN_OUTPUT_DIRECTORY}/" DESTINATION "docs")
endif()
