# Module Descriptions

# Local

## [Colors.cmake](https://github.com/flagarde/CMakeCM/blob/main/modules/Colors.cmake) : ##
Defines some colors and text styles.

### Example :

<table>
 <tr>
  <td>

```cmake
include(Colors)

message(STATUS "${Bold}Bold${Reset}")
message(STATUS "${Faint}Faint${Reset}")
message(STATUS "${Italic}Italic${Reset}")
message(STATUS "${Underline}Underline${Reset}")
message(STATUS "${SlowBlink}SlowBlink${Reset}")
message(STATUS "${RapidBlink}RapidBlink${Reset}")
message(STATUS "${Negative}Negative${Reset}")
message(STATUS "${Crossed}Crossed${Reset}")
message(STATUS "${Fraktur}Fraktur${Reset}")
message(STATUS "${DoubleUnderline}DoubleUnderline${Reset}")
message(STATUS "${Reveal}Reveal${Reset}")
message(STATUS "${Red}Red${Reset}")
message(STATUS "${Green}Green${Reset}")
message(STATUS "${Yellow}Yellow${Reset}")
message(STATUS "${Blue}Blue${Reset}")
message(STATUS "${Magenta}Magenta${Reset}")
message(STATUS "${Cyan}Cyan${Reset}")
message(STATUS "${BackRed}BackRed${Reset}")
message(STATUS "${BackGreen}BackGreen${Reset}")
message(STATUS "${BackYellow}BackYellow${Reset}")
message(STATUS "${BackBlue}BackBlue${Reset}")
message(STATUS "${BackMagenta}BackMagenta${Reset}")
message(STATUS "${BackCyan}BackCyan${Reset}")
message(STATUS "${Framed}Framed${Reset}")
message(STATUS "${Encercled}Encercled${Reset}")
message(STATUS "${Overlined}Overlined${Reset}")
message(STATUS "${BoldRed}BoldRed${Reset}")
message(STATUS "${BoldGreen}BoldGreen${Reset}")
message(STATUS "${BoldYellow}BoldYellow${Reset}")
message(STATUS "${BoldBlue}BoldBlue${Reset}")
message(STATUS "${BoldMagenta}BoldMagenta${Reset}")
message(STATUS "${BoldCyan}BoldCyan${Reset}")

message(STATUS "${BackGreen}It${BackWhite}${Black}al${BackRed}${White}ia${Reset}")
message(STATUS "${BackBlue}Fr${BackWhite}${Black}an${BackRed}${White}ce${Reset}")
```
  </td>
  <td>
   <p align="center">
    <img src="https://raw.githubusercontent.com/flagarde/CMakeCM/main/docs/pictures/Colors.png" alt="Colors" />
   </p>
  </td>
 </tr>
</table>

## [CPM.cmake](https://github.com/flagarde/CMakeCM/blob/main/modules/CPM.cmake) : ##
Wrapper for `CPM` the setup-free CMake dependency management. Use the `cpm` function with `VERSION` argument to download `CPM`. If `VERSION` is not set the version will be the one in `https://github.com/flagarde/CMakeCM/blob/master/modules/CPM.cmake`.

The wrapper defines some new commands :
* `declare_option(REPOSITORY "X" OPTION "Y" VALUE "Z")` to declare option of the repository X.
* `get_option(REPOSITORY "X" OPTION "Y" VARIABLE "Z")` store option Y of the repository X to variable Z.
* `print_options(REPOSITORY "X")` to print all options of the repository X.
* `undeclare_all_options(REPOSITORY "X")` to reset all function of the repository X.
* `undeclare_option(REPOSITORY "X" OPTION "Y")` to reset an option of the repository X.

### Example :

<table>
 <tr>
  <td>

```cmake
include(CPM)
cpm(VERSION 0.31.1)

declare_option(REPOSITORY fibonacci OPTION CMAKE_CXX_STANDARD VALUE 11)
declare_option(REPOSITORY fibonacci OPTION CMAKE_CXX_STANDARD_REQUIRED VALUE TRUE)
declare_option(REPOSITORY fibonacci OPTION CMAKE_CXX_EXTENSIONS VALUE FALSE)
print_options(REPOSITORY  fibonacci)

CPMAddPackage(
  NAME fibonacci
  GIT_REPOSITORY https://github.com/cpm-cmake/testpack-fibonacci.git
  VERSION "2.0"
  OPTIONS "${fibonacci_OPTIONS}"
)
```
  </td>
  <td>
   <p align="center">
    <img src="https://raw.githubusercontent.com/flagarde/CMakeCM/main/docs/pictures/CPM.png" alt="CPM" />
   </p>
  </td>
 </tr>
</table>

