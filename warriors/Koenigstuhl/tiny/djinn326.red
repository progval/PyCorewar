;redcode-94x
;name Djinn Test Tiny 326
;author Steve Gunnell
;strategy Vanilla d-clear
;assert 1

GAP1    equ     6
GAP2    equ     8
REPEAT  equ     0
SKIP    equ     (clrbomb-ptr+0)
SAFETY  equ     1

ptr     dat     0,      333
        for GAP1
        dat     0,      0
        rof
clear   spl     #0,     >ptr
loop    mov     clrbomb,>ptr
        for REPEAT
        mov     clrbomb,>ptr
        rof
tail    djn.f   loop,   >ptr

        for GAP2
        dat     0,      0
        rof
        for SAFETY
        dat     <267,  SKIP
        rof
clrbomb dat     <267,  SKIP

        end     clear
