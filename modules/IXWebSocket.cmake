include_guard(GLOBAL)

include(CPM)
cpm()

if(NOT DEFINED IXWEBSOCKET_REPOSITORY)
  set(IXWEBSOCKET_REPOSITORY "https://github.com/machinezone/IXWebSocket")
endif()

if(NOT DEFINED IXWEBSOCKET_TAG)
  set(IXWEBSOCKET_TAG "v11.3.3")
endif()

include(Zlib-ng)
include(OpenSSL)

declare_option(REPOSITORY IXWebSocket OPTION USE_TLS VALUE ON)
declare_option(REPOSITORY IXWebSocket OPTION USE_OPEN_SSL VALUE ON)
declare_option(REPOSITORY IXWebSocket OPTION USE_ZLIB VALUE ON)
declare_option(REPOSITORY IXWebSocket OPTION USE_WS VALUE OFF)
declare_option(REPOSITORY IXWebSocket OPTION USE_TEST VALUE OFF)
declare_option(REPOSITORY IXWebSocket OPTION BUILD_DEMO VALUE OFF)
print_options(REPOSITORY  IXWebSocket)

CPMAddPackage(NAME IXWebSocket
              GIT_REPOSITORY ${IXWEBSOCKET_REPOSITORY}
              GIT_TAG ${IXWEBSOCKET_TAG}
              FETCHCONTENT_UPDATES_DISCONNECTED ${IS_OFFLINE}
              OPTIONS "${IXWebSocket_OPTIONS}")

if(IXWebSocket_ADDED)
    if(MSVC)
      target_compile_options(ixwebsocket PRIVATE "/wd4244;/wd4245;/wd4456;/wd4706;/wd4100")
    elseif(${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU")
      target_compile_options(ixwebsocket PRIVATE "-Wno-unused-parameter")
    elseif(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang" OR ${CMAKE_CXX_COMPILER_ID} MATCHES "AppleClang")
      target_compile_options(ixwebsocket PRIVATE "-Wno-extra-semi-stmt;-Wno-comma;-Wno-reserved-identifier;-Wno-nonportable-system-include-path;-Wno-suggest-override;-Wno-unused-macros;-Wno-weak-vtables;-Wno-exit-time-destructors;-Wno-unreachable-code-return;-Wno-missing-prototypes;-Wno-cast-qual;-Wno-covered-switch-default;-Wno-shadow;-Wno-zero-as-null-pointer-constant;-Wno-unused-parameter;-Wno-global-constructors;-Wno-sign-conversion;-Wno-cast-align;-Wno-missing-variable-declarations;-Wno-conversion;-Wno-reserved-id-macro;-Wno-padded;-Wno-old-style-cast")
    endif()
  if(NOT TARGET ixwebsocket::ixwebsocket)
    add_library(ixwebsocket::ixwebsocket ALIAS ixwebsocket)
    export(TARGETS ixwebsocket NAMESPACE ixwebsocket:: FILE ${CMAKE_BINARY_DIR}/cmake/ixwebsocket.cmake)
  endif()
endif()
