# Module Descriptions

# Local

## [Colors.cmake](https://github.com/flagarde/CMakeCM/blob/master/modules/Colors.cmake) : ##
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
    <img src="https://github.com/flagarde/CMakeCM/blob/master/docs/pictures/Colors.png" alt="Colors" />
   </p> 
  </td>
 </tr>
</table>
  
      
## [Messages.cmake](https://github.com/flagarde/CMakeCM/blob/master/modules/Messages.cmake) : ##
Redefines the `message` command to use personnalized styles. `NOTE` `INFO` `WARN` and `ERROR` are created by defaults.

### Example :

<table>
 <tr>
  <td>
  
```cmake
  include(Messages)
  
  message_mode(NAME "VERY_IMPORTANT"
             STYLE "BoldRed"
             APPEND_BEGIN "!!!!!"
             APPEND_END "!!!!!"
             APPEND_STYLE "BoldYellow")

  message(SEND_ERROR "SEND_ERROR")
  message(WARNING "WARNING")
  message(AUTHOR_WARNING "AUTHOR_WARNING")
  message(DEPRECATION "DEPRECATION")
  message(STATUS "STATUS")
  message(NOTICE "NOTICE")
  message(VERBOSE "VERBOSE")
  message(DEBUG "DEBUG")
  message(TRACE "TRACE")
  message(ERROR "ERROR")
  message(WARN "WARN")
  message(INFO "INFO")
  message(NOTE "NOTE")
  message(TODO "TODO")
  message(TOADD "TO ADD")
  message(TOREMOVE "TO REMOVE")
  message(SUCCESS "SUCCESS")
  message(FAILURE "FAILURE")
  message(VERY_IMPORTANT "VERY_IMPORTANT")
```
</td>
  <td> 
   <p align="center">
    <img src="https://github.com/flagarde/CMakeCM/blob/master/docs/pictures/Messages.png" alt="Messages" />
  </p>
  </td>
 </tr>
</table>

## [Testings.cmake](https://github.com/flagarde/CMakeCM/blob/master/modules/Testings.cmake) : ##
Some `CMake` functions to perform some tests in `CMake files`.

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
    <img src="https://github.com/flagarde/CMakeCM/blob/master/docs/pictures/Testings.png" alt="Testings" />
  </p>
  </td>
 </tr>
</table>

# Remote


