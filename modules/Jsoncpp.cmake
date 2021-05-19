include(Messages)

if(NOT DEFINED JSONCPP_TAG)
  set(JSONCPP_TAG "1.9.4")  
endif()

if(NOT DEFINED JSONCPP_REPOSITORY)
  set(JSONCPP_REPOSITORY "https://github.com/open-source-parsers/jsoncpp.git")
endif()

if(${USE_SYSTEM_JSONCPP})
  find_package(jsoncpp QUIET)
  if(jsoncpp_FOUND)
    find_package(jsoncpp)
    set(COMPILE_JSONCPP FALSE)
  else()
    set(COMPILE_JSONCPP TRUE)
    message(NOTE "jsoncpp not found ! jsoncpp will be compiled using ${JSONCPP_REPOSITORY} version ${JSONCPP_VERSION} !")
  endif()
else()
  set(COMPILE_JSONCPP TRUE)
  if(NOT jsoncpp_ADDED)
    message(NOTE "jsoncpp will be compiled using ${JSONCPP_REPOSITORY} version ${JSONCPP_VERSION}.")
  endif()
endif()


if(COMPILE_JSONCPP)
  include(CPM)
  cpm()
  
  declare_option(REPOSITORY "jsoncpp" OPTION "JSONCPP_WITH_TESTS" VALUE "OFF")
  declare_option(REPOSITORY "jsoncpp" OPTION "JSONCPP_WITH_POST_BUILD_UNITTEST" VALUE "OFF")
  declare_option(REPOSITORY "jsoncpp" OPTION "JSONCPP_WITH_WARNING_AS_ERROR" VALUE "OFF")
  declare_option(REPOSITORY "jsoncpp" OPTION "JSONCPP_WITH_STRICT_ISO" VALUE "OFF")
  declare_option(REPOSITORY "jsoncpp" OPTION "JSONCPP_WITH_PKGCONFIG_SUPPORT" VALUE "OFF")
  declare_option(REPOSITORY "jsoncpp" OPTION "JSONCPP_WITH_CMAKE_PACKAGE" VALUE "ON")
  declare_option(REPOSITORY "jsoncpp" OPTION "JSONCPP_WITH_EXAMPLE" VALUE "OFF")
  declare_option(REPOSITORY "jsoncpp" OPTION "JSONCPP_STATIC_WINDOWS_RUNTIME" VALUE "ON")
  declare_option(REPOSITORY "jsoncpp" OPTION "BUILD_SHARED_LIBS" VALUE "ON")
  declare_option(REPOSITORY "jsoncpp" OPTION "BUILD_STATIC_LIBS" VALUE "ON")
  declare_option(REPOSITORY "jsoncpp" OPTION "BUILD_OBJECT_LIBS" VALUE "ON")
  print_options(REPOSITORY "jsoncpp")

  CPMAddPackage(NAME jsoncpp
                 GIT_REPOSITORY "${JSONCPP_REPOSITORY}"
                 GIT_TAG "${JSONCPP_TAG}"
                 FETCHCONTENT_UPDATES_DISCONNECTED ${IS_OFFLINE}
                 OPTIONS "${jsoncpp_OPTIONS}")
endif()
