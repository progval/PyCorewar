;redcode-94nop
;name Netpaper 1.07
;author David Houston
;strategy Q^4.5
;strategy boot
;strategy Paper carrying mov/mov/add bomber
;strategy Vortex launched imps
;assert CORESIZE == 8000

org	qgo

zero	i for	0
	rof

;-----------------------------------------------------
qtab3	equ	qbomb
qbomb	dat	>qoff, >qc2

;-----------------------------------------------------
; Vortex imps

imessa	equ	6028
imessb	equ	2102
istep	equ	2667
imessc	equ	7213

impl	spl	#0, <imessa
	add.x	imp, 1
	djn.f	imp - istep * 10, <imessb
	dat	0, 0
imp	mov.i	#imessc, istep

;-----------------------------------------------------
; Boot

bidist	equ	1057
bpdist	equ	525

boot	spl	2, <qb1
qtab2	spl	2, <qb2
	spl	1, <qb3
	mov	<biptr, {biptr
	spl	1
	mov	<bpptr, {bpptr
bpptr	spl	zero + bpdist + 10, pap1 + 10
biptr	jmp	zero + bidist + 5, impl + 5

;-----------------------------------------------------
; Netpaper!

poff1	equ	101
poff2	equ	1040
poff3	equ	3392

pkill	equ	7694
phop	equ	1861
pstep	equ	387

pap1	spl	@0, {poff1
	mov	}pap1, >pap1
pap2	spl	@0, <poff2
	mov	}pap2, >pap2
	mov	bomb, >pkill
	mov	bomb, <-1 + poff2
	add	#pstep, -2 + 2*poff2
	mov	{pap2, <pap3
pap3	djn.f	@0, >poff3
bomb	dat	>2667, >phop
	dat	-100, <qa1
qtab1	dat	-100, <qa2

;-----------------------------------------------------
; Blank space

	for	39
	dat	0, 0
	rof

;-----------------------------------------------------
;Q^5 scan

qc2	equ	((1 + (qtab3-qptr)*qy) % CORESIZE)
qb1	equ	((1 + (qtab2-1-qptr)*qy) % CORESIZE)
qb2	equ	((1 + (qtab2-qptr)*qy) % CORESIZE)
qb3	equ	((1 + (qtab2+1-qptr)*qy) % CORESIZE)
qa1	equ	((1 + (qtab1-1-qptr)*qy) % CORESIZE)
qa2	equ	((1 + (qtab1-qptr)*qy) % CORESIZE)
qz	equ	5038
qy	equ	7973
; qy * (qz-1) = 1

;q0 mutation
qgo	sne	qptr + qz*qc2, qptr + qz*qc2 + qb2
	seq	<qtab3, qptr + qz*(qc2-1) + qb2
	jmp	q0, }q0
	sne	qptr + qz*qa2, qptr + qz*qa2 + qb2
	seq	<qtab1, qptr + qz*(qa2-1) + qb2
	jmp	q0, {q0
	sne	qptr + qz*qa1, qptr + qz*qa1 + qb2
	seq	<(qtab1-1), qptr + qz*(qa1-1) + qb2
	djn.a	q0, {q0
;q1 mutation
	sne	qptr + qz*qb3, qptr + qz*qb3 + qb3
	seq	<(qtab2+1), qptr + qz*(qb3-1) + (qb3-1)
	jmp	q0, }q1
	sne	qptr + qz*qb1, qptr + qz*qb1 + qb1
	seq	<(qtab2-1), qptr + qz*(qb1-1) + (qb1-1)
	jmp	q0, {q1
;no mutation
	sne	qptr + qz*qb2, qptr + qz*qb2 + qb2
	seq	<qtab2, qptr + qz*(qb2-1) + (qb2-1)
	jmp	q0
;qz mutation
	seq	>qptr, qptr + qz + (qb2-1)
	jmp	q2, <qptr
;q0 mutation
	seq	qptr + (qz+1)*(qc2-1), qptr + (qz+1)*(qc2-1) + (qb2-1)
	jmp	q0, }q0
	seq	qptr + (qz+1)*(qa2-1), qptr + (qz+1)*(qa2-1) + (qb2-1)
	jmp	q0, {q0
	seq	qptr + (qz+1)*(qa1-1), qptr + (qz+1)*(qa1-1) + (qb2-1)
	djn.a	q0, {q0
;no mutation
	jmz.f	boot, qptr + (qz+1)*(qb2-1) + (qb2-1)

qoff	equ	-87
qstep	equ	-7
qtime	equ	14

q0	mul.b	*2, qptr
q2	sne	{qtab1, @qptr
q1	add.b	qtab2, qptr
	mov	qtab3, @qptr
qptr	mov	qbomb, }qz
	sub	#qstep, qptr
	djn	-3, #qtime
	jmp	boot

end

