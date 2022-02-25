include_guard(GLOBAL)

include(CPM)
cpm()

if(NOT DEFINED FMT_REPOSITORY)
  set(FMT_REPOSITORY "https://github.com/fmtlib/fmt")
endif()

if(NOT DEFINED FMT_TAG)
  set(FMT_TAG "8.1.1")
endif()

declare_option(REPOSITORY fmt OPTION FMT_PEDANTIC VALUE OFF)
declare_option(REPOSITORY fmt OPTION FMT_WERROR VALUE OFF)
declare_option(REPOSITORY fmt OPTION FMT_DOC VALUE OFF)
declare_option(REPOSITORY fmt OPTION FMT_INSTALL VALUE ON)
declare_option(REPOSITORY fmt OPTION FMT_TEST VALUE OFF)
declare_option(REPOSITORY fmt OPTION FMT_FUZZ VALUE OFF)
declare_option(REPOSITORY fmt OPTION FMT_CUDA_TEST VALUE OFF)
declare_option(REPOSITORY fmt OPTION FMT_OS VALUE ON)
declare_option(REPOSITORY fmt OPTION FMT_SYSTEM_HEADERS VALUE ON)
print_options(REPOSITORY  fmt)

CPMAddPackage(NAME fmt
               GIT_REPOSITORY ${FMT_REPOSITORY}
               GIT_TAG ${FMT_TAG}
               FETCHCONTENT_UPDATES_DISCONNECTED ${IS_OFFLINE}
               OPTIONS "${fmt_OPTIONS}"
              )
