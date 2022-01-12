include_guard(GLOBAL)

cmake_policy(PUSH)
cmake_policy(SET CMP0057 NEW) # if IN_LIST

include(Missives)

set(ALLOWABLE_BUILD_TYPES "Debug" "MinSizeRel" "RelWithDebInfo" "Release")
list(SORT ALLOWABLE_BUILD_TYPES COMPARE STRING)
list(REMOVE_DUPLICATES ALLOWABLE_BUILD_TYPES)

get_property(GENERATOR_IS_MULTI_CONFIG GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(NOT GENERATOR_IS_MULTI_CONFIG)
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "${ALLOWABLE_BUILD_TYPES}")
endif()

function(print_configuration config)
  set(ALL_CONFIGS_OPTIONS
          ARCHIVE_OUTPUT_DIRECTORY
          COMPILE_PDB_OUTPUT_DIRECTORY
          EXE_LINKER_FLAGS
          FRAMEWORK_MULTI_CONFIG_POSTFIX
          INTERPROCEDURAL_OPTIMIZATION
          LIBRARY_OUTPUT_DIRECTORY
          MAP_IMPORTED_CONFIG
          MODULE_LINKER_FLAGS
          PDB_OUTPUT_DIRECTORY
          RUNTIME_OUTPUT_DIRECTORY
          SHARED_LINKER_FLAGS
          STATIC_LINKER_FLAGS
          ${LANGUAGE_FLAGS}
          )

  missive(NOTE "Configuration : ${config}")
  string(TOUPPER ${config} CONFIG)
  foreach(OPTIONS IN LISTS ALL_CONFIGS_OPTIONS)
    list(LENGTH CMAKE_${OPTIONS}_${CONFIG} SIZE)
    if(SIZE GREATER 0)
      list(JOIN CMAKE_${OPTIONS}_${CONFIG} ", " CMAKE_${OPTIONS}_${CONFIG}_STRING)
      missive(INFO "CMAKE_${OPTIONS}_${CONFIG} : ${CMAKE_${OPTIONS}_${CONFIG}_STRING}")
    endif()
  endforeach()
  ## Special case for   CMAKE_<CONFIG>_POSTFIX
  list(LENGTH CMAKE_${CONFIG}_POSTFIX SIZE)
  if(SIZE GREATER 0)
    missive(INFO "CMAKE_${CONFIG}_POSTFIX : ${CMAKE_${CONFIG}_POSTFIX}")
  endif()
  missive(NOTE "----------------")
endfunction()

function(configuration_exists)
  cmake_parse_arguments(ARG "VERBOSE" "NAME;RESULT" "" ${ARGN})
  if(NOT DEFINED ARG_NAME)
    missive(FATAL_ERROR "NAME is mandatory")
  endif()

  string(TOUPPER ${ARG_NAME} NAME)
  set(ALLOWABLE_BUILD_TYPES_UPPER ${ALLOWABLE_BUILD_TYPES})
  list(TRANSFORM ALLOWABLE_BUILD_TYPES_UPPER TOUPPER)
  if(${NAME} IN_LIST ALLOWABLE_BUILD_TYPES_UPPER)
    if(NOT DEFINED ARG_RESULT)
      missive(INFO "${ARG_NAME} configuration exists")
    else()
      if(ARG_VERBOSE)
        missive(INFO "${ARG_NAME} configuration exists")
      endif()
      set(${ARG_RESULT} TRUE PARENT_SCOPE)
    endif()
  else()
    if(NOT DEFINED ARG_RESULT)
      missive(INFO "${ARG_NAME} configuration does not exists")
    else()
      if(ARG_VERBOSE)
        missive(INFO "${ARG_NAME} configuration does not exists")
      endif()
      set(${ARG_RESULT} FALSE PARENT_SCOPE)
    endif()
  endif()
endfunction()

