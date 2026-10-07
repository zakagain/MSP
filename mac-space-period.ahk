#Requires AutoHotkey v2.0

~$Space:: {
    static lastSpace := 0
    
    ; Check if prior hotkey exists before comparing time
    if (A_PriorHotkey = "~$Space" && IsInteger(A_TimeSincePriorHotkey) && A_TimeSincePriorHotkey < 100) {
        return
    }

    if (A_PriorKey = "Space" && A_TickCount - lastSpace < 300) {
        Send("{BackSpace 2}. ")
        lastSpace := 0
    } else {
        lastSpace := A_TickCount
    }
    
    KeyWait "Space"
}
