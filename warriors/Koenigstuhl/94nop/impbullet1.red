;redcode-94nop
;name ImpBulletv1
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy qscan into stone+impbullet

;**********constants***********
step equ 3039
bdist equ 3600
bdist1 equ 4350
istep equ 2667
zero equ qbomb 
qtab3 equ qbomb
qc2 equ ((1 + (qtab3-qptr)*qy) % CORESIZE) 
qb1 equ ((1 + (qtab2-1-qptr)*qy) % CORESIZE) 
qb2 equ ((1 + (qtab2-qptr)*qy) % CORESIZE) 
qb3 equ ((1 + (qtab2+1-qptr)*qy) % CORESIZE) 
qa1 equ ((1 + (qtab1-1-qptr)*qy) % CORESIZE) 
qa2 equ ((1 + (qtab1-qptr)*qy) % CORESIZE) 
qz equ 2108 
qy equ 243
qoff equ -87 
qstep equ -5 
qtime equ 18 

 org qgo
qbomb   dat >qoff, >qc2
poc mov stone, stone+bdist1
 mov stone+1, stone+1+bdist1
 mov stone+2, stone+2+bdist1
 mov stone+3, stone+3+bdist1
        spl 1, <qb1
qtab2   mov.i -1, #qb2
 spl 1, {qb3
        spl 1, <-896
 mov {lok, <lok
 spl stone+bdist1, <-1453
 jmp @lok, <-3151
stone spl #-step, #step
 mov.i }0, 0  
 add.f -2, -1
 djn.f -2, @-2
 for 10
 dat 0, 0
 rof
pap spl @0, }3439
 mov }-1, >-1
 spl 2437, 0
 mov >-1, }-1
 spl @0, >1243
 mov }-1, >-1
 spl 2, <-523
 djn.f imp, {pap-1
 add.x imp, -1
 mov pap-1, {-322
 djn.f -1, {-333
imp mov.i #-1, istep
lok dat 0, bdist
 for 20
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
 jmz.f poc, qptr + (qz+1)*(qb2-1) + (qb2-1) 
q0 mul.b *2, qptr 
q2 sne {qtab1, @qptr 
q1 add.b qtab2, qptr 
 mov qtab3, @qptr 
qptr mov qbomb, }qz 
 sub #qstep, qptr 
 djn -3, #qtime 
 jmp poc 
 end

