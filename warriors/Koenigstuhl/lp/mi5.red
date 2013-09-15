;redcode-lp
;name MI5
;author Philip Kendall
;strategy dat bomber -> 1c clear
;assert CORESIZE==8000

;BDECWT round 2
;opponent Magnus Paulsson

;I don't really know what Magnus is going to come up with, so I've written a
;warrior which is good against most things, especially bomb dodgers and imps.
;It's turned out a lot like Anders Ivner's C.I.A, but it was developed
;independently (honest!). The bombing pattern and bombs are like C.I.A.'s, but
;it uses a different clear, which is a sort-of variant on a d-clear. A
;standard d-clear doesn't work too well under -lp (the spl #0 loses its
;process very quickly), so this uses
;
; clear mov.i bomb,>ptr
;       mov.i bomb,>ptr
;       djn.f clear,>ptr
;
;which, if the distance being cleared is set correctly, does fill all of core
;with dats in two passes (after filling 2/3 on the first pass). This will
;probably lose to a pure stone, but having said that, it beats Tornado, so
;you never know - let the battle commence!

step    equ     3205
stone   equ     (loop+step+4)
trigger equ     (loop-step+3)

ptr     equ     (inc-10)
cstart  equ     (dbomb+5-ptr)

bdist   equ     4134

inc     dat.f   #-step,#step
;       dat.f   0,0               inserted by boot 
;       dat.f   0,0
loop    mov.i   @1,*stone
        mov.i   @0,@stone
        add.f   (inc-2),stone
        jmz.b   loop,trigger
clear   mov.i   dbomb,>ptr
        mov.i   dbomb,>ptr
        djn.f   clear,>ptr
dbomb   dat.f   0,cstart
istone  dat.f   >-(2*step),>(trigger-stone+2*step)

i       for     (MAXLENGTH-CURLINE-(dbomb-loop+1)-6)
        dat.f   >(i+300),}(i+400)
        rof

boot
binc    mov.i   inc,(loop+bdist-3)
i       for     (dbomb-loop+1)
        mov.i   (loop+i-1),>bptr
        rof
bptr    spl.a   (loop+bdist),(loop+bdist)
bstone  mov.i   istone,(stone+bdist)
        mul.f   bptr,bptr
        mul.b   binc,binc
        mul.b   bstone,bstone

        end     boot

