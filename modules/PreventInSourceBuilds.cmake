include_guard(GLOBAL)

include(Messages)

# This function will prevent in-source builds
function(prevent_in_source_builds)
  cmake_parse_arguments(ARGS "REMOVE_FILES" "" "" "${ARGN}")
  # make sure the user doesn't play dirty with symlinks
  get_filename_component(SRC_DIR "${CMAKE_SOURCE_DIR}" REALPATH)
  get_filename_component(BIN_DIR "${CMAKE_BINARY_DIR}" REALPATH)
  # disallow in-source builds
  if("${SRC_DIR}" STREQUAL "${BIN_DIR}")
    if(NOT ${PROJECT_NAME} STREQUAL "")
      message(ERROR "${PROJECT_NAME} should not be configured & built in the ${PROJECT_NAME} source directory \"${CMAKE_SOURCE_DIR}\"")
    else()
      message(ERROR "Project should not be configured & built in the project source directory \"${CMAKE_SOURCE_DIR}\"")
    endif()
    message(ERROR "You must run cmake in a build directory.")
    message(ERROR "If you ran this function close to the project command you only have to delete the CMakeFiles folder and CMakeCache.txt file.")
    if(EXISTS "${CMMM_INSTALL_DESTINATION}")
      file(REMOVE_RECURSE "${CMMM_INSTALL_DESTINATION}")
    endif()
    if(EXISTS "${CMMM_DESTINATION_MODULES}")
      file(REMOVE_RECURSE "${CMMM_DESTINATION_MODULES}")
    endif()
    message(FATAL_ERROR "Quitting configuration")
  endif()
endfunction()
