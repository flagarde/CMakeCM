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
  add_configuration(CONFIG AllWarnings
            C_FLAGS "/W4 /w44060 /w44063 /w44063 /w44064 /w44065 /w44069 /w44137 /w44181 /w44203 /w44301 /w44303 /w44314 /w44318 /w44327 /w44328 /w44335 /w44370 /w44394 /w44413 /w44438 /w44448 /w44449 /w44450 /w44482 /w44495 /w44496 /w44497 /w44498 /w44509 /w44746 /w44755 /w44770 /w44771 /w44844 /w44854 /w44855 /w44856 /w44857 /w44900 /w44939 /w44954 /w44955 /w44970 /w44984 /w44986 /w44999 /w45022 /w45023 /w45034 /w45035 /w45059 /w45230"
            CXX_FLAGS "/W4 /w44060 /w44063 /w44063 /w44064 /w44065 /w44069 /w44137 /w44181 /w44203 /w44301 /w44303 /w44314 /w44318 /w44327 /w44328 /w44335 /w44370 /w44394 /w44413 /w44438 /w44448 /w44449 /w44450 /w44482 /w44495 /w44496 /w44497 /w44498 /w44509 /w44746 /w44755 /w44770 /w44771 /w44844 /w44854 /w44855 /w44856 /w44857 /w44900 /w44939 /w44954 /w44955 /w44970 /w44984 /w44986 /w44999 /w45022 /w45023 /w45034 /w45035 /w45059 /w45230"
          )
elseif(${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU")
  add_configuration(CONFIG AllWarnings C_FLAGS "-Wall -Wextra -Wpedantic" CXX_FLAGS "-Wall -Wextra -Wpedantic" Fortran_FLAGS "-Wall -Wextra -Wpedantic")
elseif(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
  add_configuration(CONFIG AllWarnings C_FLAGS "-Wall -Weverything -Wpedantic" CXX_FLAGS "-Wall -Weverything -Wpedantic" Fortran_FLAGS "-Wall -Weverything -Wpedantic")
endif()

cmake_policy(POP)
