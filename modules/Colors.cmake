include_guard(GLOBAL)

if(NOT WIN32)
  string(ASCII 27 Esc)
  set(Return "${Esc}[3D")
  set(Reset "${Esc}[0m")
  set(Bold "${Esc}[1m")
  set(Faint "${Esc}[2m")
  set(Italic "${Esc}[3m")
  set(Underline "${Esc}[4m")
  set(SlowBlink "${Esc}[5m")
  set(RapidBlink "${Esc}[6m")
  set(Negative "${Esc}[7m")
  set(Conceal "${Esc}[8m")
  set(Crossed "${Esc}[9m")
  set(DefaultFont "${Esc}[10m")
  set(Font1 "${Esc}[11m")
  set(Font2 "${Esc}[12m")
  set(Font3 "${Esc}[13m")
  set(Font4 "${Esc}[14m")
  set(Font5 "${Esc}[15m")
  set(Font6 "${Esc}[16m")
  set(Font7 "${Esc}[17m")
  set(Font8 "${Esc}[18m")
  set(Font9 "${Esc}[19m")
  set(Fraktur "${Esc}[20m")
  set(DoubleUnderline "${Esc}[21m")
  set(NormalIntensity "${Esc}[22m")
  set(NotItalicNotFraktur "${Esc}[23m")
  set(NoUnderline "${Esc}[24m")
  set(NoBlink "${Esc}[25m")
  set(Positive "${Esc}[27m")
  set(Reveal "${Esc}[28m")
  set(NoCrossed "${Esc}[29m")
  set(Black "${Esc}[30m")
  set(Red "${Esc}[31m")
  set(Green "${Esc}[32m")
  set(Yellow "${Esc}[33m")
  set(Blue "${Esc}[34m")
  set(Magenta "${Esc}[35m")
  set(Cyan "${Esc}[36m")
  set(White "${Esc}[37m")
  ## 38 for 256 colors
  set(DefaultForeground "${Esc}[39m")
  set(BackBlack "${Esc}[40m")
  set(BackRed "${Esc}[41m")
  set(BackGreen "${Esc}[42m")
  set(BackYellow "${Esc}[43m")
  set(BackBlue "${Esc}[44m")
  set(BackMagenta "${Esc}[45m")
  set(BackCyan "${Esc}[46m")
  set(BackWhite "${Esc}[47m")
  ## 48 for 256 colors
  set(DefaultBack "${Esc}[49m")
  set(Framed "${Esc}[51m")
  set(Encercled "${Esc}[52m")
  set(Overlined "${Esc}[53m")
  set(NoFramed "${Esc}[54m")
  set(NoEncercled "${Esc}[54m")
  set(NoOverlined "${Esc}[55m")
  # Useful Bold and Color
  set(BoldRed "${Esc}[1;31m")
  set(BoldGreen "${Esc}[1;32m")
  set(BoldYellow "${Esc}[1;33m")
  set(BoldBlue "${Esc}[1;34m")
  set(BoldMagenta "${Esc}[1;35m")
  set(BoldCyan "${Esc}[1;36m")
  set(BoldWhite "${Esc}[1;37m")
endif()
