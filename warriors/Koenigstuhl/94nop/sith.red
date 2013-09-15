;redcode-94nop
;name Sith
;author Christian Schmidt
;assert CORESIZE==8000
;strategy qscan -> silk/stone & silk/imps

zero    equ     qbomb
qtab3   equ     qbomb

iStep   equ     1143
pStep   equ     7342
sStep   equ     5965

pStep1  equ     182
pStep2  equ     2007
pStep3  equ     7549
pStep4  equ     958
bOff1   equ     7505
bOff2   equ     4568

pAwa1   equ     qbomb + 4594
pAwa2   equ     qbomb + 5475

qbomb   dat     >qoff,          >qc2
        dat     0,              0

paper   spl     1,              <qb1
qtab2   spl     1,              <qb2
        spl     1,              <qb3

        mov.i   <1,             {1
        spl     pAwa1,          pEnd+1
        mov.i   <1,             {1
        jmp     pAwa2,          imp+1

pap1    spl     @0,             }pStep1
        mov.i   }-1,            >-1
        spl     @0,             }pStep2
        mov.i   }-1,            >-1
        spl     2,             <pStep3
        mov.i   bOff1,         {bOff2
        add.ab  {0,            }0
pEnd    djn.f   -4,            <pStep4

        for     4
        dat     0,              0
        rof

        dat     zero-1,         qa1
qtab1   dat     zero-1,         qa2

pap2    spl     @0,             }pStep
        mov.i   }-1,            >-1
        spl     #0,             0
        mov     pBomb,          >pPtr
        add.x   imp,            pPtr
pPtr    jmp     imp-iStep*8,    >sStep-6
pBomb   dat     >1,             }1
imp     mov.i   #sStep-1,       iStep


        for     34
        dat     0,              0
        rof

qc2 equ ((1 + (qtab3-qptr)*qy) % CORESIZE)
qb1 equ ((1 + (qtab2-1-qptr)*qy) % CORESIZE)
qb2 equ ((1 + (qtab2-qptr)*qy) % CORESIZE)
qb3 equ ((1 + (qtab2+1-qptr)*qy) % CORESIZE)
qa1 equ ((1 + (qtab1-1-qptr)*qy) % CORESIZE)
qa2 equ ((1 + (qtab1-qptr)*qy) % CORESIZE)
qz equ 2108
qy equ 243
qgo sne qptr + qz*qc2, qptr + qz*qc2 + qb2
 seq <qtab3, qptr + qz*(qc2-1) + qb2
 jmp q0, }q0
 sne qptr + qz*qa2, qptr + qz*qa2 + qb2
 seq <qtab1, qptr + qz*(qa2-1) + qb2
 jmp q0, {q0
sne qptr + qz*qa1, qptr + qz*qa1 + qb2
 seq <(qtab1-1), qptr + qz*(qa1-1) + qb2
 djn.a q0, {q0
 sne qptr + qz*qb3, qptr + qz*qb3 + qb3
 seq <(qtab2+1), qptr + qz*(qb3-1) + (qb3-1)
 jmp q0, }q1
sne qptr + qz*qb1, qptr + qz*qb1 + qb1
 seq <(qtab2-1), qptr + qz*(qb1-1) + (qb1-1)
 jmp q0, {q1
 sne qptr + qz*qb2, qptr + qz*qb2 + qb2
 seq <qtab2, qptr + qz*(qb2-1) + (qb2-1)
 jmp q0
 seq >qptr, qptr + qz + (qb2-1)
 jmp q2, <qptr
seq qptr+(qz+1)*(qc2-1),qptr+(qz+1)*(qc2-1)+(qb2-1)
 jmp q0, }q0
seq qptr+(qz+1)*(qa2-1),qptr+(qz+1)*(qa2-1)+(qb2-1)
 jmp q0, {q0
seq qptr+(qz+1)*(qa1-1),qptr+(qz+1)*(qa1-1)+(qb2-1)
 djn.a q0, {q0
 jmz.f paper, qptr + (qz+1)*(qb2-1) + (qb2-1)
qoff equ -87
qstep equ -7
qtime equ 14
q0 mul.b *2, qptr
q2 sne {qtab1, @qptr
q1 add.b qtab2, qptr
 mov qtab3, @qptr
qptr mov qbomb, }qz
 sub #qstep, qptr
 djn -3, #qtime
 jmp paper
end qgo

