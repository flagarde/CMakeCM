include_guard(GLOBAL)

include(CPM)
cpm()

if(NOT DEFINED CLI11_REPOSITORY)
  set(CLI11_REPOSITORY "https://github.com/CLIUtils/CLI11.git")
endif()

if(NOT DEFINED CLI11_TAG)
  set(CLI11_TAG "v2.3.1")
endif()

declare_option(REPOSITORY CLI11 OPTION CLI11_WARNINGS_AS_ERRORS VALUE OFF)
declare_option(REPOSITORY CLI11 OPTION CLI11_SINGLE_FILE VALUE OFF)
declare_option(REPOSITORY CLI11 OPTION CLI11_SANITIZERS VALUE OFF)
declare_option(REPOSITORY CLI11 OPTION CLI11_BUILD_DOCS VALUE OFF)
declare_option(REPOSITORY CLI11 OPTION CLI11_BUILD_TESTS VALUE OFF)
declare_option(REPOSITORY CLI11 OPTION CLI11_BUILD_EXAMPLES VALUE OFF)
declare_option(REPOSITORY CLI11 OPTION CLI11_BUILD_EXAMPLES_JSON VALUE OFF)
declare_option(REPOSITORY CLI11 OPTION CLI11_SINGLE_FILE_TESTS VALUE OFF)
declare_option(REPOSITORY CLI11 OPTION CLI11_INSTALL VALUE ON)
declare_option(REPOSITORY CLI11 OPTION CLI11_FORCE_LIBCXX VALUE OFF)
declare_option(REPOSITORY CLI11 OPTION CLI11_CUDA_TESTS VALUE OFF)
declare_option(REPOSITORY CLI11 OPTION CLI11_CLANG_TIDY VALUE OFF)
print_options(REPOSITORY  CLI11)

CPMAddPackage(NAME CLI11
               GIT_REPOSITORY ${CLI11_REPOSITORY}
               GIT_TAG ${CLI11_TAG}
               FETCHCONTENT_UPDATES_DISCONNECTED ${IS_OFFLINE}
               GIT_SUBMODULES ""
               OPTIONS "${CLI11_OPTIONS}")
