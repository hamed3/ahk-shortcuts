#SingleInstance force

isMediaLocked := true
mediaLockedKeyPressed := false
xpos := 0
ypos := 0

;reddit
:*:s/r/::site:reddit.com/r/

:*:soundlevels::
openSoundLevels()
return

;medai
+CapsLock::playPuase() ; SHIFT + CAPSLOCK

;desktops
!F1::changeDesktop("Left")  	; alt+F1: go prev desktop
!F2::changeDesktop("Right") 	; alt+F2: go next desktop
!F3::changeDesktop("F4") 		; alt+F3: close desktop
	
;space and switch
RAlt & AppsKey::Send,{LAlt up}{Space up}{Tab up}{Space down}{Space up}{LAlt down}{Tab down}{Tab up}{LAlt up}
LAlt & q::Send,{RAlt up}{Space up}{Tab up}{Space down}{Space up}{RAlt down}{Tab down}{Tab up}{RAlt up}

changeDesktop(direction){
    Send, {LCtrl up}{LWin down}{LCtrl down}{%direction%}{LWin up}{LCtrl up}
    MouseMove, 0,5,0,R
    MouseMove, 0,-5,0,R
}

youtubeSpeed(speed){
    Send, {RShift up}{RShift down}{%speed%}{RShift up}
}

playPuase(){
    Send, {Media_Play_Pause}
    return
}

playPuaseWithLock(){
    global isMediaLocked
    If (!isMediaLocked){ 
        Send, {Media_Play_Pause}
    }
    Return
}
mediaPrev(){
     global isMediaLocked
    If (!isMediaLocked){ 
	Send, {Media_Prev}
	}    
Return
}
mediaNext(){
     global isMediaLocked
    If (!isMediaLocked){ 
	Send, {Media_Next}
	}    
Return
}
sendSpace(){
    Send, {Space}
    Return
}
mute(){
    Send, {Volume_Mute}
}
volumeDown(){
    send, {Volume_Down}
}
volumeup(){
    send, {Volume_Up}
}
openChrome(){
    Run, Chrome.exe
}
openFirefox(){
    Run, firefox.exe
}
sendShift(){
    Send, {Shift}
}
setSoundZero(){
    SoundSet, 0
}
lockMediaButton(){
    global isMediaLocked
    global mediaLockedKeyPressed
    If (mediaLockedKeyPressed){
            return
    }
    If (!isMediaLocked){
        isMediaLocked := true
    }Else{
        If (mediaLockedKeyPressed){
            return
        }
        mediaLockedKeyPressed := true
        SetTimer, waitForRelease, 400
        return
    }
}
waitForRelease:
    SetTimer, waitForRelease, Off
    mediaLockedKeyPressed:=false
    isMediaLocked := false
    return
endHold(){
    global mediaLockedKeyPressed
    SetTimer, waitForRelease, Off
    mediaLockedKeyPressed := false
    return
}

openSoundLevels(){
    Run control mmsys.cpl playback
    ;Send {down 2}{alt down}{p}{alt up}{shift down}{tab}{shift up}{right}{alt down}{l}{alt up}
}

getMousePos(){
	global xpos
	global ypos
	MouseGetPos, xpos, ypos
}

setMousePos(){
	global xpos
	global ypos
	MouseMove, xpos, ypos
}

NumpadEnd::youtubeSpeed("<")
NumpadHome::youtubeSpeed(">")
NumpadUp::changeDesktop("Right")
NumpadClear::sendSpace()
NumpadDown::changeDesktop("Left")
NumpadPgDn::mediaPrev()
NumpadPgUp::mediaNext()
NumpadEnter::playPuaseWithLock()
NumpadAdd::mute()
NumpadSub::volumeDown()
NumpadMult::volumeUp()
NumpadDel::openChrome()
NumpadIns::openFirefox()
NumpadLeft::shift
NumpadDiv::setSoundZero()
NumpadRight::lockMediaButton()
NumpadRight Up::endHold()

;[alt+m] mark mouse position
!m:: getMousePos()
;[alt+n] go to marked mouse position
!n:: setMousePos()