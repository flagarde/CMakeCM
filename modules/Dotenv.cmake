include_guard(GLOBAL)

include(CPM)
cpm()

if(NOT DEFINED DOTENV_REPOSITORY)
    set(DOTENV_REPOSITORY "https://github.com/laserpants/dotenv-cpp")
endif()

if(NOT DEFINED DOTENV_TAG)
    set(DOTENV_TAG "master")
endif()

declare_option(REPOSITORY dotenv OPTION BUILD_DOCS VALUE OFF)
print_options(REPOSITORY  dotenv)

CPMAddPackage(NAME dotenv
        GIT_REPOSITORY ${DOTENV_REPOSITORY}
        GIT_TAG ${DOTENV_TAG}
        FETCHCONTENT_UPDATES_DISCONNECTED ${IS_OFFLINE}
        OPTIONS "${dotenv_OPTIONS}")

if(dotenv_ADDED)
    add_library(laserpants::dotenv ALIAS dotenv)
endif()
