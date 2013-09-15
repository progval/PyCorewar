;redcode
;name Neat Thing That has Bad Constants
;author Matt Lewinski
;assert 1

        org     loop
space   equ     8

data    dat.f   $83     , $29
mult    dat.f   $2      , $2
for space
        dat.f   $0      , $0
rof
loop    mul.x   $data   , $mult
        mov.i   $data   , @mult
        mov.i   $data   , *mult
        mov.i   {mult   , <mult
        djn.b   $loop   , #150       ; was #1500 (changed by CCB)
clear   spl.b   #0      , >-90
        mov.i   $datf   , >data
        djn.f   $-1     , >data
datf    dat.f   >2667   , }datf-data+2

