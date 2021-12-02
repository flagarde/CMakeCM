include_guard(GLOBAL)

cmake_policy(PUSH)
cmake_policy(SET CMP0054 NEW)

include(Missives)
include(CreateConfigurationTypes)

# COVERAGE Config
set(COVERAGE_FLAG_CANDIDATES
        # gcc and clang
        "-O0 -g --coverage"
        # gcc and clang fallback
        "-O0 -g -fprofile-arcs -ftest-coverage"
        )

# Find the required flags foreach language.
get_property(ENABLED_LANGUAGES GLOBAL PROPERTY ENABLED_LANGUAGES)
set(CMAKE_REQUIRED_QUIET TRUE)

foreach(LANG ${ENABLED_LANGUAGES})
  if(NOT ${LANG} MATCHES "^(C|CXX|Fortran)$")
    missive(INFO "Skipping coverage for unsupported language: ${LANG}")
    continue()
  endif()

  foreach(FLAG ${COVERAGE_FLAG_CANDIDATES})
    set(CMAKE_REQUIRED_FLAGS "${FLAG}")
    unset(COVERAGE_FLAG_DETECTED CACHE)

    if(${LANG} STREQUAL "C")
      include(CheckCCompilerFlag)
      check_c_compiler_flag(${FLAG} COVERAGE_FLAG_DETECTED)
      if(COVERAGE_FLAG_DETECTED)
        set(C_COVERAGE_FLAG "${FLAG}")
      endif()
    elseif(${LANG} STREQUAL "CXX")
      include(CheckCXXCompilerFlag)
      check_cxx_compiler_flag(${FLAG} COVERAGE_FLAG_DETECTED)
      if(COVERAGE_FLAG_DETECTED)
        set(CXX_COVERAGE_FLAG "${FLAG}")
      endif()
    elseif(${LANG} STREQUAL "Fortran")
      include(CheckFortranCompilerFlag)
      check_fortran_compiler_flag(${FLAG} COVERAGE_FLAG_DETECTED)
      if(COVERAGE_FLAG_DETECTED)
        set(FORTRAN_COVERAGE_FLAG "${FLAG}")
      endif()
    endif()

    if(COVERAGE_FLAG_DETECTED)
      break()
    else()
      missive(WARN "Code coverage for ${LANG} is not available for your compiler. Targets using this compiler will be compiled without it.")
    endif()
  endforeach()
endforeach()

set(CMAKE_REQUIRED_QUIET FALSE)

add_configuration(CONFIG Coverage C_FLAGS "${C_COVERAGE_FLAG}" CXX_FLAGS "${CXX_COVERAGE_FLAG}" Fortran_FLAGS "${FORTRAN_COVERAGE_FLAG}")
unset(C_COVERAGE_FLAG)
unset(CXX_COVERAGE_FLAG)
unset(FORTRAN_COVERAGE_FLAG)

# All warnings

if(${CMAKE_CXX_COMPILER_ID} STREQUAL "MSVC")
  add_configuration(CONFIG AllWarnings C_FLAGS "/W4" CXX_FLAGS "/W4")
elseif(${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU")
  add_configuration(CONFIG AllWarnings C_FLAGS "-Wall -Wextra -Wpedantic" CXX_FLAGS "-Wall -Wextra -Wpedantic" Fortran_FLAGS "-Wall -Wextra -Wpedantic")
elseif(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
  add_configuration(CONFIG AllWarnings C_FLAGS "-Wall -Weverything -Wpedantic" CXX_FLAGS "-Wall -Weverything -Wpedantic" Fortran_FLAGS "-Wall -Weverything -Wpedantic")
endif()

cmake_policy(POP)
