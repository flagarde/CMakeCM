include_guard(GLOBAL)

include(Missives)

if(NOT DEFINED PYTHON_VARIABLES_HAVE_BEEN_UNSET)
  set(PYTHON_VARIABLES_HAVE_BEEN_UNSET FALSE CACHE INTERNAL "")
endif()

if(NOT DEFINED STANDALONE_PROJECT)
  set(STANDALONE_PROJECT FALSE)
endif()

if(NOT DEFINED USE_SYSTEM_PYTHON)
  set(USE_SYSTEM_PYTHON TRUE)
endif()

if(STANDALONE_PROJECT)
  set(USE_SYSTEM_PYTHON FALSE)
else()
  set(USE_SYSTEM_PYTHON TRUE)
endif()

if(NOT DEFINED PYTHON_ALLOW_FALLBACK)
  set(PYTHON_ALLOW_FALLBACK FALSE)
endif()

if(NOT DEFINED PYTHON_VERSION)
  set(PYTHON_VERSION "")
endif()

if(NOT DEFINED PYTHON_REQUIRED_COMPONENTS)
  set(PYTHON_REQUIRED_COMPONENTS "")
endif()
set(PYTHON_REQUIRED_COMPONENTS "Interpreter;${PYTHON_REQUIRED_COMPONENTS}")
list(REMOVE_DUPLICATES PYTHON_REQUIRED_COMPONENTS)

if(NOT DEFINED PYTHON_OPTIONAL_COMPONENTS)
  set(PYTHON_OPTIONAL_COMPONENTS "")
endif()
list(REMOVE_DUPLICATES PYTHON_OPTIONAL_COMPONENTS)

set(PYTHON_VARIABLES "Python3_FOUND;Python3_Interpreter_FOUND;Python3_EXECUTABLE;Python3_INTERPRETER_ID;Python3_STDLIB;Python3_STDARCH;Python3_SITELIB;Python3_SITEARCH;Python3_SOABI;Python3_Compiler_FOUND;Python3_COMPILER;Python3_COMPILER_ID;Python3_DOTNET_LAUNCHER;Python3_Development_FOUND;Python3_Development.Module_FOUND;Python3_Development.Embed_FOUND;Python3_INCLUDE_DIRS;Python3_LINK_OPTIONS;Python3_LIBRARIES;Python3_LIBRARY_DIRS;Python3_RUNTIME_LIBRARY_DIRS;Python3_VERSION;Python3_VERSION_MAJOR;Python3_VERSION_MINOR;Python3_VERSION_PATCH;Python3_PyPy_VERSION;Python3_NumPy_FOUND;Python3_NumPy_INCLUDE_DIRS;Python3_NumPy_VERSION")

macro(unset_python_variables)
  cmake_parse_arguments(UNSET "FORCE" "" "")
  if(UNSET_FORCE OR PYTHON_VARIABLES_HAVE_BEEN_UNSET STREQUAL FALSE)
    foreach(PYTHON_VARIABLE IN LISTS PYTHON_VARIABLES)
      unset(${PYTHON_VARIABLE})
      unset(${PYTHON_VARIABLE} CACHE)
    endforeach()
    set(PYTHON_VARIABLES_HAVE_BEEN_UNSET TRUE CACHE INTERNAL "")
  endif()
endmacro()

function(print_python_variables)
  foreach(PYTHON_VARIABLE IN LISTS PYTHON_VARIABLES)
    message("${PYTHON_VARIABLE} ${${PYTHON_VARIABLE}}")
  endforeach()
endfunction()

unset_python_variables()
set(INSTALL_PYTHON FALSE)
set(INSTALL_PYTHON_DEVELOPMENT FALSE)
set(INSTALL_NUMPY FALSE)

if(USE_SYSTEM_PYTHON)
  if(PYTHON_ALLOW_FALLBACK)
    find_package(Python3 ${PYTHON_VERSION} COMPONENTS ${PYTHON_REQUIRED_COMPONENTS} OPTIONAL_COMPONENTS ${PYTHON_OPTIONAL_COMPONENTS})
    set(PYTHON_PACKAGES_PATH "${CMAKE_BINARY_DIR}/python_packages" CACHE PATH INTERNAL "Path where install the packages.")
    if(NOT Python3_FOUND)
      #Some PYTHON_REQUIRED_COMPONENTS are not found !
      list(FIND PYTHON_REQUIRED_COMPONENTS "Interpreter" INTERPRETER)
      if(NOT Python3_Interpreter_FOUND AND NOT INTERPRETER EQUAL -1)
        set(INSTALL_PYTHON TRUE)
      endif()

      list(FIND PYTHON_REQUIRED_COMPONENTS "Development" DEVELOPMENT)
      if(NOT Python3_Development_FOUND AND NOT DEVELOPMENT EQUAL -1)
        set(INSTALL_PYTHON_DEVELOPMENT TRUE)
      endif()

      list(FIND PYTHON_REQUIRED_COMPONENTS "NumPy" NUMPY)
      if(NOT NUMPY EQUAL -1)
        set(INSTALL_NUMPY TRUE)
      endif()
    endif()
  else()
    find_package(Python3 ${PYTHON_VERSION} COMPONENTS ${PYTHON_REQUIRED_COMPONENTS} OPTIONAL_COMPONENTS ${PYTHON_OPTIONAL_COMPONENTS} REQUIRED)
    set(PYTHON_PACKAGES_PATH "${CMAKE_BINARY_DIR}/python_packages" CACHE PATH INTERNAL "Path where install the packages.")
  endif()
