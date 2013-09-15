;redcode-94x
;name tiny BiShot
;author Christian Schmidt
;strategy .66c BiShot Scanner
;strategy ups, there was a bug
;assert 1

sOff    equ     (3*sStep-1)
sStep   equ     10

sOne    add.f   sAdd,        sPtr
        sne.i   *sPtr,       @sPtr
        jmp     sOne,        0
        jmp     sBomb,       0
sAdd    dat.f   sStep,       sStep

    for 2
        dat     0,           0
    rof
        dat     0,           0
sPtr    spl     {sOff,       >400+sOff
        dat     {10,         >410
sBomb   spl     #20,         <-100
sLoop   mov     sBomb,       >sPtr
        mov     sBomb,       }sPtr
sBack   djn.a   sLoop,       <sBomb

        dat     0,           0

    for MAXLENGTH-CURLINE
        dat     0,          0
    rof

