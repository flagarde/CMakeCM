include_guard(GLOBAL)

include(Messages)

if(NOT DEFINED ZLIB-NG_TAG)
  set(ZLIB-NG_TAG "2.0.5")
endif()

if(NOT DEFINED ZLIB-NG_REPOSITORY)
  set(ZLIB-NG_REPOSITORY "https://github.com/zlib-ng/zlib-ng.git")
endif()

if(${USE_SYSTEM_ZLIB})
  find_package(ZLIB QUIET)
  if(ZLIB_FOUND)
    find_package(ZLIB)
    set(COMPILE_ZLIB FALSE)
  else()
    set(COMPILE_ZLIB TRUE)
    message(NOTE "Zlib not found ! Zlib will be compiled using ${ZLIB-NG_REPOSITORY} version ${ZLIB-NG_VERSION} !")
  endif()
else()
  set(COMPILE_ZLIB TRUE)
  message(NOTE "Zlib will be compiled using ${ZLIB-NG_REPOSITORY} version ${ZLIB-NG_VERSION}.")
endif()


if(COMPILE_ZLIB)
  include(CPM)
  cpm()

  declare_option(REPOSITORY zlib-ng OPTION WITH_GZFILEOP VALUE ON)
  declare_option(REPOSITORY zlib-ng OPTION ZLIB_COMPAT VALUE ON)
  declare_option(REPOSITORY zlib-ng OPTION ZLIB_ENABLE_TESTS VALUE OFF)
  declare_option(REPOSITORY zlib-ng OPTION ZLIB_DUAL_LINK VALUE OFF)
  declare_option(REPOSITORY zlib-ng OPTION WITH_SANITIZER VALUE OFF)
  declare_option(REPOSITORY zlib-ng OPTION WITH_FUZZERS VALUE OFF)
  declare_option(REPOSITORY zlib-ng OPTION WITH_OPTIM VALUE ON)
  declare_option(REPOSITORY zlib-ng OPTION WITH_NEW_STRATEGIES VALUE ON)
  declare_option(REPOSITORY zlib-ng OPTION WITH_NATIVE_INSTRUCTIONS VALUE OFF)
  declare_option(REPOSITORY zlib-ng OPTION WITH_MAINTAINER_WARNINGS VALUE OFF)
  declare_option(REPOSITORY zlib-ng OPTION WITH_CODE_COVERAGE VALUE OFF)
  declare_option(REPOSITORY zlib-ng OPTION WITH_INFLATE_STRICT VALUE OFF)
  declare_option(REPOSITORY zlib-ng OPTION WITH_INFLATE_ALLOW_INVALID_DIST VALUE OFF)
  declare_option(REPOSITORY zlib-ng OPTION WITH_UNALIGNED VALUE ON)
  print_options(REPOSITORY  zlib-ng)

  unset(ZLIB_FOUND CACHE)
  unset(ZLIB_FOUND PARENT_SCOPE)
  set(ZLIB_FOUND TRUE CACHE BOOL "" FORCE)

  CPMAddPackage(NAME zlib-ng
                 GIT_REPOSITORY "${ZLIB-NG_REPOSITORY}"
                 GIT_TAG "${ZLIB-NG_TAG}"
                 FETCHCONTENT_UPDATES_DISCONNECTED "${IS_OFFLINE}"
                 OPTIONS "${zlib-ng_OPTIONS}")

  if(zlib-ng_ADDED)
    file(STRINGS "${zlib-ng_SOURCE_DIR}/zlib.h" ZLIB_H REGEX "^#define ZLIB_VERSION \"[^\"]*\"$")
    string(REGEX REPLACE "^.*ZLIB_VERSION \"([0-9]+).*$" "\\1" ZLIB_VERSION_MAJOR "${ZLIB_H}")
    string(REGEX REPLACE "^.*ZLIB_VERSION \"[0-9]+\\.([0-9]+).*$" "\\1" ZLIB_VERSION_MINOR  "${ZLIB_H}")
    string(REGEX REPLACE "^.*ZLIB_VERSION \"[0-9]+\\.[0-9]+\\.([0-9]+).*$" "\\1" ZLIB_VERSION_PATCH "${ZLIB_H}")
    set(ZLIB_VERSION_STRING "${ZLIB_VERSION_MAJOR}.${ZLIB_VERSION_MINOR}.${ZLIB_VERSION_PATCH}")

    set(ZLIB_VERSION_TWEAK "")
    if("${ZLIB_H}" MATCHES "ZLIB_VERSION \"[0-9]+\\.[0-9]+\\.[0-9]+\\.([0-9]+)")
      set(ZLIB_VERSION_TWEAK "${CMAKE_MATCH_1}")
      string(APPEND ZLIB_VERSION_STRING ".${ZLIB_VERSION_TWEAK}")
    endif()

    set(ZLIB_VERSION ${ZLIB_VERSION_STRING} CACHE INTERNAL "")
    set(ZLIB_VERSION_STRING ${ZLIB_VERSION_STRING} CACHE INTERNAL "")

    set(ZLIB_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR} CACHE INTERNAL "")
    set(ZLIB_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR} CACHE INTERNAL "")

    add_library(ZLIB IMPORTED INTERFACE GLOBAL)
    target_include_directories(ZLIB INTERFACE $<BUILD_INTERFACE:${ZLIB_INCLUDE_DIR}> INTERFACE $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}>)
    target_link_libraries(ZLIB INTERFACE zlibstatic)

    set(ZLIB_LIBRARY "ZLIB" CACHE INTERNAL "")
    set(ZLIB_LIBRARIES "" CACHE INTERNAL "")
    set(ZLIB_LIBRARY_DEBUG "" CACHE INTERNAL "")
    set(ZLIB_LIBRARY_RELEASE "" CACHE INTERNAL "")

    add_library(ZLIB::ZLIB ALIAS ZLIB)
    find_package(ZLIB REQUIRED QUIET)
  endif()
endif()