function(set_default_configuration)
  cmake_parse_arguments(ARG "VERBOSE;FORCE" "" "CONFIGS" ${ARGN})

  get_property(GENERATOR_IS_MULTI_CONFIG GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)

  if(NOT GENERATOR_IS_MULTI_CONFIG AND ARG_FORCE)
    unset(CMAKE_BUILD_TYPE CACHE)
    set(CMAKE_BUILD_TYPE "" CACHE STRING "Choose the type of build")
  endif()

  list(SORT ALLOWABLE_BUILD_TYPES COMPARE STRING)
  list(REMOVE_DUPLICATES ALLOWABLE_BUILD_TYPES)
  list(JOIN ALLOWABLE_BUILD_TYPES ", " STRING_ALLOWABLE_BUILD_TYPES)

  #check if user use CMAKE_BUILD_TYPE with a single-configuration generator
  if(NOT GENERATOR_IS_MULTI_CONFIG AND NOT CMAKE_BUILD_TYPE STREQUAL "")
    configuration_exists(NAME ${CMAKE_BUILD_TYPE} RESULT CONFIG_EXISTS)
    if(CONFIG_EXISTS)
      missive(INFO "User set CMAKE_BUILD_TYPE to ${CMAKE_BUILD_TYPE} !")
      return()
    else()
      #Bad configs so erase it and save it only for message
      missive(WARN "User set CMAKE_BUILD_TYPE to ${CMAKE_BUILD_TYPE} ! This is not an allowed config !")
      unset(CMAKE_BUILD_TYPE CACHE)
    endif()
  elseif(GENERATOR_IS_MULTI_CONFIG AND DEFINED CMAKE_CONFIGURATION_TYPES)
    ## Clean the configs
    foreach(CONFIG IN LISTS ARG_CONFIGS)
      configuration_exists(NAME ${CONFIG} RESULT CONFIG_EXISTS)
      if(NOT CONFIG_EXISTS)
        list(REMOVE_ITEM ARG_CONFIGS ${CONFIG})
        missive(WARN "${CONFIG} configuration does not exists")
      endif()
    endforeach()
    return()
  endif()

  # not defined by user and program
  if(NOT DEFINED ARG_CONFIGS)
    if(NOT CMAKE_CONFIGURATION_TYPES)
      if(NOT DEFINED CMAKE_BUILD_TYPE)
        set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "Choose the type of build")
        missive(WARN "CONFIGS is not set ! Use Debug by default")
      else()
        missive(WARN "CONFIGS is not set ! But user set CMAKE_BUILD_TYPE to ${CMAKE_BUILD_TYPE} !")
      endif()
      return()
    endif()
  endif()

  list(LENGTH ARG_CONFIGS ARG_CONFIGS_LENGTH)
  if(ARG_CONFIGS_LENGTH GREATER "1" AND NOT GENERATOR_IS_MULTI_CONFIG)

    ## Clean the configs then check again the length
    foreach(CONFIG IN LISTS ARG_CONFIGS)
      configuration_exists(NAME ${CONFIG} RESULT CONFIG_EXISTS)
      if(NOT CONFIG_EXISTS)
        list(REMOVE_ITEM ARG_CONFIGS ${CONFIG})
        missive(WARN "${CONFIG} configuration does not exists")
      endif()
    endforeach()

    list(LENGTH ARG_CONFIGS ARG_CONFIGS_LENGTH)
    if(ARG_CONFIGS_LENGTH EQUAL "0")
      missive(WARN "CONFIGS does not contain any known configs ! Use Debug as default !")
      set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "Choose the type of build" FORCE)
    else()
      list(GET ARG_CONFIGS 0 CONFIGG)
      set(CMAKE_BUILD_TYPE "${CONFIGG}" CACHE STRING "Choose the type of build" FORCE)
      missive(WARN "CONFIGS as more than one config with a single-configuration generator! Using the first good one : ${CONFIGG}")
    endif()
  elseif(NOT GENERATOR_IS_MULTI_CONFIG AND ARG_CONFIGS_LENGTH EQUAL "1")
    missive(NOTE "Use config ${ARG_CONFIGS}")
    set(CMAKE_BUILD_TYPE "${ARG_CONFIGS}" CACHE STRING "Choose the type of build" FORCE)
  elseif(GENERATOR_IS_MULTI_CONFIG)
    ## Clean the configs then check again the length
    foreach(CONFIG IN LISTS ARG_CONFIGS)
      configuration_exists(NAME ${CONFIG} RESULT CONFIG_EXISTS)
      if(NOT CONFIG_EXISTS)
        list(REMOVE_ITEM ARG_CONFIGS ${CONFIG})
        missive(WARN "${CONFIG} configuration does not exists")
      endif()
    endforeach()
    set(CMAKE_CONFIGURATION_TYPES "${ARG_CONFIGS}")
  endif()
endfunction()

cmake_policy(POP)
