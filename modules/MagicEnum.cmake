include_guard(GLOBAL)

include(CPM)
cpm()

if(NOT DEFINED MAGIC_ENUM_REPOSITORY)
  set(MAGIC_ENUM_REPOSITORY "Neargye/magic_enum")
endif()

if(NOT DEFINED MAGIC_ENUM_VERSION)
  set(MAGIC_ENUM_VERSION "v0.7.2")
endif()

declare_option(REPOSITORY magic_enum OPTION MAGIC_ENUM_OPT_BUILD_EXAMPLES VALUE OFF)
declare_option(REPOSITORY magic_enum OPTION MAGIC_ENUM_OPT_BUILD_TESTS VALUE OFF)
declare_option(REPOSITORY magic_enum OPTION MAGIC_ENUM_OPT_INSTALL VALUE ON)
print_options(REPOSITORY  magic_enum)

CPMAddPackage(NAME magic_enum
              GITHUB_REPOSITORY ${MAGIC_ENUM_REPOSITORY}
              GIT_TAG ${MAGIC_ENUM_VERSION}
              FETCHCONTENT_UPDATES_DISCONNECTED ${IS_OFFLINE}
              OPTIONS "${magic_enum_OPTIONS}")