else()
  list(FIND PYTHON_REQUIRED_COMPONENTS "NumPy" NUMPY)
  list(FIND PYTHON_REQUIRED_COMPONENTS "Interpreter" INTERPRETER)
  list(FIND PYTHON_REQUIRED_COMPONENTS "Development" DEVELOPMENT)
  if(NOT NUMPY EQUAL -1 )
    set(INSTALL_NUMPY TRUE)
  endif()
  if(NOT DEVELOPMENT EQUAL -1)
    set(INSTALL_PYTHON_DEVELOPMENT TRUE)
  endif()
  if(NOT INTERPRETER EQUAL -1)
    set(INSTALL_PYTHON TRUE)
  endif()
endif()

macro(download_python)
  set(PYTHON_VERSION "3.9.6")
  set(PYTHON_URL "https://github.com/indygreg/python-build-standalone/releases/download/20210724/cpython-${PYTHON_VERSION}")
  if(WIN32)
    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
      set(PYTHON_URL "${PYTHON_URL}-x86_64-pc-windows-msvc-static-noopt-20210724T1424.tar.zst")
      set(PYTHON_SHA256 "0bd9ac2d3221e8588b9e728b7b774807724b845c299682ae9a990c406ff5f83b")
    elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
      set(PYTHON_URL "${PYTHON_URL}-i686-pc-windows-msvc-static-noopt-20210724T1424.tar.zst")
      set(PYTHON_SHA256 "82235f8de14ec3123c20406fb9732766b6c0141e266824864e3cce43117b4330")
    endif()
  elseif(APPLE)
    set(PYTHON_URL "${PYTHON_URL}-x86_64-apple-darwin-pgo+lto-20210724T1424.tar.zst")
    set(PYTHON_SHA256 "63b99e71d43718ed62ef250b45921f23f04d3bd2d4e03920e49e1cf8d23c538e")
  else()
    set(PYTHON_URL "${PYTHON_URL}-x86_64-unknown-linux-gnu-pgo+lto-20210724T1424.tar.zst")
    set(PYTHON_SHA256 "8064db853bce9ab7afe5eafdf12fb2e1df7c39471f2cecdb1a9c84ae6a7a1793")
  endif()
  missive(NOTE "Dowloading python version ${PYTHON_VERSION} at ${PYTHON_URL}")
  file(DOWNLOAD "${PYTHON_URL}" "${CMAKE_CURRENT_BINARY_DIR}/python-${PYTHON_VERSION}.tar.zst" EXPECTED_HASH SHA256=${PYTHON_SHA256})
  execute_process(COMMAND "${CMAKE_COMMAND}" "-E" "tar" "xvz" "${CMAKE_BINARY_DIR}/python-${PYTHON_VERSION}.tar.zst" WORKING_DIRECTORY ${CMAKE_BINARY_DIR} OUTPUT_VARIABLE OUTPUT ERROR_VARIABLE ERROR RESULT_VARIABLE RESULT)
  unset_python_variables(FORCE)
  set(Python3_ROOT_DIR "${CMAKE_BINARY_DIR}/python/install")
  set(Python3_DOWNLOADED TRUE)
  list(APPEND PYTHON_REQUIRED_COMPONENTS_TEMP "${PYTHON_REQUIRED_COMPONENTS}")
  list(REMOVE_ITEM PYTHON_REQUIRED_COMPONENTS_TEMP "NumPy")
  find_package(Python3 ${PYTHON_VERSION} COMPONENTS ${PYTHON_REQUIRED_COMPONENTS_TEMP} OPTIONAL_COMPONENTS ${PYTHON_OPTIONAL_COMPONENTS} REQUIRED)
  set(ENV{VIRTUAL_ENV} "${CMAKE_BINARY_DIR}/python/install")
endmacro()

if(INSTALL_PYTHON OR INSTALL_PYTHON_DEVELOPMENT)
  download_python()
endif()

if(INSTALL_NUMPY)
  find_package(Pip REQUIRED)
  if(Python3_DOWNLOADED)
    install_with_pip(NAME numpy OPTIONS "--target=$ENV{VIRTUAL_ENV}/lib/python3.9/site-packages")
  else()
    install_with_pip(NAME numpy OPTIONS "--target=${PYTHON_PACKAGES_PATH}/NumPy")
    set(Python3_NumPy_INCLUDE_DIR "${PYTHON_PACKAGES_PATH}/NumPy" CACHE INTERNAL "NumPy include directory")
  endif()
endif()

find_package(Python3 ${PYTHON_VERSION} COMPONENTS ${PYTHON_REQUIRED_COMPONENTS} OPTIONAL_COMPONENTS ${PYTHON_OPTIONAL_COMPONENTS} REQUIRED)
