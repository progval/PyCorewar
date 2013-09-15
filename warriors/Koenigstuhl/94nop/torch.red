;redcode-94 quiet
;name Torch
;author P.Kline
;strategy very rapid incendiary bombing, core-clear & gate
;macro
;assert 1

step     equ 73
count    equ 1500

gate     dat   <-step+1,<-step
     for 21
         dat   0,0
     rof
sp       spl   #0,<-step             ; spl half of the incendiary
in       add   #step+step,msm        ; |
msm      mov   sm,>tgt-(step*count)  ; | these 3 execute in reverse order!
msp      mov   sp,@msm               ; |
tgt      djn.f in,>3157              ; gets bombed with spl to start clear
clr      mov   gate,<-13
cp       djn.f clr,>3                ; forward decrement while clearing
     for 32
         dat   0,0
     rof
sm       mov   @0,>step              ; mov half of the incendiary
         end   sp
