;redcode-94
;name DifferentialOperatorWS
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy stone/paper

numproc equ 6
ps1 equ 1173
ps2 equ 4379
bs1 equ -1835
pbdist equ 932
sbdist equ 1568

sstep equ 6567
ini equ sstep+1

zero equ qbomb 
qtab3 equ qbomb
qc2 equ ((1 + (qtab3-qptr)*qy) % CORESIZE) 
qb1 equ ((1 + (qtab2-1-qptr)*qy) % CORESIZE) 
qb2 equ ((1 + (qtab2-qptr)*qy) % CORESIZE) 
qb3 equ ((1 + (qtab2+1-qptr)*qy) % CORESIZE) 
qa1 equ ((1 + (qtab1-1-qptr)*qy) % CORESIZE) 
qa2 equ ((1 + (qtab1-qptr)*qy) % CORESIZE) 
qz equ 1687
qy equ 785
qoff equ -87 
qstep equ -5
qtime equ 13

 org qgo
boot spl 1, 0
 mov -1, 0
 mov <gop, {gop
 spl 1, 0
 mov <gos, {gos
gos spl sbomb+1+sbdist, sbomb+1
 spl *-1, 0
 mov <gop, {gop
gop jmp pbomb+1+pbdist, pbomb+1
p1 spl @0, >ps1
 mov }p1, >p1
 mov }p1, >p1
p2 spl ps2, {cpy
 mov }cpy, }p2
 mov pbomb, >bs1
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
 for 22
 dat 0, 0
 rof
qbomb   dat >qoff, >qc2
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

