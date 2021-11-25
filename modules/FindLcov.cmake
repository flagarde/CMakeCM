include(Missives)

# include required Modules
include(FindPackageHandleStandardArgs)

# Search for required lcov binaries.
find_program(LCOV_BIN lcov)
find_program(GENINFO_BIN geninfo)
find_program(GENHTML_BIN genhtml)
find_package_handle_standard_args(Lcov REQUIRED_VARS LCOV_BIN GENINFO_BIN GENHTML_BIN)
