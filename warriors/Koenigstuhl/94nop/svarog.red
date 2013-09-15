;redcode-94nop
;name Svarog
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy scanner - should do better against oneshots now

step equ 5989
ini equ step
dc equ where-1964

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
where mov stun, 4150
vrh mov stun, >where
scan seq.i ini, ini+8
 mov.ab scan, @vrh
 sub.f clear, scan
 jmn.b vrh, @vrh
clear spl #-step, >-step
 mov bomb, >vrh
 djn.f -1, >vrh
bomb dat <2667, <12
stun spl #1, #1
 for 25
 dat 0, 0
 rof
qbomb   dat >qoff, >qc2
 for 10
 dat 0, 0
 rof
        dat 0, #qb1
qtab2   dat 0, #qb2
 dat 0, #qb3
 for 7
 dat 0, 0
 rof
decoy nop {dc, <dc+1
 mov <dc+2, {dc+4
 mov {dc+5, <dc+7
 mov <dc+8, {dc+10
 djn.f scan, dc+12
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
 jmz.f decoy, qptr + (qz+1)*(qb2-1) + (qb2-1) 
q0 mul.b *2, qptr 
q2 sne {qtab1, @qptr 
q1 add.b qtab2, qptr 
 mov qtab3, @qptr 
qptr mov qbomb, }qz 
 sub #qstep, qptr 
 djn -3, #qtime 
 jmp decoy
 end

