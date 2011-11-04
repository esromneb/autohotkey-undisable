; Prohibit applications from disabling windows or controls, by simply clicking
; on them.  This is especially useful when you wish to access a parent window
; while a settings or dialog window is visible, ie; a Save/Open dialog.
 
;~LButton::	Changed due to LButton firing this causing some pages in Chrome to stop reacting to input
~LButton & Capslock::
  Enable_Window_Under_Cursor()
  Return

Enable_Window_Under_Cursor() ; By Raccoon 31-Aug-2010
{
  ToolTip, Trying...
  MouseGetPos,,, WinHndl, CtlHndl, 2
  WinGet, Style, Style, ahk_id %WinHndl%
  if (Style & 0x8000000) { ; WS_DISABLED.
    WinSet, Enable,, ahk_id %WinHndl%
    ToolTip, Window Undisabled!
    Sleep, 250
  }
  WinGet, Style, Style, ahk_id %CtlHndl%
  if (Style & 0x8000000) { ; WS_DISABLED.
    WinSet, Enable,, ahk_id %CtlHndl%
    ToolTip, Undisabled!
    Sleep, 250
  }
  Sleep, 250
  ToolTip,
}
; End of Snippet