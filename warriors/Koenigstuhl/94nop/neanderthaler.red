;redcode-94nop
;name Neanderthaler
;author Roy van Rijn
;strategy BiShot style warrior (with decoy)
;assert 1

sOff    equ     (21*sStep-1)
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
for 10
        dat     0,           0
rof

sPtr    spl     {sOff,       >3360+sOff
        dat     >3370,       {10
sBomb   spl     #20,         <5334
sLoop   mov     sBomb,       >sPtr
        mov     sBomb,       }sPtr
sBack   djn.a   sLoop,       <sBomb
        dat     0,           0
        dat     0,           0
        dat     0,           0
        dat     0,           0          ;scanned
for 10
        dat     0,           0
rof
D       equ     -1310
dc      mov     {dc+D   ,    <dc+D+2
        mov     <dc+D+1 ,    <dc+D+4
        mov     {dc+D+5 ,    <dc+D+7
        mov     <dc+D+8 ,    <dc+D+11
        mov     {dc+D+17 ,   <dc+D+12
        mov     <dc+D+13,    <dc+D+14
        djn.f   sOne+1  ,    <dc+D+10 ;slightly larger decoy
end dc
;redcode-94nop
;name Neanderthaler
;author Roy van Rijn
;strategy BiShot style warrior (with decoy)
;assert 1

sOff    equ     (21*sStep-1)
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
for 10
        dat     0,           0
rof

sPtr    spl     {sOff,       >3360+sOff
        dat     >3370,       {10
sBomb   spl     #20,         <5334
sLoop   mov     sBomb,       >sPtr
        mov     sBomb,       }sPtr
sBack   djn.a   sLoop,       <sBomb
        dat     0,           0
        dat     0,           0
        dat     0,           0
        dat     0,           0          ;scanned
for 10
        dat     0,           0
rof
D       equ     -1310
dc      mov     {dc+D   ,    <dc+D+2
        mov     <dc+D+1 ,    <dc+D+4
        mov     {dc+D+5 ,    <dc+D+7
        mov     <dc+D+8 ,    <dc+D+11
        mov     {dc+D+17 ,   <dc+D+12
        mov     <dc+D+13,    <dc+D+14
        djn.f   sOne+1  ,    <dc+D+10 ;slightly larger decoy
end dc
