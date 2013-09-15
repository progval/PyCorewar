;redcode-94nop
;name Dracula 2003
;author Roy van Rijn
;strategy Rework of an older vampire, scores surprisingly well
;strategy Optimized using optiMAX!
;assert 1

step    equ (2*5*6413)
bdist   equ (1066)

pitlink equ (clbmb+hit-step)

zero    equ     qbomb

qtab3   equ     qbomb
qbomb   dat     >qoff           , >qc2
        dat     0               , 0

        dat     0               , <qb1
qtab2   dat     incm            , <qb2
        dat     fang+bdist+(13) , <qb3
        dat     0               , 0

fang	jmp @-2*step+hit+1,pitlink-(hit-2*step)+1
clptr	dat #-step-1,step-1
clbmb   dat >1,incs-clptr+2
loop	add.f clptr,fang
	mov.i @0,>fang
	jmz.f loop,}fang
	mov.i incs,*fang
hit	mov.i incm,{fang
	jmp loop,}fang		;hit with spl
	mov.i *incs,>clptr
last	djn.f -1,{clptr

        dat    zero-1           , qa1
qtab1   dat    zero-1           , qa2

incm    mov.i 1,}1
incs	spl #1,1
        spl #clbmb-incs,incs-clptr
bsource dat -16,0                 ;scanned

boot z  for 11
        mov.i }bsource,>booptr
rof
        mov.i }qtab2  ,}qtab2+1
        mov.i }qtab2  ,}qtab2+1 ;boot the last bombs
        mov.i }qtab2  ,}qtab2+1

booptr  jmp   loop+bdist,fang+bdist

        for 25
	dat 0,0
	rof

pit     spl #0,   <-5
        jmp <2667,<-6

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
        jmz.f   boot            , qptr+(qz+1)*(qb2-1)+(qb2-1)

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
        djn.f   boot            , 0

end qgo

