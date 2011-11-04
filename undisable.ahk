; Prohibit applications from disabling windows or controls, by simply clicking
; on them.  This is especially useful when you wish to access a parent window
; while a settings or dialog window is visible, ie; a Save/Open dialog.
 
;~LButton::	Changed due to LButton firing this causing some pages in Chrome to stop reacting to input
~LButton & Capslock::
  Enable_Window_Under_Cursor()
  Return

Enable_Window_Under_Cursor() ; By Raccoon 31-Aug-2010
{
  MouseGetPos,,, WinHndl, CtlHndl, 2
  WinGet, Style, Style, ahk_id %WinHndl%
  if (Style & 0x8000000) { ; WS_DISABLED.
    WinSet, Enable,, ahk_id %WinHndl%
  }
  WinGet, Style, Style, ahk_id %CtlHndl%
  if (Style & 0x8000000) { ; WS_DISABLED.
    WinSet, Enable,, ahk_id %CtlHndl%
  }
}
; End of Snippet