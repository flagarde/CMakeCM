cmake_minimum_required(VERSION 3.10...3.19)

project(CMakeCMTests VERSION 1 DESCRIPTION "Tests for CMakeCM" HOMEPAGE_URL "https://github.com/flagarde/CMakeCM" LANGUAGES NONE)

enable_testing()

file(GLOB to_configure  LIST_DIRECTORIES TRUE RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}/units/to_configure" "${CMAKE_CURRENT_SOURCE_DIR}/units/to_configure/*")

file(GLOB to_buid LIST_DIRECTORIES TRUE RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}/units/to_build" "${CMAKE_CURRENT_SOURCE_DIR}/units/to_build/*")

#Test Testings first
list(REMOVE_ITEM to_configure "Testings")
message(STATUS "Adding test : Testings")
add_test(NAME Testings COMMAND ${CMAKE_COMMAND} -DCMAKE_INSTALL_PREFIX=${CMAKE_CURRENT_SOURCE_DIR}/../bin/ -DMODULES_PATH=${CMAKE_CURRENT_SOURCE_DIR}/../modules/ -S "${CMAKE_CURRENT_SOURCE_DIR}/units/to_configure/Testings" -B "${CMAKE_CURRENT_BINARY_DIR}/Testings")

foreach(test ${to_configure})
  message(STATUS "Adding test : ${test}")
  if(${test} STREQUAL "DefaultInstallPrefix")
    add_test(NAME ${test} COMMAND ${CMAKE_COMMAND} -DMODULES_PATH=${CMAKE_CURRENT_SOURCE_DIR}/../modules/ -S "${CMAKE_CURRENT_SOURCE_DIR}/units/to_configure/${test}" -B "${CMAKE_CURRENT_BINARY_DIR}/units/to_configure/${test}")
  else()
    add_test(NAME ${test} COMMAND ${CMAKE_COMMAND} -DCMAKE_INSTALL_PREFIX=../bin -DMODULES_PATH=${CMAKE_CURRENT_SOURCE_DIR}/../modules/ -S "${CMAKE_CURRENT_SOURCE_DIR}/units/to_configure/${test}" -B "${CMAKE_CURRENT_BINARY_DIR}/units/to_configure/${test}")
  endif()
endforeach()

foreach(test ${to_buid})
  message(STATUS "Adding test : ${test}")
  add_test(NAME ${test} COMMAND ${CMAKE_COMMAND} -DCMAKE_INSTALL_PREFIX=../bin -DMODULES_PATH=${CMAKE_CURRENT_SOURCE_DIR}/../modules/ -S "${CMAKE_CURRENT_SOURCE_DIR}/units/to_build/${test}" -B "${CMAKE_CURRENT_BINARY_DIR}/units/to_build/${test}")
  add_test(NAME ${test}Build COMMAND ${CMAKE_COMMAND}  --build "${CMAKE_CURRENT_BINARY_DIR}/units/to_build/${test}" --config Debug)
  add_test(NAME ${test}Install COMMAND ${CMAKE_COMMAND} --install "${CMAKE_CURRENT_BINARY_DIR}/units/to_build/${test}" --config Debug)
endforeach()

add_custom_target(TestsVerbose COMMAND ${CMAKE_CTEST_COMMAND} --output-on-failure -C Debug --progress --verbose)
add_custom_target(Tests COMMAND ${CMAKE_CTEST_COMMAND} --output-on-failure -C Debug --progress)
