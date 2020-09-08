; double alt opens temp text field
#SingleInstance force
Alt::
if (A_ThisHotkey == A_PriorHotkey && A_TimeSincePriorHotkey <= 200) {
     Gui, Add, Edit, vName
     Gui,1:-border
     Gui, Color, EEAA99
     Gui +LastFound
     WinSet, TransColor, EEAA99
     Gui -Caption
     Gui, Show
     
     WinGetPos X, Y, Width, Height, A
     MaxX := A_ScreenWidth - Width
     MaxY := A_ScreenHeight - Height - 30
     WinMove A, ,%MaxX%, %MaxY%
}
return

GuiEscape:
GuiClose:
Gui, Submit, NoHide
Gui, Destroy
return