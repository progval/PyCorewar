;redcode-lp
;name WhenEver
;author Roy van Rijn
;strategy Warrior idea from Eve15 (imps and gate)
;strategy New qscan (extendedQ^4) other imp and other gate
;strategy Rewritten from scratch! (Its a simple warrior!)
;assert 1

;some comments quickly added

zero    equ     qbomb

qtab3   equ     qbomb
qbomb   dat     >qoff   , >qc2
        dat     0       , 0

pGo     mov     imp     , <qb1  ; using the qscan table as 
                                ; imp-boot-ptr (far from optimal distance)
qtab2   spl     <-1     , >qb2
        spl     imp     , >qb3
        djn.f   #0      , <-20
        jmp     #0      , <-21  ; placed the imp away...behind the qscan

for     10
        dat     0       , 0
rof

        dat    zero-1   , qa1
qtab1   dat    zero-1   , qa2


for     45
        dat     0       , 0
rof


qc2     equ ((1+(qtab3-qptr)*qy)%CORESIZE)
qb1     equ ((1+(qtab2-1-qptr)*qy)%CORESIZE)
qb2     equ ((1+(qtab2-qptr)*qy)%CORESIZE)
qb3     equ ((1+(qtab2+1-qptr)*qy)%CORESIZE)
qa1     equ ((1+(qtab1-1-qptr)*qy)%CORESIZE)
qa2     equ ((1+(qtab1-qptr)*qy)%CORESIZE)
qz      equ 2108
qy      equ 243         ;qy*(qz-1)=1

;q0 mutation
qgo     sne     qptr+qz*qc2     , qptr+qz*qc2+qb2
        seq     <qtab3          , qptr+qz*(qc2-1)+qb2
        jmp     q0              , }q0
        sne     qptr+qz*qa2     , qptr+qz*qa2+qb2
        seq     <qtab1          , qptr+qz*(qa2-1)+qb2
        jmp     q0              , {q0
        sne     qptr+qz*qa1     , qptr+qz*qa1+qb2
        seq     <(qtab1-1)      , qptr+qz*(qa1-1)+qb2
        djn.a   q0              , {q0
                                        ;q1 mutation
        sne     qptr+qz*qb3     , qptr+qz*qb3+qb3
        seq     <(qtab2+1)      , qptr+qz*(qb3-1)+(qb3-1)
        jmp     q0              , }q1
        sne     qptr+qz*qb1     , qptr+qz*qb1+qb1
        seq     <(qtab2-1)      , qptr+qz*(qb1-1)+(qb1-1)
        jmp     q0              , {q1

        sne     qptr+qz*qb2     , qptr+qz*qb2+qb2
        seq     <qtab2          , qptr+qz*(qb2-1)+(qb2-1)
        jmp     q0
                                        ;qz mutation
        seq     >qptr           , qptr+qz+(qb2-1)
        jmp     q2              , <qptr
                                        ;q0 mutation
        seq     qptr+(qz+1)*(qc2-1),qptr+(qz+1)*(qc2-1)+(qb2-1)
        jmp     q0              , }q0
        seq     qptr+(qz+1)*(qa2-1),qptr+(qz+1)*(qa2-1)+(qb2-1)
        jmp     q0              , {q0
        seq     qptr+(qz+1)*(qa1-1),qptr+(qz+1)*(qa1-1)+(qb2-1)
        djn.a   q0              , {q0
        jmz.f   pGo             , qptr+(qz+1)*(qb2-1)+(qb2-1)

qoff    equ     -86
qstep   equ     -7
qtime   equ     19

q0      mul.b   *2      , qptr
q2      sne     {qtab1  , @qptr
q1      add.b   qtab2   , qptr
        mov     qtab3   , @qptr
qptr    mov     qbomb   , }qz
        sub     #qstep  , qptr
        djn     -3      , #qtime
        djn.f   pGo     , #0
imp     mov.i   #1      , *0    ; a-field imp instead of normal imp

end qgo

