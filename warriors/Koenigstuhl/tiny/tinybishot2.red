;redcode-94x
;name Tiny BiShot 2.0
;author Christian Schmidt
;strategy .66c BiShot Scanner
;strategy thanks to John Metcalf for the optimization
;assert CORESIZE==800

sOff    equ     (sOne+2+40)

sOne    add.f   #sPtr,       sPtr
        sne.i   *sPtr,       @sPtr
        djn.f   sOne,        @sPtr
        djn.f   sBomb,       sPtr

    for 4
        dat     0,           0
    rof

sPtr    dat     sOff,        404+sOff
        dat     10,          410
sBomb   spl     #20,         -200
sLoop   mov     sBomb,       }sPtr
        mov     sBomb,       >sPtr
sBack   djn.a   sLoop,       <sBomb

        end     sOne+1

