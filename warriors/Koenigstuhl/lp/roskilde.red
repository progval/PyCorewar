;redcode-lp
;name Roskilde
;author Christian Schmidt
;strategy 3 stones with 1 proc each
;strategy 5 procs for the paper
;assert 1
;optimax pws

sAwa1   equ   6897
sAwa2   equ   2842
sAwa3   equ   4582
sStep   equ   1564
sStep2  equ   383

pStep1  equ   2990
pStep2  equ   1719

zero    equ     qbomb
qtab3   equ     qbomb

p1      mov     #6,             #6
pGo     mov     <p1,            <j1
        jmn     -1,             @-2
        spl     @p1,            <pStep2
j1      jmz.b   @0,             pStep1
b1      dat     {1,             <1

        for     50
        dat     0,              0
        rof

qbomb   dat     >qoff,          >qc2
        dat     0,              0

xGo     spl     pGo,            <qb1
qtab2   spl     2,              <qb2
        spl     1,              <qb3

        mov     <s1,            {s1
        mov     <s2,            {s2
        mov     <s3,            {s3
        jmp     *s1,            }0

s1      dat     p1+sAwa1,       sEnd+1
s2      dat     p1+sAwa2,       sEnd+1
s3      dat     p1+sAwa3,       sEnd+1

        mov     <sStep2 ,       1+sStep
        sub     1,              -1
sEnd    jmp     -2,             <-sStep

        for     6
        dat     0,              0
        rof

        dat     zero-1,         qa1
qtab1   dat     zero-1,         qa2

for 42
 dat 0, 0
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
 jmz.f xGo, qptr + (qz+1)*(qb2-1) + (qb2-1)
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
 jmp xGo
end qgo

