include_guard(GLOBAL)

include(CPM)
cpm()

if(CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_SOURCE_DIR)
  include(CTest)
else()
 if(NOT DEFINED DEFAULT_CTEST_CONFIGURATION_TYPE)
    message(WARN "You have not included Doctest module in the source directory root \"${CMAKE_SOURCE_DIR}/CMakeLists.txt\" and you didn't call CTest neither in this directory.")
    message(WARN "You should call CTest in ${CMAKE_SOURCE_DIR}/CMakeLists.txt or include Doctest directly in it.")
    include(CTest)
 endif()
endif()

if(NOT DEFINED DOCTEST_VERSION)
  set(DOCTEST_VERSION "2.4.5")
endif()

if(NOT DEFINED DOCTEST_REPOSITORY)
  set(DOCTEST_REPOSITORY "https://gitlab.com/ExternalRepositories/doctest")
endif()

declare_option(REPOSITORY doctest OPTION DOCTEST_WITH_TESTS VALUE FALSE)
declare_option(REPOSITORY doctest OPTION DOCTEST_WITH_MAIN_IN_STATIC_LIB VALUE TRUE)
declare_option(REPOSITORY doctest OPTION DOCTEST_NO_INSTALL VALUE FALSE)
declare_option(REPOSITORY doctest OPTION DOCTEST_USE_STD_HEADERS VALUE TRUE)
print_options(REPOSITORY  doctest)

CPMAddPackage(NAME doctest GIT_REPOSITORY "${DOCTEST_REPOSITORY}" GIT_TAG "${DOCTEST_VERSION}" OPTIONS "${doctest_OPTIONS}")

if(doctest_ADDED)
  include("${doctest_SOURCE_DIR}/scripts/cmake/doctest.cmake")
else()
  include("${CMAKE_INSTALL_PREFIX}/lib/cmake/doctest/doctest.cmake")
endif()
