#InstallKeybdHook

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetCapsLockState, AlwaysOff


; monitor off
<^<#BS::
;	SendMessage 0x112, 0xF140, 0, , Program Manager ; start screensaver
	Sleep 500
	SendMessage 0x112, 0xF170, 2, , Program Manager ; Monitor off
Return

; lock pc
<^<!<#/::
	Run rundll32.exe user32.dll`,LockWorkStation     ; Lock PC
	Sleep 1000
	SendMessage 0x112, 0xF170, 2, , Program Manager  ; Monitor off
Return

XButton2::Send, #{Tab} ; 5th mouse button


/*q
	mac style change
*/

; korea/english button like mac style	
#Space::Send {SC1F2}

; home, end with shift mapping
#Left::Send, {Home}
#+Left::Send, +{Home}
#Right::Send, {End}
#+Right::Send, +{End}
#Up::Send ,{PgUp}
#down::Send, {PgDn}

<^Left::Send, #{Left}
<^Right::Send, #{Right}
<^Up::Send, #{Up}
<^Down::Send, #{Down}

#s::Send, ^s
#w::Send, ^w
<#l::Send, ^l
<#q::Send, !{F4}
#z::Send, ^z

/*
	for auto hot key script develop
*/

<^<!<#Space::
	MsgBox, Reload
	Reload
return

; !#Space::MsgBox, OK
; <^Left::{#Left} ; 요게 데스크탑 이동임
; <^Right::{#Right} ; 요것도 데스크탐 이동



fallback_prevention := 0
caps := 0

;global toggle for caps-modifier (= Capslock key)
*Capslock::caps := 1
*Capslock Up::caps := 0


;=========================
; fallback prevention mode disables navigation keys that are far away from the home row
;=========================
#if fallback_prevention = 1
    Left::
    Right::
    Up::
    Down::
    PgUp::
    PgDn::
    Home::
    End::
    Del::
      MsgBox, Use Caps+hjkl for navigation!
    return


;=========================
; caps modifier enables different keybindings
;=========================
#if caps = 1
    ; fallback prevention mode
    $*F1::fallback_prevention := !fallback_prevention
    
    ; toggle Capslock
    $*F2::
      if GetKeyState("Capslock", "T") = 0
        SetCapsLockState, On
      else
        SetCapsLockState, AlwaysOff
    return

    ; media control
    $*F5::Send, {Blind}{Media_Stop}
    $*F6::Send, {Blind}{Media_Play_Pause}
    $*F7::Send, {Blind}{Media_Prev}
    $*F8::Send, {Blind}{Media_Next}

    ; volume control
    $*F10::Send, {Blind}{Volume_Mute}
    $*F11::Send, {Blind}{Volume_Down}
    $*F12::Send, {Blind}{Volume_Up}

    $*s::Send, {Blind}{Insert}
    $*d::Send, {Blind}{Del}
    $*e::Send, {Blind}{Esc}
    $*i::Send, {Blind}{Home}
    $*o::Send, {Blind}{End}
    $*m::Send, {Blind}{AppsKey}
    $*,::Send, {Blind}{PgDn}
    $*.::Send, {Blind}{PgUp}
    $*p::Send, {Blind}{PrintScreen}

    $*Space::Ctrl
    $*RAlt::Shift

    ; undo / redo
    $*u::Send, ^{z}
    $*r::Send, ^{y}

    ; show expose (requires switcher)
    $*Tab::Send, #{Tab}

    ; resize windows (requires winsplit revolution)
    $*1::Send, ^!{NumPad1}
    $*2::Send, ^!{NumPad2}
    $*3::Send, ^!{NumPad3}
    $*4::Send, ^!{NumPad4}
    $*5::Send, ^!{NumPad5}
    $*6::Send, ^!{NumPad6}
    $*7::Send, ^!{NumPad7}
    $*8::Send, ^!{NumPad8}
    $*9::Send, ^!{NumPad9}

    ; vi hjkl navigation
    $*j::Send, {Blind}{Left}
    $*k::Send, {Blind}{Down}
    $*l::Send, {Blind}{Up}
    $*;::Send, {Blind}{Right}

; =====================================================
 
