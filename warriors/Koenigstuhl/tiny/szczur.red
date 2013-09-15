;redcode-94x
;name Szczur
;author Arek Paterek
;strategy  0.8c bomber/scanner (mod 8) -> clear
;assert 1


cstep   equ     136

scan    mov     bomb,   @target
        mov     bomb,   *target
target  seq     @bomb+cstep,@bomb+2*cstep
        sub     bomb,   target
        add     step,   target
        jmz     scan,   bomb-cstep
        jmp     2
bomb    dat     }cstep*2,<cstep*2
step    spl     #cstep*4,<cstep*4
clear   mov     2,      <3
        jmp     -1
        dat     }-2,    }-5
        dat     }-2,    }-300

