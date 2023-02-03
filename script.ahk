^ö::
    ; Get the current window
    WinGet, currentWindow, ProcessName, A

    ; If the current window is the Windows Terminal and we got here because of
    ; this command, return to the last window. If the current window is not the
    ; Windows Terminal, switch (or start) it and remember the last window.
    If (currentWindow = "WindowsTerminal.exe")
    {
        If (lastWindow = "")
            Return

        WinActivate, ahk_exe %lastWindow%
        lastWindow := ""
    }
    Else
    {
        lastWindow := currentWindow

        Process, Exist, WindowsTerminal.exe
        If Not ErrorLevel
        {
            Run, wt
        }
        WinActivate, ahk_exe WindowsTerminal.exe
    }

