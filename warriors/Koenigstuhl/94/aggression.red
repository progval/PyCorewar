;redcode-94
;name Aggression is a switch
;author M Joonas Pihlaja
;strategy q^2 -> pspaced stone, paper
;strategy  Quite vulnerable to other q^2 warriors.
;assert CORESIZE==8000
load0
z for 0
  rof

; Should I have gone with the Newt stone? RetinA paper?
; What about imps with the stone?

	org	qscan

; stone constants
SDIST	equ	1550

; paper constants
c1	equ	7085
c2	equ	1953
c3	equ	854
c4	equ	687
c5	equ	2228
PDIST	equ	3532		;525;2482;3532;2058;5880;2058



;====================
; paper + pap. boot
;====================


pboot	spl	2	,	{x2*QS		; free b-fields hold
xxx	spl	2	,	{x1*QS		; q^2 data
	spl	1	,	1
	spl	1	,	paper+10
	mov	<-1	,	{1		; boot an extra copy
	spl	load0+PDIST+10,	1
paper	spl	@0	,	{c1
	mov	}-1	,	>-1
	spl	@0	,	{c2
	mov	}-1	,	>-1
	mov	bmov	,	}c3
	mov	bdat	,	}c4
	mov	{-4	,	<1
	jmp	@0	,	>c5
bdat	dat	<2667	,	<5334
bmov	mov.i	#1	,	<1

;--
; Stealth Carbonite
;

sdat	dat	>-1	,	>1
stone	spl	#0	,	0
	mov	197	,	1-3499*197
	add.ab	{0	,	}0
	djn.f	-2	,	<-3501

z	for 9
	dat	0	,	0
	rof

;=====================================
; Q^2 with max. 2 cycle decode time.
; Accomplished by leaking table
; references.
;
;=====================================

a1	equ	3			; 23 distinct with range 29!
a2	equ	5
a3	equ	15
b1	equ	1
b2	equ	13
b3	equ	21
g	equ	2
x1	equ	9
x2	equ	19
y1	equ	17
y2	equ	10

QS	equ	(-7600/(27+g))
QI	equ	(QS/2)
qb	equ	(fnd+g*QS)	; format: (label+constant+g*QS) 

CR	equ 0;(qb-(g*QS)-fnd)	; Correction term for g scans.
				; Don't change it!
; Actually CR should be the commented bit (evaluates to 0 in this case),
; but pmars crashes when it is used. :-(

datz	equ	(tab-3)

	dat	#a1*QS	,	{b1*QS
tab	dat	#a2*QS	,	{b2*QS
	dat	#a3*QS	,	{b3*QS
	dat	yyy	,	{xxx
q3	dat	tab	,	tab
q2	add.ab	*q3	,	fnd
q1	add.b	@q3	,	@-1
q0	sne	@fnd	,	datz
	add.ab	#QI	,	fnd
	add.ba	fnd	,	fnd

	mov	qinc	,	@fnd
	mov	qinc	,	*fnd
fnd:	mov	6	,	@qb
	add.x	qinc	,	fnd
	djn	-4	,	#6
	jmp	think	,	{2333
qinc	dat	{25	,	{-13

qscan	seq	qb	,	qb+QI			; 0
	jmp	q0	,	{qb+QI/2

	; six 1 cycle scans
	seq	qb+QS*b1,	qb+QI+QS*b1		; 1
	jmp	q1	,	<q3
	seq	qb+QS*x1,	qb+QI+QS*x1		; 9
	jmp	q1	,	{q1
	seq	qb+g*QS+CR,	qb+QI+g*QS+CR		; 2
	jmp	q1	,	}q1
	seq	qb+QS*b2,	qb+QI+QS*b2		; 13
	jmp	q1	,	{qb+QI/2+QS*b2
	seq	qb+QS*x2,	qb+QI+QS*x2		; 19
	djn.b	q1	,	{q1
	seq	qb+QS*b3,	qb+QI+QS*b3		; 21
	jmp	q1	,	>q3

	; seventeen 2 cycle scans
	seq	qb+QS*(a1+b1),	qb+QI+QS*(a1+b1)	; 4
	djn.f	q2	,	q3
	seq	qb+QS*a2,	qb+QI+QS*a2		; 5
	jmp	>q1	,	{qb+QI/2+QS*a2
	seq	qb+QS*(a1+b2),	qb+QI+QS*(a1+b2)	; 16
	jmp	q2	,	{q3
	seq	qb+QS*(2*a2+g)+CR,qb+QI+QS*(2*a2+g)+CR	; 12
	jmp	q2	,	}q1
	seq	qb+QS*(a2+x2),	qb+QI+QS*(a2+x2)	; 24
	djn.b	q2	,	{q1
	seq	qb+QS*(a2+b3),	qb+QI+QS*(a2+b3)	; 26
	jmp	q2	,	>q3
	seq	qb+QS*(2*a1+g)+CR,qb+QI+QS*(2*a1+g)+CR	; 8
	djn.a	q2	,	}q1
	seq	qb+QS*(a2+b2),	qb+QI+QS*(a2+b2)	; 18
	jmp	q2	,	{qb+QI/2+QS*(a2+b2)
	seq	qb+QS*a3,	qb+QI+QS*a3		; 15
	jmp	>q1	,	}q3
	seq	qb+QS*(b2+y2),	qb+QI+QS*(b2+y2)	; 23
	djn.a	q2	,	{q2
	seq	qb+QS*y2,	qb+QI+QS*y2		; 10 
	djn.a	>q1	,	{q2
	seq	qb+QS*a1,	qb+QI+QS*a1		; 3
	jmp	>q1	,	{q3
;	seq	qb+QS*y1,	qb+QI+QS*y1		; 17
;	jmp	>q1	,	{q2
	seq	qb+QS*(a2+x1),	qb+QI+QS*(a2+x1)	; 14
	jmp	q2	,	{q1
	seq	qb+QS*(a2+b1),	qb+QI+QS*(a2+b1)	; 6
	jmp	q2	,	<q3
;	seq	qb+QS*(a3+b2),	qb+QI+QS*(a3+b2)	; 28
;	jmp	q2	,	}q3
;	seq	qb+QS*(b2+y1),	qb+QI+QS*(b2+y1)	; 30
;	jmp	q2	,	{q2

;=========================
; p-logic and stone boot
;=========================

; switch on loss, fixed state on tie

state	equ	(load0+220)			; grab some dat 0,0's in core

think	ldp	}state	,	state
	ldp.ab	state	,	@state		; Best served chilled with
	stp.a	@state	,	<state+1	; a twist of gdb.
	jmn.b	pboot	,	@state+1

sboot	mov	<src	,	<dst
	mov	<src	,	<dst
	mov	<src	,	<dst
dst	mov	sdat	,	*load0+SDIST+4
	mov	<src	,	<dst
src	spl	@dst	,	stone+4
	div.f	#y2*QS	,	dst		; a free a-field here we
						; can use as q^2 data.
yyy z	for 0
	rof

	end

