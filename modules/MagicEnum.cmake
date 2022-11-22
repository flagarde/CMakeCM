include_guard(GLOBAL)

include(CPM)
cpm()

if(NOT DEFINED MAGIC_ENUM_REPOSITORY)
  set(MAGIC_ENUM_REPOSITORY "https://github.com/Neargye/magic_enum.git")
endif()

if(NOT DEFINED MAGIC_ENUM_TAG)
  set(MAGIC_ENUM_TAG "v0.8.1")
endif()

declare_option(REPOSITORY magic_enum OPTION MAGIC_ENUM_OPT_BUILD_EXAMPLES VALUE OFF)
declare_option(REPOSITORY magic_enum OPTION MAGIC_ENUM_OPT_BUILD_TESTS VALUE OFF)
declare_option(REPOSITORY magic_enum OPTION MAGIC_ENUM_OPT_INSTALL VALUE ON)
print_options(REPOSITORY  magic_enum)

CPMAddPackage(NAME magic_enum
              GIT_REPOSITORY ${MAGIC_ENUM_REPOSITORY}
              GIT_TAG ${MAGIC_ENUM_TAG}
              FETCHCONTENT_UPDATES_DISCONNECTED ${IS_OFFLINE}
              OPTIONS "${magic_enum_OPTIONS}")
