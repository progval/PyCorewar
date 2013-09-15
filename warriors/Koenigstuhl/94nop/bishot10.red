;redcode-94
;name BiShot v1.0
;author Christian Schmidt
;strategy .66c BiShot Scanner
;strategy v1.0 new stepsize, no boot and decoy
;assert 1

;For comments see BiShot v0.3

sOff    equ     (20*sStep-1)
sStep   equ     10

sOne    add.f   sAdd,        sPtr
        sne.i   *sPtr,       @sPtr
        jmp     sOne,        0
        jmp     sBomb,       0
sAdd    dat.f   sStep,       sStep

    for 2
        dat     0,           0
    rof
        dat     0,           0          ;scanned
sPtr    spl     {sOff,       >4000+sOff
        dat     {10,         >4010
sBomb   spl     #20,         <-100  
sLoop   mov     sBomb,       >sPtr
        mov     sBomb,       }sPtr
sBack   djn.a   sLoop,       <sBomb

        dat     0,           0

    for MAXLENGTH-CURLINE
        dat     0,          0
    rof

