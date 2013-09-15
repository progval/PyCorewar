;redcode-94nop
;name Yet Another Paper III
;author Jens Gutzeit
;strategy q^3 -> paper
;assert CORESIZE == 8000

	ORG	qGo

	pStep1	EQU	3913
	pStep2	EQU	3035

boot	spl	1
	spl	1

silk1	spl	@ silk1,	< pStep1
	mov.i	} silk1,	> silk1

	mov.i	{ silk1,	< silk2
silk2	djn.f	@ silk2,	< pStep2

;;
;; quickscanner
;;

	start	EQU	boot	; first instruction of this warrior
	qStep	EQU	5400	; distance between two scans
	qHop	EQU	1300	; scan distance within a scan

for 42
	dat.f	0,		0
rof

;; decoding table

	dat.f	15,		10	; A, D
qTab	dat.f	 7,		 4	; B, E
	dat.f	13,		11	; C, F

qGo	seq	found+1*qStep,		found+1*qStep+qHop  ; 1
	jmp	qSelect,		< found+1*qStep+qHop/2

	seq	found+3*qStep,		found+3*qStep+qHop  ; E-1
	jmp	> attack1,		< qTab

	seq	found+4*qStep,		found+4*qStep+qHop  ; E
	jmp	> attack1,		< found+4*qStep+qHop/2

	seq	found+5*qStep,		found+5*qStep+qHop  ; E+1
	jmp	> attack1,		> qTab

	seq	found+6*qStep,		found+6*qStep+qHop  ; B-1
	jmp	attack1,		{ qTab

	seq	found+7*qStep,		found+7*qStep+qHop  ; B
	jmp	attack1,		< found+7*qStep+qHop/2

	seq	found+8*qStep,		found+8*qStep+qHop  ; B+1
	jmp	attack1,		} qTab

	seq	found+9*qStep,		found+9*qStep+qHop  ; D-1
	djn.b	> attack1,		{ attack2

	seq	found+10*qStep,		found+10*qStep+qHop ; D
	jmp	> attack1,		{ attack2

	seq	found+11*qStep,		found+11*qStep+qHop ; F
	jmp	> attack1,		} attack2

	seq	found+13*qStep,		found+13*qStep+qHop ; C
	jmp	attack1,		} attack1

	seq	found+14*qStep,		found+14*qStep+qHop ; A-1
	djn.a	attack1,		{ attack1

	seq	found+15*qStep,		found+15*qStep+qHop ; A
	jmp	attack1,		{ attack1

	seq	found+18*qStep,		found+18*qStep+qHop ; B*E+1-B-E
	djn.f	attack2,		qTab

	seq	found+21*qStep,		found+21*qStep+qHop ; B*E-B
	jmp	attack2,		< qTab

	seq	found+24*qStep,		found+24*qStep+qHop ; B*E-E
	jmp	attack2,		{ qTab

	seq	found+32*qStep,		found+32*qStep+qHop ; B*E+E
	jmp	attack2,		} qTab

;; free scan + boot paper, if found nothing

	sne	found+28*qStep,		found+28*qStep+qHop	; B*E
	jmz	boot,			found+28*qStep+qHop-12

;; decoder

attack2 mul.b	qTab,		found
attack1	mul.ab	qTab,		@ attack2

;; choose between the two possible positions

qSelect	sne.i	(start - 1),	@ found	; use 1st position?
	add.ab	# qHop,		found   ; no, use 2nd!

;; prepare bombing

adjust	add.ba	found,		found

;; bombing engine IV

	qTimes	EQU	20	   ; number of bombs to throw
	qStep2	EQU	4	   ; distance between bombs

throw	mov.i	qBomb,		@ found
	mov.i	qBomb,		* found
found	mov.i	-qStep2,	@ qStep
	add.f	qIncr,		found
	djn.b	throw,		# 20

	jmp	boot,		< 4000		   ; start paper

qBomb	dat.f	# 0,		# qStep2
qIncr	dat.f	# -qStep2,	# 2*qStep2

	END

