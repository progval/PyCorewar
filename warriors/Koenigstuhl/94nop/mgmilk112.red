;redcode-94nop
;name Mk I Military Grade Milk
;version 1.1.2
;author Jens Gutzeit
;strategy MiniQ^3 -> paper
;assert CORESIZE == 8000

	ORG qGo

;; decoy positions

	decoy0	EQU	2794
	decoy1	EQU	5180
	decoy2	EQU	3244
	decoy3	EQU	2256
	decoy4	EQU	976

;; MiniQ^3 constants

   	qf 	EQU 	qKil
     	qs 	EQU 	(qd*2)
     	qd 	EQU 	107
     	qi 	EQU 	7
     	qr 	EQU	11

	A	EQU	10
	B	EQU	6
	C	EQU	3

;; paper 1 constants

	pAway1	EQU	6286
	pAway2	EQU	4547

	pStep1	EQU	2341
	pStep2	EQU	2421
	pStep3	EQU	3241

	bStep	EQU	3302

;; paper 2 constants

	pAway3	EQU	6628
	pAway4	EQU	3901

	pStep4	EQU	2430
	pStep5	EQU	2308

;; boot

boot	spl	1,		< decoy0
	spl	1,		> decoy0
	spl	pCopy3,		{ decoy0
	spl	pCopy4,		} decoy0
	spl	1,		< decoy0
	spl	pCopy2,		> decoy0

;;
;; paper 1 copy rountines
;;

pCopy1	mov.i	{ pCount1,	{ 1
	djn.f	pAway1,		< decoy1

pCopy2	mov.i	< pCount1,	{ 1
	djn.f	pAway2,		< decoy2


;;
;; paper 1
;;

silk1	spl	@ silk1,	< pStep1
	mov.i	} silk1,	> silk1

silk2	spl	@ silk2,	< pStep2
	mov.i	} silk2,	> silk2

	mov.i	# 1,		< 1
	mov.i	{ -bStep,	< bStep

	mov.i	{ silk2,	< silk3
silk3	djn.f	@ silk3,	} pStep3

pCount1	dat.f	silk3 + 1,	 silk3 + 1	; paper 1 copy counters

for 15
	dat.f	0,		0
rof

;;
;; MiniQ^3 (Core Warrior 75/73)
;;

qGo	seq   	qd+qf+qs,    	qf+qs      	; 1
     	jmp   	qSki,        	{ qd+qf+qs+qi
     	seq   	qd+qf+6*qs,  	qf+6*qs    	; B
     	jmp   	qFas,        	{ qd+qf+6*qs+qi
     	seq   	qd+qf+5*qs,  	qf+5*qs    	; B-1
     	jmp   	qFas,        	< qBmb
     	seq   	qd+qf+7*qs,  	qf+7*qs    	; B+1
     	jmp   	qFas,        	> qBmb
     	seq   	qd+qf+9*qs,  	qf+9*qs    	; A-1
     	djn   	qFas,        	{ qFas
     	seq   	qd+qf+10*qs, 	qf+10*qs   	; A
     	jmp   	qFas,        	{ qFas

     	seq   	qd+qf+3*qs,  	qf+3*qs    	; C
     	jmp   	> qFas,       	{ qd+qf+3*qs+qi
     	seq   	qd+qf+2*qs,  	qf+2*qs    	; C-1
     	jmp   	> qFas,       	{ qSlo
     	seq   	qd+qf+4*qs,  	qf+4*qs    	; C+1
     	jmp   	> qFas,       	} qSlo
     	seq   	qd+qf+12*qs, 	qf+12*qs   	; B*C-B
     	jmp   	qSlo,        	{ qSlo
     	seq   	qd+qf+15*qs, 	qf+15*qs   	; B*C-C
     	jmp   	qSlo,        	< qBmb
    	seq   	qd+qf+21*qs, 	qf+21*qs   	; B*C+C
     	jmp   	qSlo,        	> qBmb
     	seq   	qd+qf+24*qs, 	qf+24*qs   	; B*C+B
     	jmp   	qSlo,        	} qSlo
     	seq   	qd+qf+27*qs, 	qf+27*qs   	; A*C-C
     	djn   	qSlo,        	{ qFas
     	seq   	qd+qf+30*qs, 	qf+30*qs   	; A*C
     	jmp   	qSlo,        	{ qFas
     	sne   	qd+qf+18*qs, 	qf+18*qs   	; B*C
     	jmz.f 	boot,         	qd+qf+18*qs-10

qSlo	mul.ab 	# C,         	qKil
qFas	mul.b 	qBmb,        	@ qSlo
qSki	sne   	> 3456,       	@ qKil
     	add   	# qd,         	qKil
qLoo	mov   	qBmb,        	@ qKil
qKil	mov   	qBmb,        	* qs
     	sub   	# qi,         	qKil
     	djn   	qLoo,        	# qr
     	jmp   	boot,         	> A
qBmb	dat   	{ qi*qr-10,   	{ B

for 15
	dat.f	0,		0
rof

pCount2	dat.f	silk5 + 1,	silk5 + 1	; paper 2 copy counters

;;
;; paper 2 copy rountines
;;

pCopy3	mov.i	{ pCount2,	{ 1
	djn.f	pAway3,		< decoy3

pCopy4	mov.i	< pCount2,	{ 1
	djn.f	pAway4,		< decoy4

;;
;; paper 2
;;

silk4	spl	@ silk4,	< pStep4
	mov.i	} silk4,	> silk4

	mov.i	{ silk4,	< silk5
silk5	djn.f	@ silk5,	< pStep5

	END

