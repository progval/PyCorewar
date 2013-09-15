;redcode-94nop
;name Dandelion II
;author Schmidt/Zapf
;strategy blurish scanner TNG
;strategy decoymaker added
;assert CORESIZE == 8000

sSep    equ    8
sOff    equ    5753
sStep   equ    7212
cOff    equ    602

inc     nop    #sStep,    sStep
cptr    mov    clear,     }6727
sgate   mov    clear,     >cptr
scan    seq    sOff+sSep, sOff
        mov.b  scan,      cptr
        add    inc,       scan
        jmn    sgate,     @sgate
        jmp    clear

        for             17
        dat     0,      0
        rof

gap     equ     26

gate    dat    4009+cOff, {gap+cOff
jumper  jmp    4009,      gap
        dat    0,         0
        dat    0,         0
        jmp    7684,      <2667
clear   spl    #4007,     gap
        mov    @switch,   >gate
        mov    jumper,    }gate
switch  djn    clear+1,   {clear

        for    28
        dat    0,         0
        rof

dplace  equ    (inc+2453)

decoy   mov    <dplace+0, {dplace+2
        mov    <dplace+3, {dplace+5
        mov    <dplace+6, {dplace+8
        mov    <dplace+9, {dplace+11
        djn.f  scan,      <dplace+13

end decoy

