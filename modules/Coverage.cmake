include_guard(GLOBAL)

include(Missives)

# Options
option(ENABLE_COVERAGE "Enable coverage build." ON)

# Variables
set(CMAKE_COVERAGE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/coverage)

# Add coverage support for target ${TNAME} and register target for coverage evaluation. If coverage is disabled or not supported, this function will simply do nothing.
# Note: This function is only a wrapper to define this function always, even if coverage is not supported by the compiler or disabled.
# This function must be defined here, because the module will be exited, if there is no coverage support by the compiler or it is disabled by the user.
function(add_coverage TNAME)
  # only add coverage for target, if coverage is support and enabled.
  if(ENABLE_COVERAGE)
    foreach(TNAME ${ARGV})
      add_coverage_target(${TNAME})
    endforeach()
  endif()
endfunction()

find_package(Gcov)
if(NOT Gcov_FOUND AND ENABLE_COVERAGE)
  missive(WARN "ENABLE_COVERAGE set to ON but Gcov not found ! Disabling ENABLE_COVERAGE !")
  # Add a new global target for all gcov targets. This target could be used to generate the gcov files for the whole project instead of calling <TARGET>-gcov for each target.
  if(NOT TARGET gcov)
    add_custom_target(gcov COMMENT "Running gcov")
  endif()
  return()
endif()

find_package(Lcov)
if(NOT Lcov_FOUND AND ENABLE_COVERAGE)
  missive(WARN "ENABLE_COVERAGE set to ON but Lcov not found ! Disabling ENABLE_COVERAGE !")
  # Add a new global target for all gcov targets. This target could be used to generate the gcov files for the whole project instead of calling <TARGET>-gcov for each target.
  if(NOT TARGET lcov)
    add_custom_target(lcov COMMENT "Running lcov")
  endif()
  if(NOT TARGET lcov-genhtml)
    add_custom_target(lcov-genhtml COMMENT "Running lcov")
  endif()
  return()
endif()

# enable genhtml C++ demangeling, if c++filt is found.
set(GENHTML_CPPFILT_FLAG "")
find_program(CPPFILT_BIN c++filt)
if(NOT CPPFILT_BIN STREQUAL "")
  set(GENHTML_CPPFILT_FLAG "--demangle-cpp")
endif()
# configuration
set(LCOV_HTML_PATH "${CMAKE_BINARY_DIR}/lcov/html")

include(DefaultConfigurations)

get_property(GENERATOR_IS_MULTI_CONFIG GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(NOT GENERATOR_IS_MULTI_CONFIG)
  if(DEFINED CMAKE_BUILD_TYPE)
    missive(WARN "Switching from ${CMAKE_BUILD_TYPE} to Coverage !")
    unset(CMAKE_BUILD_TYPE CACHE)
  endif()
  set_default_configuration(CONFIGS Coverage FORCE)
endif()

#file(GLOB_RECURSE GCOV_FILES LIST_DIRECTORIES false "*.gcno")

add_custom_target(ctest ctest)

if(NOT TARGET gcov)
  add_custom_target(gcov "${GCOV_BIN}" ${GCOV_COMMAND_PARAMETER} --use-colors --demangled-names --human-readable --display-progress --relative-only --source-prefix "${CMAKE_BINARY_DIR}" "./*" COMMENT "Running gcov")
endif()

if(NOT TARGET lcov)
  add_custom_target(lcov "${LCOV_BIN}" --directory "${CMAKE_BINARY_DIR}" --base-directory "${CMAKE_BINARY_DIR}" --capture --output-file total.txt COMMENT "Running lcov" DEPENDS gcov)
  add_custom_target(lcov-remove "${LCOV_BIN}" --remove total.txt '/usr/include/*/*' '${CMAKE_BINARY_DIR}/_deps/*/*' --output-file coverage.txt COMMENT "Running lcov-remove" DEPENDS lcov)
endif()

if(NOT TARGET lcov-genhtml)
  add_custom_target(lcov-genhtml "${GENHTML_BIN}" --num-spaces 2 --function-coverage --demangle-cpp --precision 2 --missed --sort --highlight --legend --branch-coverage --show-details --keep-descriptions --demangle-cpp --title ${CMAKE_PROJECT_NAME}-v${CMAKE_PROJECT_VERSION} --prefix "${CMAKE_SOURCE_DIR}" coverage.txt --output-directory "${CMAKE_COVERAGE_OUTPUT_DIRECTORY}/html" COMMENT "Running lcov-genhtml and put files to ${CMAKE_COVERAGE_OUTPUT_DIRECTORY}/html" DEPENDS lcov-remove)
endif()
