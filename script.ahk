^ö::
    ; Get the current window
    WinGet, currentWindow, ProcessName, A

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

