;redcode-94
;name The Three-Handed Knight
;author Christian Schmidt
;strategy mini Q^4 -> stone/imp
;strategy ultra fast design
;strategy booting a stone and 
;strategy TWO imp-launcher (a- AND b-imp)
;assert 1

sDist   equ     5631
iDist   equ     sDist+104
iDist2  equ    (iDist-(197*10));sDist+301;
sOff    equ     -200
istep   equ     2667

         dat    0, }qC
qTab2    dat    0, }qD
         dat    0, }qE

cSp     spl     #0,    <sOff+3
        mov     197,   cAd-(197*3500)
cAd     add.ab  {0,    }0    
        djn.f   -2,    <sOff
sEnd    dat     0,          0

iStart  spl     #0,   <-250
        add.f   imp,       launch
launch  spl     imp-istep-1,   <-250
        djn     sDist-iDist-3, <-400
iEnd    dat     0,          0
imp     mov.i   #istep,     *0

iStart2  spl     #0,   <-250
        add.ba  imp2,       launch2
launch2  spl     imp2-istep-1,   <-250
        djn     sDist-iDist2-3, <-400
iEnd2    dat     0,          0
imp2     mov.i   #1, istep

pGo     mov     cBomb,      cSp+sDist+198+5
        mov     imp,        imp+iDist
        mov     imp2,        imp+iDist2
        spl     1
        spl     1
        mov     {sEnd,      {sBoo
        mov     {iEnd,    {iBoo
        mov     {iEnd2,    {iBoo2
sBoo    spl    iEnd+sDist
iBoo    spl     iEnd+iDist
iBoo2    jmp     iEnd+iDist2

         for 13
         dat 0,0
         rof

cBomb   dat     >-1,        >1
        dat 0, }qA
qTab1   dat 0, }qB

for 27
dat 0, 0
rof

        qX      equ     3080
        qA      equ     3532
        qB      equ     2051
        qC      equ     6177
        qD      equ     4696
        qE      equ     3215
        qF      equ     583

        qStep   equ     7
        qTime   equ     16
        qOff    equ     87

qBomb   dat     {qOff   , qF


qGo     sne     qPtr+qX*qE      , qPtr+qX*qE+qE
        seq     <qTab2+1        , qPtr+qX*(qE-1)+(qE-1)
        jmp     qDec            , }qDec+2
        sne     qPtr+qX*qF      , qPtr+qX*qF+qD
        seq     <qBomb          , qPtr+qX*(qF-1)+qD
        jmp     qDec            , }qDec
        sne     qPtr+qX*qA      , qPtr+qX*qA+qD
        seq     <qTab1-1        , qPtr+qX*(qA-1)+qD
        djn.a   qDec            , {qDec
        sne     qPtr+qX*qB      , qPtr+qX*qB+qD
        seq     <qTab1          , qPtr+qX*(qB-1)+qD
        djn.a   qDec            , *0
        sne     qPtr+qX*qC      , qPtr+qX*qC+qC
        seq     <qTab2-1        , qPtr+qX*(qC-1)+(qC-1)
        jmp     qDec            , {qDec+2
        sne     qPtr+qX*qD      , qPtr+qX*qD+qD
        jmz.f   pGo             , <qTab2

qDec    mul.b   *2      , qPtr
qSkip   sne     <qTab1  , @qPtr
        add.b   qTab2   , qPtr
qLoop   mov     qBomb   , @qPtr
qPtr    mov     qBomb   , }qX
        sub     #qStep  , @qSkip
        djn     qLoop   , #qTime
        djn.f   pGo     , #0

        end qGo

