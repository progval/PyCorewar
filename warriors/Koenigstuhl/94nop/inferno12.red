;redcode-94lp
;name Inferno 1.2
;author Philip Kendall
;strategy Incendiary Tornado-based stone -> spl/dat coreclear
;strategy 1.2: changed to a d-clear
;assert CORESIZE==8000

STEP    equ     3205                    ; optimized with mopt
BOMB1   equ     (4+STEP+bomber)
GATE    equ     (bomber-208)
CSTART  equ     (stone+2-ptr)
BOOT    equ     4283
IMP     equ     2667

bomber  mov.i   sbomb,*stone
        mov.i   mbomb,@stone
stone   mov.i   *BOMB1,*BOMB1+STEP
        add.f   incr,stone
        jmp.a   bomber,<GATE            ; will be bombed with sbomb
        jmp.a   sbomb,<GATE
incr    dat.f   #(STEP*3),#(STEP*3)
mbomb   mov.i   STEP,>STEP
ptr     dat.f   0,>CSTART
sbomb   spl.a   #0,-STEP+1              ; this gets bombed by itself
clear   mov.i   bomb,>ptr
        djn.f   clear,>ptr
bomb    dat.f   {IMP,>(bomb+1-ptr)

boot
dummy   for     (bomb-bomber+1)
        mov.i   }bootptr,>bootptr
        rof
go      spl.a   (bomber+BOOT),<1000     ; start bombing
        sub.f   bootptr,bootptr         ; erase the boot pointers
        sub.f   go,go
bootptr dat.f   bomber,bomber+BOOT      ; kill off the boot process

rubbish for     (MAXLENGTH-CURLINE)
        dat.f   {(rubbish+100),>((rubbish+100)*2)
        rof

        end     boot

