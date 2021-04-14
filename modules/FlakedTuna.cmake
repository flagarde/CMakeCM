include_guard(GLOBAL)

include(CPM)
cpm()

if(NOT DEFINED FLAKEDTUNA_VERSION)
  set(FLAKEDTUNA_VERSION "1.0")
endif()

if(NOT DEFINED FLAKEDTUNA_REPOSITORY)
  set(FLAKEDTUNA_REPOSITORY "https://gitlab.com/flagarde/FlakedTuna.git")
endif()

declare_option(REPOSITORY FlakedTuna OPTION BUILD_TESTS VALUE OFF)
declare_option(REPOSITORY FlakedTuna OPTION BUILD_EXAMPLES VALUE OFF)
print_options(REPOSITORY  FlakedTuna)

CPMAddPackage(NAME FlakedTuna
               GIT_REPOSITORY ${FLAKEDTUNA_REPOSITORY}
               VERSION ${FLAKEDTUNA_VERSION}
               FETCHCONTENT_UPDATES_DISCONNECTED ${IS_OFFLINE}
               OPTIONS ${FlakedTuna_OPTIONS})
