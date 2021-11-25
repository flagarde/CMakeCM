include(FindPackageHandleStandardArgs)
include(Missives)

# Search for gcov binary.
set(CMAKE_REQUIRED_QUIET_SAVE ${CMAKE_REQUIRED_QUIET})
set(CMAKE_REQUIRED_QUIET ${COVERAGE_FIND_QUIETLY})

get_property(ENABLED_LANGUAGES GLOBAL PROPERTY ENABLED_LANGUAGES)
foreach(LANG IN LISTS ENABLED_LANGUAGES)
  # Gcov evaluation is dependent on the used compiler. Check gcov support for each compiler that is used. If gcov binary was already found for this compiler, do not try to find it again.
  if(NOT GCOV_${CMAKE_${LANG}_COMPILER_ID}_BIN)
    get_filename_component(COMPILER_PATH "${CMAKE_${LANG}_COMPILER}" PATH)

    if("${CMAKE_${LANG}_COMPILER_ID}" STREQUAL "GNU")
      # Some distributions like OSX (homebrew) ship gcov with the compiler version appended as gcov-x. To find this binary we'll build the suggested binary name with the compiler version.
      string(REGEX MATCH "^[0-9]+.[0-9]+" GCC_VERSION "${CMAKE_${LANG}_COMPILER_VERSION}")
      string(REGEX MATCH "^[0-9]+" GCC_VERSION_2 "${CMAKE_${LANG}_COMPILER_VERSION}")
      find_program(GCOV_BIN NAMES "gcov-${GCC_VERSION_2}" "gcov-${GCC_VERSION}" gcov HINTS ${COMPILER_PATH})
      unset(GCC_VERSION)
      unset(GCC_VERSION_2)
    elseif("${CMAKE_${LANG}_COMPILER_ID}" MATCHES "^(Apple)?Clang$")
      # Some distributions like Debian ship llvm-cov with the compiler version appended as llvm-cov-x.y. To find this binary we'll build the suggested binary name with the compiler version.
      string(REGEX MATCH "^[0-9]+.[0-9]+" LLVM_VERSION "${CMAKE_${LANG}_COMPILER_VERSION}")
      string(REGEX MATCH "^[0-9]+" LLVM_VERSION_2 "${CMAKE_${LANG}_COMPILER_VERSION}")

      # llvm-cov prior version 3.5 seems to be not working with coverage evaluation tools, but these versions are compatible with the gcc gcov tool.
      if(LLVM_VERSION VERSION_GREATER 3.4)
        find_program(GCOV_BIN NAMES "llvm-cov-${LLVM_VERSION_2}" "llvm-cov-${LLVM_VERSION}" llvm-cov HINTS ${COMPILER_PATH})
        unset(LLVM_VERSION)
        unset(LLVM_VERSION_2)
        set(GCOV_COMMAND_PARAMETER "gcov" CACHE STRING "")
      else()
        string(REGEX MATCH "^[0-9]+.[0-9]+" VERSION "${CMAKE_${LANG}_COMPILER_VERSION}")
        string(REGEX MATCH "^[0-9]+" VERSION_2 "${CMAKE_${LANG}_COMPILER_VERSION}")
        find_program(GCOV_BIN "gcov-${VERSION_2}" "gcov-${VERSION}" gcov HINTS ${COMPILER_PATH})
      endif()
    endif()

    if(GCOV_BIN)
      set(GCOV_${CMAKE_${LANG}_COMPILER_ID}_BIN "${GCOV_BIN}" CACHE STRING "${LANG} gcov binary.")

      unset(GCOV_BIN CACHE)
      unset(GCOV_BIN)
    endif()
  endif()
endforeach()

foreach(LANG IN LISTS ENABLED_LANGUAGES)
  if(DEFINED GCOV_${CMAKE_${LANG}_COMPILER_ID}_BIN)
    list(APPEND REQUIRED_VARS GCOV_${CMAKE_${LANG}_COMPILER_ID}_BIN)
  endif()
endforeach()

set(CMAKE_REQUIRED_QUIET ${CMAKE_REQUIRED_QUIET_SAVE})
unset(CMAKE_REQUIRED_QUIET_SAVE)

find_package_handle_standard_args(Gcov REQUIRED_VARS ${REQUIRED_VARS})
