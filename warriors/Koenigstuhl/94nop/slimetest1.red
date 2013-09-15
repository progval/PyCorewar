;redcode-94nop
;name slime test 1.00
;author David Houston
;strategy paper
;assert CORESIZE == 8000

org	qgo

zero	i for	0
	rof

;-----------------------------------------------------
; The q-bomb

qtab3
qbomb	dat	>qoff, >qc2

;-----------------------------------------------------
; The boot

bpoff	equ	1715

boot	spl	2
	spl	2, qb1
qtab2	spl	1, qb2
	spl	1, qb3
	mov	<bptr, {bptr
bptr	jmp	bpoff + 10, pap1 + 10

	dat	-50, qa1
qtab1	dat	-50, qa2

;-----------------------------------------------------
; The slime

poff1	equ	7488
poff2	equ	2408
poff3	equ	3671
pkill1	equ	4477
pkill2	equ	5908
phop	equ	5334

pap1	spl	@0, poff1
	mov	}pap1, >pap1
pap2	spl	@0, poff2
	mov	}pap2, >pap2
	mov.i	#1, {1
	mov.i	#pkill1, <1
	mov	bomb, <pkill2
	mov	{pap2, <pap3
pap3	jmp	@0, >poff3
bomb	dat	<2667, <phop

;-----------------------------------------------------
; Q^4.5 scan

qa1	equ	((1 + (qtab1-1-qptr)*qy) % CORESIZE)
qa2	equ	((1 + (qtab1-qptr)*qy) % CORESIZE)
qb1	equ	((1 + (qtab2-1-qptr)*qy) % CORESIZE)
qb2	equ	((1 + (qtab2-qptr)*qy) % CORESIZE)
qb3	equ	((1 + (qtab2+1-qptr)*qy) % CORESIZE)
qc2	equ	((1 + (qtab3-qptr)*qy) % CORESIZE)
qz	equ	1708
qy	equ	3843
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

qoff	equ	-87;-97
qstep	equ	-7;-5
qtime	equ	14;26

q0	mul.b	*2, qptr
q2	sne	*qtab1, @qptr
q1	add.b	qtab2, qptr
	mov	qtab3, @qptr
qptr	mov	qbomb, }qz
	sub	#qstep, qptr
	djn	-3, #qtime
bpsrc	jmp	boot

end

