;redcode-lp
;name Rottinger II
;author G.Labarga
;assert CORESIZE==8000 && MAXPROCESSES==8
;strategy Qscan->paper/stone

pdist equ 4215
pinit equ 5172
bstep1 equ 1171
bstep2 equ 826
decrem equ 2903
blank2 equ (6074 %33)

zero    equ qbomb
qtab3   equ qbomb

src:	mov.ab #9,#9
v1:	add.a #pdist,dst
loop:	mov.i <src,{dst
	mov.i {bstep1,{bstep2
	add.f {0,}0
	jmn.b loop,src
	spl @src,>decrem
dst:	jmz.b pinit,*0
	dat }1,>1

for 85
	dat 0,0
rof

qbomb   dat     >qoff,          {qc2
        dat     0,              0

        dat     0,              <qb1
qtab2   dat     0,              <qb2
        dat     0,              <qb3

        for     16
        dat     0,              0
        rof

        dat     zero - 1,       qa1
qtab1   dat     zero - 1,       qa2

for blank2	;42
	dat 0,0
rof
src2:	mov.ab #9,#9
v2:	add.a #pdist,dst2
loop2:	mov.i <src2,{dst2
	mov.i {bstep1,{bstep2
	add.f {0,}0
	jmn.b loop2,src2
	spl @src2,>decrem
dst2:	jmz.b pinit,*0
	dat }1,>1
for 33-blank2	;42
	dat 0,0
rof

qc2 equ ((1 + (qtab3-qptr)*qy) % CORESIZE)
qb1 equ ((1 + (qtab2-1-qptr)*qy) % CORESIZE)
qb2 equ ((1 + (qtab2-qptr)*qy) % CORESIZE)
qb3 equ ((1 + (qtab2+1-qptr)*qy) % CORESIZE)
qa1 equ ((1 + (qtab1-1-qptr)*qy) % CORESIZE)
qa2 equ ((1 + (qtab1-qptr)*qy) % CORESIZE)
qz equ 2108
qy equ 243
qgo:	sne qptr + qz*qc2, qptr + qz*qc2 + qb2
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
	jmz.f lch, qptr + (qz+1)*(qb2-1) + (qb2-1)
qoff equ -87-14
qstep equ -7
qtime equ 10 ;4
q0:	mul.b *2, qptr
q2:	sne {qtab1, @qptr
q1:	add.b qtab2, qptr
	mov qtab3, @qptr
qptr:	mov qbomb, }qz
	sub #qstep, qptr
	djn -3, #qtime
lch:	spl loop,{0
	jmp loop2,{0
end qgo

