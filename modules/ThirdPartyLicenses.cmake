include_guard(GLOBAL)

include(CPM)
cpm()

if(NOT DEFINED CPMLICENSES_REPOSITORY)
  set(CPMLICENSES_REPOSITORY "https://github.com/cpm-cmake/CPMLicenses.cmake")
endif()

if(NOT DEFINED CPMLICENSES_TAG)
  set(CPMLICENSES_TAG "v0.0.5")
endif()

CPMAddPackage(NAME CPMLicenses
    GIT_REPOSITORY ${CPMLICENSES_REPOSITORY}
    GIT_TAG ${CPMLICENSES_TAG}
    FETCHCONTENT_UPDATES_DISCONNECTED ${IS_OFFLINE}
    GIT_SUBMODULES "")

function(list_third_party_licenses FILENAME)
  cpm_licenses_create_disclaimer_target(write-license "${CMAKE_CURRENT_BINARY_DIR}/${FILENAME}" "${CPM_PACKAGES}")
  add_custom_target(CPMLicenses ALL "" DEPENDS write-license BYPRODUCTS "${CMAKE_CURRENT_BINARY_DIR}/${FILENAME}" COMMENT "Generating the third-party licenses list in ${CMAKE_CURRENT_BINARY_DIR}/${FILENAME}")
  install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${FILENAME}" TYPE DOC)
endfunction()
