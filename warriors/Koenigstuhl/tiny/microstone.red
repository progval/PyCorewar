;redcode-94nop
;name Micro Stone
;author Christian Schmidt
;strategy 3-line Stone
;assert 1

sStart  EQU    79 
sStep   EQU    66 


pStart  mov    {sStart,  1-sStep
        sub.x  #sStep,   -1
        jmp    -2,       }-2

