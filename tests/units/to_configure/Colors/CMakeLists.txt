cmake_minimum_required(VERSION 3.10)

project(ColorsTest
        VERSION "1"
        DESCRIPTION "Colors Test"
        HOMEPAGE_URL "https://github.com/flagarde/CMakeCM/blob/master/modules/Colors.cmake"
        LANGUAGES NONE
       )

set(CMAKE_MODULE_PATH "${MODULES_PATH}")

include(Testings)
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

if(NOT WIN32)
  ASSERT_NOT_EQUAL(${Bold}Bold${Reset} "${Esc}[1mBold${Esc}[0m")
  ASSERT_NOT_EQUAL(${BackMagenta}BackMagenta${Reset} "${Esc}[45mBackMagenta${Esc}[0m")
else()
  ASSERT_NOT_EQUAL(${Bold}Bold${Reset} "Bold")
  ASSERT_NOT_EQUAL(${BackMagenta}BackMagenta${Reset} "BackMagenta")
endif()
