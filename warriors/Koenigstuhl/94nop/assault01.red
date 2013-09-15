;redcode-94nop
;name Assault and Battery v0.1
;author Andrew Hunter
;strategy stun bomber
;strategy original version
;assert CORESIZE==8000

;-----------BOMBER-----------
step equ 2223
throw top bmbBootPtr mov.i {0,#0
ptr mov.i step,@2*step
mov.i sbmbP,{ptr
sub.f incrP,ptr
start mov.i sbmbP,@ptr
mov.i }mbmbP,*ptr
jmz.a ptr, {mbmbP
tail jmp clrBP,tail+1
;------------------------------

;-----------BOMBS-------------
sbmb spl #2,#1
mbmb mov.i @0,}-1
;-----------------------------
;positioning and weird boot needed
;for successful airbag.
;-----------D-CLEAR------------
gate equ (clrB-1)
clrB incr spl #-step*2-1,<-step*2
clr mov bomb,>gate
djn.f clr,>gate
bomb dat >2667,bomb-gate+1
;------------------------------
clrPtr dat 0,clrOff+1

bomberOff equ (tail+3240)
clrOff equ (tail+2844)
bombsOff equ (tail+1372)
sbmbP equ ((bombsOff-bomberOff)+tail-(clr-sbmb))
mbmbP equ ((bombsOff-bomberOff)+tail-(clr-mbmb))
incrP equ ((clrOff-bomberOff)+tail-(bomb-clrB))
clrBP equ incrP
;----------BOOTING CODE--------
boot bombsPtr spl 1,clr+1
bombsOffPtr spl 1,bombsOff+1
;boots the Bombs.
mov <bombsPtr,<bombsOffPtr
;boots the clear.
mov {clrPtr,<clrPtr
bomberOffPtr spl 1,bomberOff+1
mov <tail,<bomberOffPtr
djn.b >bomberOffPtr, #8

;------------------------------
;TODO: add decoy/decoymaker?  Q-scan?

end boot

