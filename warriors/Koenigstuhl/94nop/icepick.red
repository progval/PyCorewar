;redcode-94 test
;name Icepick
;author Ben Ford
;assert (CORESIZE==8000)
;strategy q^3 -> stone/imp

; ----- continuous imp launcher -----

iHOP	equ	((CORESIZE+1)/3)
iINC	equ	(iHOP+1)
iOFF	equ	629
iJMP	equ	(pump-iINC+iOFF)

pump	spl	#   1,	>spin
spin	mov.i     imp,	 iOFF-4
	add.f   #iINC,	 iptr
iptr	jmp      iJMP,	>7800
	dat	$   0,	$   0
imp	mov.i	#iHOP,	*   0

for	16
	dat	$   0,	$   0
rof

; ----- q^3 quickscan -----

qf	equ	qptr
qs	equ	100
qd	equ	4000
qi	equ	7
qr	equ	11
qo	equ	(qi*qr-10)

	spl	#  14,	<  10	; A,D
qtab	spl	#   7,	<   4	; B,E
qbmb	dat	#  19,	{  qo	; C

qslo	mul.b	 qtab,	 qptr	; decode
qfas	mul.ab	 qtab,	@qslo
qfnd	sne	>3456,	@qptr
	add	#  qd,	 qptr
qhop	mov	 qbmb,	@qptr	; .5c negative bomber
qptr	mov	 qbmb,	@  qs
	sub	#  qi,	 qptr
	djn	 qhop,	#  qr
	jmp	 boot,	<1234

qscan	seq	qd+qf+1*qs,	qf+qs      ; 1
	jmp	qfnd,	{qd+qf+qs+qi
	seq	qd+qf+7*qs,	qf+7*qs    ; B
	jmp	qfas,	{qd+qf+7*qs+qi
	seq	qd+qf+6*qs,	qf+6*qs    ; B-1
	jmp	qfas,	{qtab
	seq	qd+qf+8*qs,	qf+8*qs    ; B+1
	jmp	qfas,	}qtab
	seq	qd+qf+19*qs,	qf+19*qs   ; C
	jmp	qfas,	}qfas
	seq	qd+qf+13*qs,	qf+13*qs   ; A-1
	djn.a	qfas,	{qfas
	seq	qd+qf+14*qs,	qf+14*qs   ; A
	jmp	qfas,	{qfas

	seq	qd+qf+4*qs,	qf+4*qs    ; E
	jmp	>qfas,	{qd+qf+4*qs+qi
	seq	qd+qf+3*qs,	qf+3*qs    ; E-1
	jmp	>qfas,	<qtab
	seq	qd+qf+5*qs,	qf+5*qs    ; E+1
	jmp	>qfas,	>qtab
	seq	qd+qf+9*qs,	qf+9*qs    ; D-1
	djn.b	>qfas,	{qslo
	seq	qd+qf+10*qs,	qf+10*qs   ; D
	jmp	>qfas,	{qslo
	seq	qd+qf+18*qs,	qf+18*qs   ; (B-1)*(E-1)
	djn.f	qslo,	qtab
	seq	qd+qf+21*qs,	qf+21*qs   ; B*(E-1)
	jmp	qslo,	<qtab
	seq	qd+qf+24*qs,	qf+24*qs   ; (B-1)*E
	jmp	qslo,	{qtab
	seq	qd+qf+32*qs,	qf+32*qs   ; (B+1)*E
	jmp	qslo,	}qtab
	seq	qd+qf+35*qs,	qf+35*qs   ; B*(E+1)
	jmp	qslo,	>qtab
	seq	qd+qf+57*qs,	qf+57*qs   ; C*(E-1)
	djn.b	qslo,	}qfas
	seq	qd+qf+76*qs,	qf+76*qs   ; C*E
	jmp	qslo,	}qfas
	seq	qd+qf+52*qs,	qf+52*qs   ; (A-1)*E
	djn.a	qslo,	{qfas
	seq	qd+qf+56*qs,	qf+56*qs   ; A*E
	jmp	qslo,	{qfas
	seq	qd+qf+63*qs,	qf+63*qs   ; B*(D-1)
	djn.b	qslo,	{qslo
	seq	qd+qf+70*qs,	qf+70*qs   ; B*D
	jmp	qslo,	{qslo
	seq	qd+qf+28*qs,	qf+28*qs   ; B*E
	jmp	qslo,	{qd+qf+28*qs+qi

; ----- boot code -----

rjmp	equ	(pump+3000)

boot	spl	 pump,	<4000
	mov	<rsrc,	<rdst
	mov	<rsrc,	<rdst
	mov	<rsrc,	<rdst
	mov	<rsrc,	<rdst
rdst	mov	 rdat,	*rjmp
	mov	<rsrc,	<rdst
	mov	<rsrc,	<rdst
	spl	@rdst,	<2000
	spl	@rdst,	<6000
	djn.f	@rdst,	 rdst

; ----- skew dwarf -----

rinc	equ	81
rhop	equ	5277+1
rclk	equ	1677
rorg	equ	rinc*rclk+1
rbmb	equ	rend+4

rsrc	spl	#   0,	$rdat
rock	spl	#   0,	<rhop+1
rptr	mov	 rbmb,	<rorg
	mov	 rbmb,	@rptr
	sub	#rinc,	 rptr
rend	djn	 rptr,	<rhop-3
rdat	dat	<rhop,	<rhop

end	qscan

