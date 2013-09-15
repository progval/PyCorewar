;redcode-94nop
;name Yet Another Paper V
;author Jens Gutzeit
;strategy qscan -> paper
;assert CORESIZE == 8000

	ORG	qGo

;; boot constants (not optimized)

	pAway1	EQU	2000
	pAway2	EQU	6000
	decoy	EQU	4000

;; paper constants

	pStep1	EQU	3913
	pStep2	EQU	3035

;; quickscanner constants

	qTab2	EQU		boot
	qTab3	EQU		qBomb

	qm	EQU		160
	qM	EQU		6239	;; qM * (qm-1) = 1 mod 8000

	qa1	EQU		((qTab1-1-found)*qM+1)
	qa2	EQU		((qTab1  -found)*qM+1)

	qb1	EQU		((qTab2-1-found)*qM+1)
	qb2	EQU		((qTab2  -found)*qM+1)
	qb3	EQU		((qTab2+1-found)*qM+1)
	
	qc2	EQU		((qTab3  -found)*qM+1)

;;
;; boot
;;

	dat.f	0,		< qb1
boot	spl	1,		< qb2		; qTab2
	spl	1,		< qb3

;; make two copies of the paper

;; use maybe pppc-boot?

	mov.i	{ silk1,	{ pBoot1
pBoot1	spl	pAway1,		< decoy

	mov.i	} pBoot1,	> pBoot2
pBoot2	spl	pAway2,		pAway2

;; paper

silk1	spl	@ silk1 + 4,	< pStep1
	mov.i	} silk1,	> silk1

	mov.i	{ silk1,	< silk2
silk2	djn.f	@ silk2,	< pStep2

for 22
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

	jmp	boot,		< 4000		   ; start paper

	END

