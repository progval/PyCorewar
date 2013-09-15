;Address bdthomse@peruvian.cs.utah.edu
;redcode-icws
;name Irony v1.0
;author Brant D. Thomsen
;strategy CMP scanner, lays SPL carpet.
;strategy Uses same constants as 8000 memory version :-)
;strategy Submitted: Mon Sep 20 22:49:18 MDT 1993
;assert 1
sep     equ     10
step    equ     78
a       equ     (-2-step)

top     add     #sep+2, compare
        mov     #sep+2, bomb+1
loop    add     data, compare
compare cmp     a, a+sep
        slt     #data+sep+5, compare
        djn     loop, <compare-3501
bomb    mov     clear, <compare
        djn     bomb, #sep+2
        jmz     top, top-1
clear   spl     0, <1-step
        mov     1, <bomb+1
data    dat     <0-step, <0-step        

        end     compare
