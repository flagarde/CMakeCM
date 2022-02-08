include_guard(GLOBAL)

include(GNUInstallDirs)
include(Missives)

if(NOT DEFINED OPENSSLCMAKE_REPOSITORY)
  set(OPENSSLCMAKE_REPOSITORY "https://github.com/flagarde/openssl-cmake.git")
endif()

if(NOT DEFINED OPENSSLCMAKE_TAG)
  set(OPENSSLCMAKE_TAG "v2.3")
endif()

if(${USE_SYSTEM_OPENSSL})
  find_package(OpenSSL QUIET)
  if(OPENSSL_FOUND)
    find_package(OpenSSL)
    set(COMPILE_OPENSSL FALSE)
  else()
    set(COMPILE_OPENSSL TRUE)
    missive(NOTE "OpenSSL not found ! OpenSSL will be compiled using ${OPENSSLCMAKE_REPOSITORY} version ${OPENSSLCMAKE_VERSION} !")
  endif()
else()
  set(COMPILE_OPENSSL TRUE)
  missive(NOTE "OpenSSL will be compiled using ${OPENSSLCMAKE_REPOSITORY} version ${OPENSSLCMAKE_VERSION}.")
endif()

if(COMPILE_OPENSSL)

  include(CPM)
  cpm()

  # find_package(OpenSSL) may not have found it,
  # clear parent scope variables set to NOTFOUND
  foreach(suffix FOUND INCLUDE_DIR INCLUDE_DIRS CRYPTO_LIBRARY SSL_LIBRARY LIBRARY LIBRARIES)
    unset(OPENSSL_${suffix} CACHE)
  endforeach()

  if(NOT DEFINED OPENSSL_VERSION)
    set(OPENSSL_VERSION "1.1.1m")
  endif()

  if(NOT DEFINED OPENSSL_URL)
    set(OPENSSL_URL "https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz")
  endif()

  if(NOT DEFINED OPENSSL_URL_HASH)
    set(OPENSSL_URL_HASH "SHA256=f89199be8b23ca45fc7cb9f1d8d3ee67312318286ad030f5316aca6462db6c96")
  endif()

  declare_option(REPOSITORY "OpenSSL-CMake" OPTION "WITH_APPS" VALUE "OFF")
  declare_option(REPOSITORY "OpenSSL-CMake" OPTION "WITH_DOCS" VALUE "OFF")
  declare_option(REPOSITORY "OpenSSL-CMake" OPTION "WITH_TESTS" VALUE "OFF")
  print_options(REPOSITORY  "OpenSSL-CMake")

  CPMAddPackage(NAME "OpenSSL-CMake"
                 GIT_REPOSITORY "${OPENSSLCMAKE_REPOSITORY}"
                 GIT_TAG "${OPENSSLCMAKE_TAG}"
                 FETCHCONTENT_UPDATES_DISCONNECTED "${IS_OFFLINE}"
                 OPTIONS "${OpenSSL-CMake_OPTIONS}")

  if(OpenSSL-CMake_ADDED)
    set(OPENSSL_FOUND "TRUE" CACHE BOOL "" FORCE)
    set(OPENSSL_VERSION "${OPENSSL_VERSION}" CACHE INTERNAL "" FORCE)
    set(OPENSSL_VERSION_STRING "${OPENSSL_VERSION}" CACHE INTERNAL "" FORCE)
    set(OPENSSL_PREFIX "${CMAKE_INSTALL_PREFIX}" CACHE INTERNAL "" FORCE) # needed by Davix
    set(OPENSSL_INCLUDE_DIR "${CMAKE_INSTALL_PREFIX}/include" CACHE INTERNAL "" FORCE)
    set(OPENSSL_INCLUDE_DIRS "${CMAKE_INSTALL_PREFIX}/include" CACHE INTERNAL "" FORCE)

    if(MSVC)
    elseif(${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU")
      target_compile_options(ssl PRIVATE "-Wno-unused-parameter")
    elseif(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
      target_compile_options(crypto PRIVATE "-Wno-switch-enum;-Wno-disabled-macro-expansion;-Wno-missing-noreturn;-Wno-format-nonliteral;-Wno-undef;-Wno-missing-field-initializers;-Wno-conversion;-Wno-reserved-id-macro;-Wno-cast-align;-Wno-unreachable-code;-Wno-comma;-Wno-cast-qual;-Wno-used-but-marked-unused;-Wno-shorten-64-to-32;-Wno-unused-macros;-Wno-unused-parameter;-Wno-old-style-cast;-Wno-sign-conversion;-Wno-covered-switch-default;-Wno-padded")
      target_compile_options(ssl PRIVATE "-Wno-switch-enum;-Wno-disabled-macro-expansion;-Wno-missing-noreturn;-Wno-format-nonliteral;-Wno-undef;-Wno-missing-field-initializers;-Wno-conversion;-Wno-reserved-id-macro;-Wno-cast-align;-Wno-unreachable-code;-Wno-comma;-Wno-cast-qual;-Wno-used-but-marked-unused;-Wno-shorten-64-to-32;-Wno-unused-macros;-Wno-unused-parameter;-Wno-old-style-cast;-Wno-sign-conversion;-Wno-covered-switch-default;-Wno-padded")
    endif()

    add_library(SSL IMPORTED INTERFACE)
    target_link_libraries(SSL INTERFACE OpenSSL::SSL)

    add_library(CRYPTO IMPORTED INTERFACE)
    target_link_libraries(CRYPTO INTERFACE OpenSSL::Crypto)

    set(OPENSSL_CRYPTO_LIBRARY CRYPTO CACHE INTERNAL "" FORCE)
    set(OPENSSL_SSL_LIBRARY SSL CACHE INTERNAL "" FORCE)
    set(OPENSSL_LIBRARIES "${OPENSSL_SSL_LIBRARY}" "${OPENSSL_CRYPTO_LIBRARY}" "${CMAKE_DL_LIBS}" CACHE INTERNAL "" FORCE)

    find_package_handle_standard_args(OpenSSL
      FOUND_VAR
        OPENSSL_FOUND
      REQUIRED_VARS
        OPENSSL_INCLUDE_DIR
        OPENSSL_CRYPTO_LIBRARY
        OPENSSL_SSL_LIBRARY
        OPENSSL_LIBRARIES
      VERSION_VAR
        OPENSSL_VERSION_STRING)

    find_package(OpenSSL REQUIRED QUIET)
  endif()
endif()
