include_guard(GLOBAL)

include(CPM)
cpm()

if(CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_SOURCE_DIR)
  enable_testing()
else()
 if(NOT CMAKE_TESTING_ENABLED)
    missive(WARN "You have not included Doctest module in the source directory root \"${CMAKE_SOURCE_DIR}/CMakeLists.txt\" and you didn't call enable_testing() neither in this directory.")
    missive(WARN "You should call enable_testing() in ${CMAKE_SOURCE_DIR}/CMakeLists.txt or include Doctest directly in it.")
    enable_testing()
 endif()
endif()

if(NOT DEFINED DOCTEST_TAG)
  set(DOCTEST_TAG "v2.4.8")
endif()

if(NOT DEFINED DOCTEST_REPOSITORY)
  set(DOCTEST_REPOSITORY "https://github.com/onqtam/doctest.git")
endif()

declare_option(REPOSITORY doctest OPTION DOCTEST_WITH_TESTS VALUE FALSE)
declare_option(REPOSITORY doctest OPTION DOCTEST_WITH_MAIN_IN_STATIC_LIB VALUE TRUE)
declare_option(REPOSITORY doctest OPTION DOCTEST_NO_INSTALL VALUE FALSE)
declare_option(REPOSITORY doctest OPTION DOCTEST_USE_STD_HEADERS VALUE TRUE)
#https://github.com/doctest/doctest/issues/501
if (WIN32 AND (CMAKE_CXX_COMPILER_ID STREQUAL GNU))
  declare_option(REPOSITORY doctest OPTION DOCTEST_THREAD_LOCAL VALUE " ")
endif()
print_options(REPOSITORY  doctest)

CPMAddPackage(NAME doctest GIT_REPOSITORY "${DOCTEST_REPOSITORY}" GIT_TAG "${DOCTEST_TAG}" OPTIONS "${doctest_OPTIONS}")

if(doctest_ADDED)
  include("${doctest_SOURCE_DIR}/scripts/cmake/doctest.cmake")
else()
  include("${CMAKE_INSTALL_LIBDIR}/cmake/doctest/doctest.cmake")
endif()
