include_guard(GLOBAL)

include(CPM)
cpm()

include(Fmt)

if(NOT DEFINED SPDLOG_REPOSITORY)
  set(SPDLOG_REPOSITORY "https://github.com/gabime/spdlog.git")
endif()

if(NOT DEFINED SPDLOG_TAG)
  set(SPDLOG_TAG "v1.9.2")
endif()

declare_option(REPOSITORY spdlog OPTION SPDLOG_BUILD_ALL VALUE OFF)
declare_option(REPOSITORY spdlog OPTION SPDLOG_ENABLE_PCH VALUE ON)
declare_option(REPOSITORY spdlog OPTION SPDLOG_BUILD_EXAMPLE VALUE OFF)
declare_option(REPOSITORY spdlog OPTION SPDLOG_BUILD_EXAMPLE_HO VALUE OFF)
declare_option(REPOSITORY spdlog OPTION SPDLOG_BUILD_TESTS VALUE OFF)
declare_option(REPOSITORY spdlog OPTION SPDLOG_BUILD_TESTS_HO VALUE OFF)
declare_option(REPOSITORY spdlog OPTION SPDLOG_BUILD_BENCH VALUE OFF)
declare_option(REPOSITORY spdlog OPTION SPDLOG_SANITIZE_ADDRESS VALUE OFF)
declare_option(REPOSITORY spdlog OPTION SPDLOG_INSTALL VALUE OFF)
declare_option(REPOSITORY spdlog OPTION SPDLOG_FMT_EXTERNAL VALUE ON)
declare_option(REPOSITORY spdlog OPTION SPDLOG_BUILD_TESTS_HO VALUE OFF)
declare_option(REPOSITORY spdlog OPTION SPDLOG_FMT_EXTERNAL_HO VALUE OFF)
declare_option(REPOSITORY spdlog OPTION SPDLOG_NO_EXCEPTIONS VALUE OFF)
print_options(REPOSITORY  spdlog)

CPMAddPackage(NAME spdlog
              GIT_REPOSITORY ${SPDLOG_REPOSITORY}
              GIT_TAG ${SPDLOG_TAG}
              FETCHCONTENT_UPDATES_DISCONNECTED ${IS_OFFLINE}
              OPTIONS "${spdlog_OPTIONS}")

if(spdlog_ADDED)
   if(MSVC)
   elseif(${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU")
   elseif(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang" OR ${CMAKE_CXX_COMPILER_ID} MATCHES "AppleClang")
     target_compile_options(spdlog PRIVATE "-Wno-exit-time-destructors;-Wno-signed-enum-bitfield;-Wno-covered-switch-default;-Wno-weak-template-vtables;-Wno-weak-vtables;-Wno-padded;-Wno-signed-enum-bitfield;-Wno-missing-noreturn;-Wno-documentation-unknown-command;-Wno-missing-variable-declarations")
   endif()
  export(TARGETS spdlog NAMESPACE spdlog:: FILE ${CMAKE_BINARY_DIR}/cmake/spdlog.cmake)
endif()
