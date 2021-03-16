cmake_minimum_required(VERSION 3.10)

project(PreventInSourceBuildsTest
        VERSION "1"
        DESCRIPTION "PreventInSourceBuilds Test"
        HOMEPAGE_URL "https://github.com/flagarde/CMakeCM/blob/master/modules/PreventInSourceBuilds"
        LANGUAGES NONE
       )

set(CMAKE_MODULE_PATH "${MODULES_PATH}")

include(PreventInSourceBuilds)
prevent_in_source_builds()
