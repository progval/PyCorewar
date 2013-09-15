;redcode-94nop
;name PerfectTimev2
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy stone/paper

ps2 equ 1123
bs1 equ 3427
bs2 equ 1311
pbdist equ 1161
pend equ pbomb+1
numproc equ 8
sstep equ 5989
ini equ sstep-1
sbdist equ 1743
pbdist1 equ 2891

zero equ qbomb 
qtab3 equ qbomb
qc2 equ ((1 + (qtab3-qptr)*qy) % CORESIZE) 
qb1 equ ((1 + (qtab2-1-qptr)*qy) % CORESIZE) 
qb2 equ ((1 + (qtab2-qptr)*qy) % CORESIZE) 
qb3 equ ((1 + (qtab2+1-qptr)*qy) % CORESIZE) 
qa1 equ ((1 + (qtab1-1-qptr)*qy) % CORESIZE) 
qa2 equ ((1 + (qtab1-qptr)*qy) % CORESIZE) 
qz equ 3497
qy equ 381
qoff equ -87 
qstep equ -5
qtime equ 13

 org qgo
boot spl 1, 0
 spl 1, 0
 spl 1, 0
 mov <go1, {go1
go1 spl sbomb+3+sbdist, sbomb+3
 spl stone+sbdist, 0
 mov <go2, {go2
go2 spl pbdist+pend+1, pend+1
 mov <go3, {go3
go3 jmp pbdist1+pend+1, pend+1
p2 spl ps2, {cpy
 mov }cpy, }p2
 mov pbomb, >bs1
 mov pbomb, >bs2
cpy mov p2+numproc, }p2
 jmz.f p2, *cpy
pbomb dat <2667, <5334
 dat 0, 0
stone spl #2*sstep, >2*sstep
 mov.i sbomb, *shoot
incr add.f stone, @-1
shoot mov.i ini, ini+sstep
 jmp -3, >-30
sbomb dat >1, }1
 for 8
 dat 0, 0
 rof
qbomb   dat >qoff, >qc2
 for 10
 dat 0, 0
 rof
        dat 0, #qb1
qtab2   dat 0, #qb2
 dat 0, #qb3
 for 12
 dat 0, 0
 rof
        dat zero - 1, qa1 
qtab1   dat zero - 1, qa2 
qgo  sne qptr + qz*qc2, qptr + qz*qc2 + qb2 
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
 jmz.f boot, qptr + (qz+1)*(qb2-1) + (qb2-1) 
q0 mul.b *2, qptr 
q2 sne {qtab1, @qptr 
q1 add.b qtab2, qptr 
 mov qtab3, @qptr 
qptr mov qbomb, }qz 
 sub #qstep, qptr 
 djn -3, #qtime 
 jmp boot
 end

