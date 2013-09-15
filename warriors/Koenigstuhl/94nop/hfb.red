;redcode-94nop verbose
;name Harmless Fluffy Bunny
;author Jens Gutzeit
;strategy qscan -> paper
;assert CORESIZE == 8000

	ORG	qGo

;;
;; boot
;;

	pAway1	EQU	4024	; 2000
	pAway2	EQU	6095	; 6000
	decoy	EQU	4000	; isn't really a decoy

boot	spl	1,	< qb1
qTab2	spl	1,	< qb2
	spl	1,	< qb3

	mov.i	{ silk1,	{ pBoot1
pBoot1	spl	pAway1,		< decoy

	mov.i	} pBoot1,	> pBoot2
pBoot2	jmp	pAway2,		pAway2

;;
;; paper
;;

	pStep1	EQU	4271
	pStep2	EQU	2307
	pStep3	EQU	3777

	iStep	EQU	4033	; 1
	x	EQU	 719	; 1340
	y	EQU	1803	; 6347

silk1	spl	@ silk1 + 8,	< pStep1
	mov.i	} silk1,	> silk1

silk2	spl	@ silk2,	{ pStep2
	mov.i	} silk2,	> silk2

silk3	spl	@ silk3,	< pStep3
	mov.i	} silk3,	> silk3

	mov.i	# iStep,	{ 1
	mov.i	x,		< y

for 18
	dat.f	0,		0
rof

empty	dat.f	0,		0
	dat.f	empty,		qa1
qTab1	dat.f	empty,		qa2

for 28
	dat.f	0,		0
rof

;;
;; quickscanner
;;

	qTab3	EQU		qBomb

	qm	EQU		160
	qM	EQU		6239	;; qM * (qm-1) = 1 mod 8000

	qa1	EQU		((qTab1-1-found)*qM+1)
	qa2	EQU		((qTab1  -found)*qM+1)

	qb1	EQU		((qTab2-1-found)*qM+1)
	qb2	EQU		((qTab2  -found)*qM+1)
	qb3	EQU		((qTab2+1-found)*qM+1)

	qc2	EQU		((qTab3  -found)*qM+1)


qBomb	dat.f	> qOffset,		> qc2

qGo	; q0 mutations

	sne.i	found+qm*qc2,		found+qm*qc2+qb2
	seq.i	< qTab3,		found+qm*(qc2-1)+qb2
	jmp	q0,			} q0

	sne.i	found+qm*qa1,		found+qm*qa1+qb2
	seq.i	< (qTab1-1),		found+qm*(qa1-1)+qb2
	djn.a	q0,			{ q0

	sne.i	found+qm*qa2,		found+qm*qa2+qb2
	seq.i	< qTab1,		found+qm*(qa2-1)+qb2
	jmp	q0,			{ q0

	;; q1 mutations

	sne.i	found+qm*qb1,		found+qm*qb1+qb1
	seq.i	< (qTab2-1),		found+qm*(qb1-1)+(qb1-1)
	jmp	q0,			{ q1

	sne.i	found+qm*qb3,		found+qm*qb3+qb3
	seq.i	< (qTab2+1),		found+qm*(qb3-1)+(qb3-1)
	jmp	q0,			} q1

	;; no mutation

	sne.i	found+qm*qb2,		found+qm*qb2+qb2
	seq	< qTab2,		found+qm*(qb2-1)+(qb2-1)
	jmp	q0,			< found+qm*qb2

	;; qm mutation

	seq.i	> found,		found+qm+(qb2-1)
	jmp	qSelect,		< found

	;; q0 mutation

	seq.i	found+(qm+1)*(qc2-1),	found+(qm+1)*(qc2-1)+(qb2-1)
	jmp	q0,			} q0

	seq.i	found+(qm+1)*(qa2-1),	found+(qm+1)*(qa2-1)+(qb2-1)
	jmp	q0,			{ q0

	seq.i	found+(qm+1)*(qa1-1),	found+(qm+1)*(qa1-1)+(qb2-1)
	djn.a	q0,			{ q0

	;; no mutation (free scan)

	jmz.f	boot,			found+(qm+1)*(qb2-1)+(qb2-1)

;; decoder

q0	mul.b	* q1,		found
qSelect	sne	{ qTab1,	@ found
q1	add.b	qTab2,		found

;; bombing engine VI

	qOffset	EQU	-86
	qTimes	EQU	19	   ; number of bombs to throw
	qStep	EQU	-7	   ; distance between bombs

throw	mov.i	qTab3,		@ found
found	mov.i	qBomb,		} qm
	sub	# qStep,	found
	djn	throw,		# qTimes

	jmp	boot,		< decoy		   ; start paper

	END

