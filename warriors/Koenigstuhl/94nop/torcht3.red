;redcode-94 verbose
;name Torch t3
;author P.Kline
;strategy very rapid incendiary bombing, core-clear & gate
;strategy plus decoy & boot
;assert 1
;macro

step     equ 73
count    equ 1500
boot1     equ 2150
boot2     equ 3508

start    jmn.f copy2,@copy1

copy1    mov <copyf,cp+boot1
         mov <copyf,<copy1
         mov <copyf,<copy1
         mov <copyf,<copy1
         mov <copyf,<copy1
         mov <copyf,<copy1
         mov <copyf,<copy1
         mov sm,sm+boot1
         mov gate,gate+boot1
         jmp sp+boot1

gate     dat   >-step+1,<-step

copy2    mov <copyf,cp+boot2
         mov <copyf,<copy2
         mov <copyf,<copy2
         mov <copyf,<copy2
         mov <copyf,<copy2
         mov <copyf,<copy2
         mov <copyf,<copy2
         mov sm,sm+boot2
         mov gate,gate+boot2
         jmp sp+boot2
         
     for 29
         mov.i #sp,2667
     rof

sp       spl   #0,>-step               ; spl half of the incendiary
in       add   #step+step,msm          ; in,msm,msp execute in reverse order
msm      mov   sm,>tgt-(step*count)
msp      mov   sp,@msm                 ; bomb alternately with spl & mov
tgt      djn.f in,>3157                ; bombed with spl to start clear
clr      mov   gate,<-13
cp       djn.f clr,>3
copyf    dat #0

     for 31
         mov.i #sp,2667
     rof
     
sm       mov   @0,>step                ; mov half of the incendiary

     for 9
         mov.i #sp,2667
     rof

         end   start

