;redcode-94nop
;name PerfectTimev3.4
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy stone/paper
; entered 94nop
; lived for almost 20 successfull challenges
; in the lower half of the hill

ps2 equ 4273
bs1 equ 3359
bs2 equ 6217
bs3 equ 5989
pend equ pbomb
numproc equ 6
dc equ boot-152
pbdist equ 1520
sstep equ 3481
ini equ sstep+1
sbdist equ 4190

;sbdist
;4152

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
boot spl 1, >dc
 mov.i -1, 0
 spl 1, >dc
 mov <go1, {go1
go1 spl sbomb+2+sbdist, sbomb+2
 spl stone+sbdist, 0
 mov <go2, {go2
go2 jmn.a pbdist+pend+1, pend+1
 for 5
 dat 0, 0
 rof
p2 spl ps2, {cpy
 mov }cpy, }p2
 mov pbomb, >bs2
cpy mov p2+numproc, }p2
 jmz.f p2, *cpy
pbomb dat <2667, <5334
 dat 0, 0
 for 4
 dat 0, 0
 rof
tgt equ 2
time equ 2300
hop equ 6567
step equ 2*hop
stone   spl 0, 0
 mov sbomb, @2
 add #step, @-1
 djn.a @-1, *stone+(tgt-hop)-(step*time)+1
sbomb dat >hop, >1
 dat 0, 0
 for 5
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

