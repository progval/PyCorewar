;redcode-94nop
;name Myrmidon
;author Roy van Rijn
;strategy Bombing oneshot
;assert 1

ptr     dat     0, 	sScan-7
        dat     0,      0
        dat     0,      0

sw      dat     1,      14
g2      spl     #24,    14
        dat     0,      0
        dat     0,      0
clr     spl     #sStep, sStep
        mov     *sw,    >ptr
        mov     *sw,    >ptr
        djn.f   -2,     }g2

for     15
        dat     0,      0
rof

sOff    equ     4202
sStep   equ     32
sDiff   equ     4021

sGo     add.f   clr,    sScan
        mov     sBomb,  *1
sScan   sne     *sOff,  >(sOff+sDiff)-7
        djn.f   sGo,    @-1
        add.b   sScan,  ptr
        jmp     clr,    <2533

for     5
        dat     0,      0
rof

sBomb   mov     sDiff,  1

end sGo