## [Doctest.cmake](https://github.com/flagarde/CMakeCM/blob/main/modules/Doctest.cmake) : ##
Use CPM to setup [doctest](https://github.com/onqtam/doctest)

### Example :

```cmake
include(Doctest)

# ---- Create binary ----
add_executable(Test Test.cpp)
target_link_libraries(Test PRIVATE doctest::doctest)
doctest_discover_tests(Test)
```

## [DefaultInstallPrefix.cmake](https://github.com/flagarde/CMakeCM/blob/main/modules/DefaultInstallPrefix.cmake) : ##
Set `CMAKE_INSTALL_PREFIX` if it has not been defined before.

### Example :

```cmake
include(DefaultInstallPrefix)

default_install_prefix("${CMAKE_CURRENT_SOURCE_DIR}/install")
```

## [Fmt.cmake](https://github.com/flagarde/CMakeCM/blob/main/modules/Fmt.cmake) : ##
Use `CPM` to set up `fmt` https://github.com/fmtlib/fmt

## [GetLatestCMakeVersion.cmake](https://github.com/flagarde/CMakeCM/blob/main/modules/GetLatestCMakeVersion.cmake) : ##
Obtain the CMake's latest version number.

## [IXWebSocket.cmake](https://github.com/flagarde/CMakeCM/blob/main/modules/IXWebSocket.cmake) : ##
Use `CPM` to set up `IXWebSocket` https://github.com/machinezone/IXWebSocket

## [MagicEnum.cmake](https://github.com/flagarde/CMakeCM/blob/main/modules/MagicEnum.cmake) : ##
Use `CPM` to set up `magic_enum` https://github.com/Neargye/magic_enum

## [Missives.cmake](https://github.com/flagarde/CMakeCM/blob/main/modules/Missives.cmake) : ##
Defines the `Message` command to use colored and personalized styles. `NOTE` `INFO` `WARN` and `ERROR` are created by defaults.

### Example :

<table>
 <tr>
  <td>

```cmake
  include(Missives)

  message_mode(NAME "VERY_IMPORTANT"
             STYLE "BoldRed"
             APPEND_BEGIN "!!!!!"
             APPEND_END "!!!!!"
             APPEND_STYLE "BoldYellow")

  missive(SEND_ERROR "SEND_ERROR")
  missive(WARNING "WARNING")
  missive(AUTHOR_WARNING "AUTHOR_WARNING")
  missive(DEPRECATION "DEPRECATION")
  missive(STATUS "STATUS")
  missive(NOTICE "NOTICE")
  missive(VERBOSE "VERBOSE")
  missive(DEBUG "DEBUG")
  missive(TRACE "TRACE")
  missive(ERROR "ERROR")
  missive(WARN "WARN")
  missive(INFO "INFO")
  missive(NOTE "NOTE")
  missive(TO_ADD "TO ADD")
  missive(TO_REMOVE "TO REMOVE")
  missive(VERY_IMPORTANT "VERY_IMPORTANT")
```
</td>
  <td>
   <p align="center">
    <img src="https://raw.githubusercontent.com/flagarde/CMakeCM/main/docs/pictures/Messages.png" alt="Messages" />
  </p>
  </td>
 </tr>
</table>

## [OpenSSL.cmake](https://github.com/flagarde/CMakeCM/blob/main/modules/OpenSSL.cmake) : ##
Use `openssl-cmake` https://github.com/flagarde/openssl-cmake to compile `OpenSSL`.

## [Ping.cmake](https://github.com/flagarde/CMakeCM/blob/main/modules/Ping.cmake) : ##
Test if you are online. Try to download [Ping](https://github.com/flagarde/Ping) and populate the `IS_ONLINE` and `IS_OFFLINE` variables and `IS_ONLINE_RAW` and `IS_OFFLINE_RAW`.

### Example :

```cmake
include(Ping)

if(${IS_ONLINE} STREQUAL TRUE)
  message(STATUS "I'm online.")
endif()
```

## [PreventInSourceBuilds.cmake](https://github.com/flagarde/CMakeCM/blob/main/modules/PreventInSourceBuilds.cmake) : ##
Prevents building the project from his source directory.

## [SourceLocation.cmake](https://github.com/flagarde/CMakeCM/blob/main/modules/SourceLocation.cmake) : ##
Use `CPM` to set up `SourceLocation` https://github.com/flagarde/source_location.git

## [Spdlog.cmake](https://github.com/flagarde/CMakeCM/blob/main/modules/Spdlog.cmake) : ##
Use `CPM` to set up `spdlog` https://github.com/gabime/spdlog

## [Standards.cmake](https://github.com/flagarde/CMakeCM/blob/main/modules/Standards.cmake) : ##
Set the `CMAKE_C_STANDARD` or `CMAKE_CXX_STANDARD` to the required standard.

### Example :

```cmake
  include(Standard)
  cxx_20()
```

## [Testings.cmake](https://github.com/flagarde/CMakeCM/blob/main/modules/Testings.cmake) : ##
Some `CMake` functions to perform some tests in `CMake files`.

### Example :

<table>
 <tr>
  <td>

```cmake
  include(Testings)
  ASSERT_NOT_EQUAL("2" "2")
  ASSERT_NOT_EQUAL("1.1" "1.1")
  ASSERT_NOT_EQUAL("True" "True")

  ASSERT_EQUAL("2" "1.1")
  ASSERT_EQUAL("1.1" "2")
  ASSERT_EQUAL("True" "False")

  ASSERT_FILE_NOT_EXISTS(${CMAKE_CURRENT_LIST_FILE})
  ASSERT_FILE_EXISTS("IDontExist.cmake")
  ASSERT_FILE_NOT_EXISTS("IDontExist.cmake")
```
</td>
  <td>
   <p align="center">
    <img src="https://raw.githubusercontent.com/flagarde/CMakeCM/main/docs/pictures/Testings.png" alt="Testings" />
  </p>
  </td>
 </tr>
</table>

## [Toml11.cmake](https://github.com/flagarde/CMakeCM/blob/main/modules/Toml11.cmake) : ##
Use `CPM` to set up `toml11` https://github.com/ToruNiina/toml11

## [Zlib-ng.cmake](https://github.com/flagarde/CMakeCM/blob/main/modules/Zlib-ng.cmake) : ##
Compile `zlib-ng` https://github.com/zlib-ng/zlib-ng.

# Remote
