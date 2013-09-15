;redcode
;name Tiny
;author Paul Khuong
;assert 1
;strategy HSA-style scanner!

        first   equ     11
        step    equ     9
        nop     }start,<start
        jmp     start
        add.b   bomb,   #first
start   jmz.f   @0,     @0
        mov     *-2,    >-2
bomb    spl     -2,     >step

