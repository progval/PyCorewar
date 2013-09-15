;redcode-94
;name Damage Incorporated
;author Anton Marsden
;strategy Bomber
;assert CORESIZE==8000

step     equ   54
count    equ   2000
gate EQU (sp-7)

sp       spl   #-1-step,#-step   ; spl half of the incendiary
in       sub   #step+step,1
msm      mov   sm,*tgt+(step*count)-17228
msp      mov   sp,@msm           ; bomb alternately with spl & mov
tgt      jmz.b in,#0             ; bombed with spl to start clear
clr      mov   wipe,>gate
cp       djn.f clr,>gate
wipe     dat   <2667,wipe-gate+2 ; not sure if <2667 is used in the Hill
      dat   0,0                  ; version
sm       mov   step+1,>step+1    ; mov half of the incendiary
      
end sp
