;redcode-94nop
;name Shrink
;author Christian Schmidt
;strategy qscanner, shrinking paper
;assert 1

zero    equ    qbomb
qtab3   equ    qbomb

pStep1  EQU    6785
pStep2  EQU    2148
pStep3  EQU    627
bStep1  EQU    7585
pAwa1   EQU    4582
pAwa2   EQU    7267

qbomb   dat    >qoff,          >qc2
paper   spl    2,              {6744
        spl    2,              <qb1
qtab2   spl    1,              <qb2
        mov.i  -1,             #qb3

        mov    {cc+2,          {pBo1
pBo1    spl    cc+pAwa1,       {2220
        mov    <cc+2,          {pBo2
pBo2    djn.f  cc+pAwa2,       <3742

spec    spl    pStep1,         <pStep1-1
        mov.i  }-2,            >-1
silk1   spl    @0,             <pStep2
        mov.i  }-1,            >-1
silk2   spl    @0,             <pStep3
        mov.i  }-1,            >-1
bomb    mov.i  #1,             <1
cc      djn.b  -2,             #bStep1

        for     4
        dat     0,             0
        rof

        dat zero - 1,          qa1
qtab1   dat zero - 1,          qa2

        for     42
        dat     0,             0
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

