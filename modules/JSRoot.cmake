include_guard(GLOBAL)

include(CPM)
cpm()

if(NOT DEFINED JSROOT_REPOSITORY)
  set(JSROOT_REPOSITORY "https://github.com/root-project/jsroot.git")
endif()

if(NOT DEFINED JSROOT_VERSION)
  set(JSROOT_VERSION "6.1.0")
endif()

declare_option(REPOSITORY jsroot OPTION JSROOT_INSTALL_PREFIX VALUE "${CMAKE_INSTALL_PREFIX}/www/jsroot")
print_options(REPOSITORY  jsroot)

CPMAddPackage(NAME jsroot
               GIT_REPOSITORY ${JSROOT_REPOSITORY}
               GIT_TAG ${JSROOT_VERSION}
               FETCHCONTENT_UPDATES_DISCONNECTED ${IS_OFFLINE}
               OPTIONS ${jsroot_OPTIONS})

if(jsroot_ADDED)
  get_option(REPOSITORY jsroot OPTION JSROOT_INSTALL_PREFIX VALUE VARIABLE JSROOT_INSTALL_PREFIX)
  file(COPY "${jsroot_SOURCE_DIR}/" DESTINATION "${JSROOT_INSTALL_PREFIX}")
endif()
