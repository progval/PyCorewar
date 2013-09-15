;redcode-94 verbose
;name Torch t5
;author P.Kline
;strategy very rapid incendiary bombing, core-clear & gate
;strategy plus decoy & boot & djn resistance
;assert 1

step      equ 73
count     equ 1800
boot1     equ 2150
boot2     equ 3508
     for 5
         mov.i #sp-300,2667
     rof
smptr    dat #1,#sm+boot1         ; a-ref to gtptr
gtptr    dat #-1,#gate+boot1      ; a-ref to smptr
start    jmn.f c2,@copy1          ; don't boot onto opponent's code
         mov <copyf,@copy1        ; lot's of b-refs to copy1
         mov <copyf,<copy1
         mov <copyf,<copy1
         mov <copyf,<copy1
         mov <copyf,<copy1
         mov <copyf,<copy1
         mov <copyf,<copy1
d1       mov sm,>smptr
d2       mov gate,>gtptr
copy1    jmp @0,cp+boot1
         dat 0,0
         dat copy1,copy1          ; a- and b-refs to copy1
gate     dat   >-step+1,<-step
c2       mov <copyf,@copy2
         mov <copyf,<copy2
         mov <copyf,<copy2
         mov <copyf,<copy2
         mov <copyf,<copy2
         mov <copyf,<copy2
         mov <copyf,<copy2
         mov sm,sm+boot2
         mov gate,gate+boot2
copy2    jmp @0,cp+boot2
     for 29
         mov.i #sp-300,2667
     rof
sp       spl   #0,>-step               ; spl half of the incendiary
in       add   #step+step,@msp         ; '@msp' for djn-resistance
msm      mov   sm,>tgt-(step*count)
msp      mov   sp,@msm                 ; bomb alternately with spl & mov
tgt      djn.f in,>3157                ; bombed with spl to start clear
clr      mov   gate,<-13
cp       djn.f clr,>3
copyf    dat #0
     for 30
         mov.i #sp-300,2667
     rof
         dat   #copy1,#copy1           ; a- and b-refs to copy1
sm       mov   @0,>step                ; mov half of the incendiary
         end   start
