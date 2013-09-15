;redcode-94nop
;name Dirty Dog
;author Christian Schmidt
;strategy stone/paper
;assert 1

sStep  EQU   105

pStart  spl     2,           <756
        spl     1,           <68
        spl     1,           <763

        mov     <sBoo,       {sBoo
sBoo    spl     pStart+499,  sInc+6

        mov     <pBoo,       {pBoo
pBoo    jmp     pStart+189,  silk1+6 

silk1   spl     @0,          <72
        mov     }-1,         >-1
silk2   spl     @0,          <229
        mov     }-1,         >-1
        mov.i   #1,          <1
cc      djn.f   -2,          <177

        dat     0,           0
        dat     0,           0
        dat     0,           0

sInc    spl     #-sStep,     >sStep
sPtr    mov     >-sStep*2,   1+sStep*2
        add     sInc,        sPtr
        djn.f   sPtr,        >sInc+sStep

        end     pStart

