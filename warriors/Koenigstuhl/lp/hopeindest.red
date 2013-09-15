;redcode-lp
;name Hopefully Indestructible v1.0
;author Ian Sutton
;strategy When we have less than 8 processes,
;strategy boot away another fast core clear/imp gate.
;assert CORESIZE == 8000

step    equ     810

        org     boot

boot    add.a   #step, bptr
        mov     clear+2, {bptr
        mov     clear+1, {bptr
        mov     clear+0, {bptr
bptr    spl     -step+100, <1
        jmp     boot, >-200

        for     20
        dat     0, 0
        rof
gate equ clear-3
clear   mov     dbomb, >gate
        jmp     -1, >gate
dbomb   dat     <1, 19
