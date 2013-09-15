;redcode-94nop
;name Gremlin
;author van Rijn/Grabun
;strategy Q^4 -> Stone/Imp
;strategy Pixie is back, and turned evil!
;strategy New qscan, changed the stone a bit, improved boot distances
;assert 1

; -- stone constants

sStp    equ    (107)
sFst    equ    (-115-1)
sHop    equ    (6916+1)
sGat    equ    (sHop+sMov-1)
sDjn    equ    (1311)

sBo1    equ    (930+orig)
sOff    equ    (5)
sBo2    equ    (sBo1+sOff)
sBmb    equ    (sRck+sOff)

; -- imp constants

iStp    equ    (2667)
iSDc    equ    (-iStp-1)
iHp1    equ    (iImp-2*(iStp+1))
iHp2    equ    (iImp+2*iStp-1)
iBoo    equ    (1604+5+orig)

; -- start of code

orig z	for    0
	rof

zero    equ     qbomb

qtab3   equ     qbomb
qbomb   dat     >qoff           , >qc2

; -- boot code

bBoo    mov     sRck ,  sBo2
        spl    }   2 , <  qb1
qtab2   spl    *   1 , <  qb2
        spl        0 , <  qb3
        mov    <iImp , {qtab1     ; boot stone
	mov    <iPmp , {iDst	  ; boot imp launcher
        djn    *qtab1, #   5      ; start stone
iDst	jmp    iBoo ,  <iBoo-1	  ; jump to imp launcher

        dat        0 , 0
        dat        0 , 0
        dat        0 , 0
        dat        0 , 0
        dat        0 , 0
        dat        0 , 0
        dat        0 , 0
        dat        0 , 0

        dat   zero-1 , #  qa1
qtab1   dat     sBo1 , #  qa2

for     2
        dat     0               , 0
rof

; -- imp launcher

iPmp	spl    #iImp , #sSrc
     	sub.f  #iSDc ,  iJmp
     	mov     iImp , }iPmp
iJmp	jmp     iHp1 , >iHp2
iImp    mov.i  # iStp , *6

; -- stone
sSrc    spl    #sDjn , <sGat      ; based on skew dwarf
sPtr	mov     sBmb , {sFst	  ; but without hitting the
sMov	mov     sBmb , @sPtr	  ; djn line.
        sub    #sStp , *1
        djn.f   sPtr , {sSrc
sRck    dat    <sHop , >   1

for     33
        dat     0               , 0
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
        jmz.f   bBoo            , qptr+(qz+1)*(qb2-1)+(qb2-1)

qoff    equ     -86
qstep   equ     -7
qtime   equ     19

q0      mul.b   *2              , qptr
q2      sne     {qtab1          , @qptr
q1      add.b   qtab2           , qptr
        mov     qtab3           , @qptr
qptr    mov     qbomb           , }qz
        sub     #qstep          , qptr
        djn     -3              , #qtime
        djn.f   bBoo            , #0
end qgo

