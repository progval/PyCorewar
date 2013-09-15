;redcode-lp
;name Switchblade
;author Ben Ford
;strategy q^3 -> pspace -> stone/imp or scanner
;assert CORESIZE==8000 && MAXPROCESSES==8

STEP	equ	214
INIT	equ	(sbmb+STEP)
sdat	equ	(sptr-1)

sptr	jmp	#STEP,	#INIT
sadd	add.ab	{   0,	}   0	; invisible
scan	jmz.f	 sadd,	@sptr
sbmb	mov	@   0,	@sptr
schk	jmz.a	 sadd,	 sbmb
	spl	#   0,	    0	; invisible
	mov	 sdat,	<schk

for	100-CURLINE
	dat	$   0,	$   0
rof

qslo	mul.b	 qtab,	 qptr	; decode
qfas	mul.ab	 qtab,	@qslo
qfnd	sne	>3456,	@qptr
	add	#  qd,	 qptr
qhop	mov	 qbmb,	@qptr	; .5c negative bomber
qptr	mov	 qbmb,	@  qs
	sub	#  qi,	 qptr
	djn	 qhop,	#  qr
	jmp	 brain,	<1234

qf	equ	qptr
qs	equ	100
qd	equ	4000
qi	equ	7
qr	equ	11
qo	equ	(qi*qr-10)

	spl	#  14,	<  10	; A,D
qtab	spl	#   7,	<   4	; B,E
qbmb	dat	#  19,	{  qo	; C

qscan	seq	qd+qf+14*qs,	qf+14*qs   ; A
	jmp	qfas,	{qfas
	seq	qd+qf+35*qs,	qf+35*qs   ; B*(E+1)
	jmp	qslo,	>qtab
	seq	qd+qf+52*qs,	qf+52*qs   ; (A-1)*E
	djn.a	qslo,	{qfas
	seq	qd+qf+70*qs,	qf+70*qs   ; B*D
	jmp	qslo,	{qslo
	seq	qd+qf+9*qs,	qf+9*qs    ; D-1
	djn.b	>qfas,	{qslo
	seq	qd+qf+24*qs,	qf+24*qs   ; (B-1)*E
	jmp	qslo,	{qtab
	seq	qd+qf+7*qs,	qf+7*qs    ; B
	jmp	qfas,	{qd+qf+7*qs+qi
	seq	qd+qf+21*qs,	qf+21*qs   ; B*(E-1)
	jmp	qslo,	<qtab
	seq	qd+qf+5*qs,	qf+5*qs    ; E+1
	jmp	>qfas,	>qtab
	seq	qd+qf+18*qs,	qf+18*qs   ; (B-1)*(E-1)
	djn.f	qslo,	qtab
	seq	qd+qf+3*qs,	qf+3*qs    ; E-1
	jmp	>qfas,	<qtab
	seq	qd+qf+56*qs,	qf+56*qs   ; A*E
	jmp	qslo,	{qfas
	seq	qd+qf+76*qs,	qf+76*qs   ; C*E
	jmp	qslo,	}qfas
	seq	qd+qf+13*qs,	qf+13*qs   ; A-1
	djn.a	qfas,	{qfas
	seq	qd+qf+32*qs,	qf+32*qs   ; (B+1)*E
	jmp	qslo,	}qtab
	seq	qd+qf+10*qs,	qf+10*qs   ; D
	jmp	>qfas,	{qslo
	seq	qd+qf+28*qs,	qf+28*qs   ; B*E
	jmp	qslo,	{qd+qf+28*qs+qi
	seq	qd+qf+8*qs,	qf+8*qs    ; B+1
	jmp	qfas,	}qtab
	seq	qd+qf+63*qs,	qf+63*qs   ; B*(D-1)
	djn.b	qslo,	{qslo
	seq	qd+qf+6*qs,	qf+6*qs    ; B-1
	jmp	qfas,	{qtab
	seq	qd+qf+19*qs,	qf+19*qs   ; C
	jmp	qfas,	}qfas
	seq	qd+qf+4*qs,	qf+4*qs    ; E
	jmp	>qfas,	{qd+qf+4*qs+qi
	seq	qd+qf+57*qs,	qf+57*qs   ; C*(E-1)
	djn.b	qslo,	}qfas
	seq	qd+qf+1*qs,	qf+qs      ; 1
	jmp	qfnd,	{qd+qf+qs+qi

mode	equ	(brain-250)

brain	ldp	}mode,	 mode
	ldp.ab	 mode,	@mode
	stp.a	@mode,	<mode+1
	jmz.b	 scan,	@mode+1

iHOP	equ	2667
ddst	equ	(imp+2500)

boot	mov	 djmp,	{vect
	mov	 dadd,	{vect
	mov	 dmov,	{vect
	spl	    1,	    1
	spl	    1,	    1
	spl	    2,	<4000
	jmp	*vect,	}   0
	jmp	@vect,	}   0

vect	div.f	#ddst+3,	#ddst+2
	div.f	#imp+iHOP*0,	#imp+iHOP*1
	div.f	#imp+iHOP*2,	#imp+iHOP*3
	div.f	#imp+iHOP*4,	#imp+iHOP*5

dmov	mov	>7968,	 2727
dadd	add.f	 djmp,	 dmov
djmp	jmp	 dmov,	<2726

for	MAXLENGTH-1-CURLINE
	dat	$   0,	$   0
rof

imp	mov.i	#iHOP,	*   0

end	qscan

