;redcode-94nop
;name Kaiten
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy stone/imp
; several versions were on the hill - a and b field imps,
; different boot values, etc.
; this was the last one - it lived up to the age of 22 at 94nop
; it never did really well on the hillm but it was fierce against
; all oneshots and most of the other scanners, as well
; the stone doesn't have a djn stream, but bombs with dat >1, }1
; which increases its score against djn warriors
; of course, because of the fact that it does the final clear with this
; bomb,
; it is unable to kill heavy imps ... but it's one of my favorite ;warriors
; and I think it's also one of the best stone/imps at the moment
; at the time when it fell off the hill, it was very hard for stone/imps 
; to survive
; there were few of the at the hill, and all scored badly... even Black
; Knight is 19th
; at the moment when I'm writing this note
; ... it's still alive at 94 hill, though. It was 10th at some point, 
; which is not bad for a nop warrior


istep equ 2667
ibdist equ 4257
sbdist equ 2358
ioff equ 1318

sstep equ 3481
ini equ sstep+1
dc equ -223

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
qstep equ -7
qtime equ 13

 org qgo
boot mov imp, imp+ibdist+ioff
 mov <ilok, {ilok
 spl 1, >dc
 mov -1, 0
 mov <ilok, {ilok
 spl 1, >dc-1
 mov <swhat, {slok
slok djn.b sbomb+1+sbdist, #5
ilok jmp imp+ibdist, imp
pump spl #imp+ioff, #imp+1+ioff
 sub.f #-istep-1, leap
 mov imp+ioff, }pump
leap jmp ((imp-2*(istep+1))+ioff), >((imp+2*istep)-1+ioff)
imp mov.i #1, 2667
stone spl #2*sstep, >2*sstep
 mov.i sbomb, *shoot
incr add.f stone, @-1
shoot mov.i ini, ini+sstep
 jmp -3, >-30
sbomb dat >1, }1
swhat dat 0, 0
 for 26
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

