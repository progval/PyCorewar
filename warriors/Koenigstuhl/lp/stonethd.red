;redcode-lp
;name Stone Throwing Devils
;author Ben Ford
;strategy q^3 -> lp stone/imp
;strategy 2 processes in stone, 6 in imp
;assert CORESIZE==8000 && MAXPROCESSES==8

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

for	50
	dat	$   0,	$   0
rof

	dat	<15,	<10	; A,D
qtab	dat	<7,	<4	; B,E
	dat	<13,	<11	; C,F
qbmb	dat	<76,	<1

qf	equ	qptr
qs	equ	-100
qd	equ	4000
qi	equ	9
qr	equ	12

;    -+)>] 0/1 cycles [(<+-

qscan	seq	qd+qf+qs,	qf+qs      ; 1
	jmp	qSki,	{qd+qf+qs+qi
	seq	qd+qf+8*qs,	qf+8*qs    ; B+1
	jmp	qfast,	}qtab
	seq	qd+qf+13*qs,	qf+13*qs   ; C
	jmp	qfast,	}qfast
	seq	qd+qf+6*qs,	qf+6*qs    ; B-1
	jmp	qfast,	{qtab
	seq	qd+qf+14*qs,	qf+14*qs   ; A-1
	djn.a	qfast,	{qfast
	seq	qd+qf+15*qs,	qf+15*qs   ; A
	jmp	qfast,	{qfast
	seq	qd+qf+7*qs,	qf+7*qs    ; B
	jmp	qfast,	{qd+qf+7*qs+qi

;    -+>)] 2 cycles [(<+-

	seq	qd+qf+4*qs,	qf+4*qs    ; E
	jmp	>qfast,	{qd+qf+4*qs+qi
	seq	qd+qf+77*qs,	qf+77*qs   ; B*F
	jmp	qslow,	}qslow
	seq	qd+qf+70*qs,	qf+70*qs   ; B*D
	jmp	qslow,	{qslow
	seq	qd+qf+5*qs,	qf+5*qs    ; E+1
	jmp	>qfast,	>qtab
	seq	qd+qf+63*qs,	qf+63*qs   ; B*(D-1)
	djn.b	qslow,	{qslow
	seq	qd+qf+3*qs,	qf+3*qs    ; E-1
	jmp	>qfast,	<qtab
	seq	qd+qf+56*qs,	qf+56*qs   ; (A-1)*E
	djn.a	qslow,	{qfast
	seq	qd+qf+39*qs,	qf+39*qs   ; C*(E-1)
	djn.b	qslow,	}qfast
	seq	qd+qf+24*qs,	qf+24*qs   ; (B-1)*E
	jmp	qslow,	{qtab
	seq	qd+qf+35*qs,	qf+35*qs   ; B*(E+1)
	jmp	qslow,	>qtab
	seq	qd+qf+60*qs,	qf+60*qs   ; A*E
	jmp	qslow,	{qfast
	seq	qd+qf+21*qs,	qf+21*qs   ; B*(E-1)
	jmp	qslow,	<qtab
	seq	qd+qf+11*qs,	qf+11*qs   ; F
	jmp	>qfast,	}qslow
	seq	qd+qf+32*qs,	qf+32*qs   ; (B+1)*E
	jmp	qslow,	}qtab
	seq	qd+qf+10*qs,	qf+10*qs   ; D
	jmp	>qfast,	{qslow
	seq	qd+qf+66*qs,	qf+66*qs   ; (B-1)*F
	djn.a	qslow,	}qslow
	seq	qd+qf+52*qs,	qf+52*qs   ; C*E
	jmp	qslow,	}qfast
	seq	qd+qf+18*qs,	qf+18*qs   ; (B-1)*(E-1)
	djn.f	qslow,	qtab
	seq	qd+qf+9*qs,	qf+9*qs    ; D-1
	djn.b	>qfast,	{qslow
	sne	qd+qf+28*qs,	qf+28*qs   ; B*E
	jmz	*qend,	qd+qf+28*qs-10

; ***** Q-SCAN BOMBER *****

qslow	mul.b	qtab,	qptr	; decode
qfast	mul.ab	qtab,	@qslow
qSki	sne	>3456,	@qptr
	add	#qd,	qptr
qloop	mov	qbmb,	@qptr	; .5c negative bomber
qptr	mov	qbmb,	*qs
	sub	#qi,	qptr
	djn	qloop,	#qr
qend	jmp	boot,	<1234

for	MAXLENGTH-1-CURLINE
	dat	$   0,	$   0
rof

imp	mov.i	#iHOP,	*   0

end	qscan

