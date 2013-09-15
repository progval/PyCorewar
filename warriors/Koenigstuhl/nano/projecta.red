;redcode
;name ProjectA
;author Simon Duff
;strategy Bomb mod-4 with simple imps
;assert CORESIZE % 4 == 0

step    EQU     28

        ORG     ptr


top:    add     #step,  ptr
ptr:    mov     bomb,   ptr+1+step
        jmp     top
bomb:   mov.i   0,      1

