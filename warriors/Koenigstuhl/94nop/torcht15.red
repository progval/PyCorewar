;redcode-94 verbose
;name Torch t15
;author P.Kline
;strategy very rapid incendiary bombing, core-clear & gate
;assert 1

step     equ   54
count    equ   2000
boot     equ   7500

         gate     dat   -100,200
     for 28
         dat   0,0
     rof
wipe     dat   sp-gate-2,#cp-gate+10
     for 4
         dat   0,0
     rof

sp       spl   #-step,>1-step    ; spl half of the incendiary
in       sub   #step+step,@msp
msm      mov   sm,*tgt+(step*count)-17228
msp      mov   sp,@msm           ; bomb alternately with spl & mov
tgt      djn.f in,<4501          ; bombed with spl to start clear
clr      mov   wipe,>gate
cp       djn.f clr,{gate
     for 15
         dat   0,0
     rof
sm       mov   step,>step        ; mov half of the incendiary
     for 10
         dat   0,0
     rof
     for 13
         dat   1,@1
         dat   0,@2
     rof

         end   sp
