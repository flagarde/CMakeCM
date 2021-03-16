include_guard(GLOBAL)

include(Messages)

macro(default_install_prefix)
  if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CMAKE_INSTALL_PREFIX "${ARGV0}" CACHE PATH "Default install prefix" FORCE)
  endif()
  message(INFO "${PROJECT_NAME} will be installed in ${CMAKE_INSTALL_PREFIX}")
endmacro()
