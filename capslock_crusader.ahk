; AutoHotkey script to rebind keys while CapsLock is pressed

#NoEnv
#Persistent
#SingleInstance Force
SetBatchLines -1
ListLines Off

; Key remapping
*CapsLock::
  Hotkey, *w, ArrowUp, On
  Hotkey, *s, ArrowDown, On
  Hotkey, *d, ArrowRight, On
  Hotkey, *a, ArrowLeft, On
  Hotkey, *v, NextSong, On
  Hotkey, *c, PauseSong, On
  Hotkey, *x, LastSong, On
  Hotkey, *], EndPos, On
  Hotkey, *[, HomePos, On
  Hotkey, */ , Del, On
  Hotkey, *e, Louder, On
  Hotkey, *q, Quieter, On
  Hotkey, *Escape, SendTilde, On
  Hotkey, *1, F1key, On
  Hotkey, *2, F2key, On
  Hotkey, *3, F3key, On
  Hotkey, *4, F4key, On
  Hotkey, *5, F5key, On
  Hotkey, *6, F6key, On
  Hotkey, *7, F7key, On
  Hotkey, *8, F8key, On
  Hotkey, *9, F9key, On
  Hotkey, *0, F10key, On
  Hotkey, *-, F11key, On
  Hotkey, *=, F12key, On
  KeyWait, CapsLock
  Hotkey, *1, F1key, Off
  Hotkey, *2, F2key, Off
  Hotkey, *3, F3key, Off
  Hotkey, *4, F4key, Off
  Hotkey, *5, F5key, Off
  Hotkey, *6, F6key, Off
  Hotkey, *7, F7key, Off
  Hotkey, *8, F8key, Off
  Hotkey, *9, F9key, Off
  Hotkey, *0, F10key, Off
  Hotkey, *-, F11key, Off
  Hotkey, *=, F12key, Off
  Hotkey, *w, ArrowUp, Off
  Hotkey, *s, ArrowDown, Off
  Hotkey, *d, ArrowRight, Off
  Hotkey, *a, ArrowLeft, Off
  Hotkey, *v, NextSong, Off
  Hotkey, *c, PauseSong, Off
  Hotkey, *x, LastSong, Off
  Hotkey, *], EndPos, Off
  Hotkey, *[, HomePos, Off
  Hotkey, */ , Del, Off
  Hotkey, *e, Louder, Off
  Hotkey, *q, Quieter, Off
  Hotkey, *Escape, SendTilde, Off
return

^+b::
    FileName := "awesome_file.txt"
    CurrentFolder := GetActiveFolderPath()
    if (CurrentFolder = "")
        return

    FilePath := CurrentFolder . "\" . FileName
    IfNotExist, %FilePath%
    {
        FileAppend, , %FilePath%
    }
return

GetActiveFolderPath() {
    explorerHwnd := WinExist("ahk_class CabinetWClass") ? WinExist("ahk_class CabinetWClass") : WinExist("ahk_class ExploreWClass")
    if !explorerHwnd
        return ""

    for window in ComObjCreate("Shell.Application").Windows
    {
        if (window.hwnd == explorerHwnd)
            return window.Document.Folder.Self.Path
    }

    return ""
}

^+c::
    SelectedFilePath := GetSelectedFilePath()

    if (SelectedFilePath = "")
        return

    Clipboard := SelectedFilePath
return

GetSelectedFilePath() {
    explorerHwnd := WinExist("ahk_class CabinetWClass") ? WinExist("ahk_class CabinetWClass") : WinExist("ahk_class ExploreWClass")
    if !explorerHwnd
        return ""

    selectedFile := ""

    for window in ComObjCreate("Shell.Application").Windows {
        if (window.hwnd == explorerHwnd) {
            items := window.Document.SelectedItems()
            if (items.Count = 1) {
                selectedFile := items.Item(0).Path
            }

            break
        }
    }
    return selectedFile
}

PgUp::Send, ^{Left} ; Ctrl + Left Arrow
PgDn::Send, ^{Right} ; Ctrl + Right Arrow

!e::Send, € ; Alt + e for Euro symbol
!a::Send, ä ; Alt + a for ä
!o::Send, ö ; Alt + o for ö
!u::Send, ü ; Alt + u for ü
!'::Send, `` ; Alt + ' for backtick

SendTilde:
  Send, ~
return

; Key actions
ArrowUp:
  Send {Up}
return

ArrowDown:
  Send {Down}
return

ArrowRight:
  Send {Right}
return

ArrowLeft:
  Send {Left}
return

NextSong:
  ; Replace with your media player's hotkey for next song
  Send {Media_Next}
return

PauseSong:
  ; Replace with your media player's hotkey for pause
  Send {Media_Play_Pause}
return

LastSong:
  ; Replace with your media player's hotkey for previous song
  Send {Media_Prev}
return

EndPos:
  Send {End}
return

HomePos:
  Send {Home}
return

Del:
  Send {Delete}
return

Louder:
  Send {Volume_Up}
return

Quieter:
  Send {Volume_Down}
return

F1key:
  Send {F1}
return

F2key:
  Send {F2}
return

F3key:
  Send {F3}
return

F4key:
  Send {F4}
return

F5key:
  Send {F5}
return

F6key:
  Send {F6}
return

F7key:
  Send {F7}
return

F8key:
  Send {F8}
return

F9key:
  Send {F9}
return

F10key:
  Send {F10}
return

F11key:
  Send {F11}
return

F12key:
  Send {F12}
return