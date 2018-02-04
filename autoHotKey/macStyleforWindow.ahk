#InstallKeybdHook


; monitor off
#/::
	SendMessage 0x112, 0xF140, 0, , Program Manager ; start screensaver
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
#l::Send, ^l
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

