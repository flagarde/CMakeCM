include_guard(GLOBAL)

include(CPM)
cpm()

if(NOT DEFINED SOURCELOCATION_REPOSITORY)
  set(SOURCELOCATION_REPOSITORY "https://github.com/flagarde/source_location.git")
endif()

if(NOT DEFINED SOURCELOCATION_TAG)
  set(SOURCELOCATION_TAG "main")
endif()

declare_option(REPOSITORY SourceLocation OPTION BUILD_TESTS VALUE "OFF")
declare_option(REPOSITORY SourceLocation OPTION BUILD_DOCS VALUE "OFF")
declare_option(REPOSITORY SourceLocation OPTION BUILD_EXAMPLES VALUE "OFF")
print_options(REPOSITORY  SourceLocation)

CPMAddPackage(NAME SourceLocation
               GIT_REPOSITORY ${SOURCELOCATION_REPOSITORY}
               GIT_TAG ${SOURCELOCATION_TAG}
               FETCHCONTENT_UPDATES_DISCONNECTED ${IS_OFFLINE}
               OPTIONS ${SourceLocation_OPTIONS})
