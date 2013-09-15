;redcode-94nop
;name Help...I'm Scared
;author Roy van Rijn
;strategy Based on BiShot, with a little decoy added
;assert 1

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

for 40
        dat     0,           0
rof

sPtr    spl     {sOff,       >3200+sOff
        dat     >3210,       {10
sBomb   spl     #20,         <5334
sLoop   mov     sBomb,       >sPtr
        mov     sBomb,       }sPtr
sBack   djn.a   sLoop,       <sBomb
        dat     0,           0
        dat     0,           0
        dat     0,           0
        dat     0,           0          ;scanned
for 30
        dat     0,           0
rof
D       equ     -1310
dc      mov     {dc+D   ,    <dc+D+2
        mov     <dc+D+1 ,    <dc+D+4
        mov     {dc+D+5 ,    <dc+D+7
        djn.f   sOne+1  ,    <dc+D+11
end dc

