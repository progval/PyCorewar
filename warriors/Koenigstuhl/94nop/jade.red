;redcode-94 test
;name Jade
;author Ben Ford
;strategy q^4 -> stone/imp
;assert (CORESIZE==8000)

iHOP	equ	(2667)
iINC	equ	(-iHOP-1)
iORG	equ	(spin+630)
iOFF	equ	(iORG+iINC)

spin	spl.b	#   0,	>pump
	sub.f	#iINC,	 jump
pump	mov.i	 impy,	 iORG-1
jump	djn.f	 iOFF,	<-100
	dat	$   0,	$   0
impy	mov.i	#   0,	 iHOP

for	42
	dat	$   0,	$   0
rof

qf	equ	qptr
qs1	equ	100
qs2	equ	200
qd	equ	4000
qi	equ	7
qr	equ	11
qo	equ	(qi*qr-10)

	dat	#  15,	#  10	; A, D
qtab	dat	#   7,	#   4	; B, E
	dat	#  13,	#  11	; C, F
qbmb	dat	<   1,	<  qo
qinc	dat	#  qd,	#  qd

qfas	mul.f	 qtab,	 qptr	; decode
qfnd	sne	*qptr,	@qptr
	add	 qinc,	 qptr
	sne	>3456,	@qptr
	mov.x	 qptr,	 qptr
qloo	mov	 qbmb,	@qptr	; .5c negative bomber
qptr	mov	< qs2,	@ qs1
	sub.x	#  qi,	 qptr
	djn	 qloo,	#  qr
	jmp	 boot,	>1234

qscan	sne	qf+ 1*qs2,	qf+ 1*qs1
	seq	qf+ 1*qs2+qd,	qf+ 1*qs1+qd	; 1, 1
	jmp	qfnd,	{qf+ 1*qs2+qd+qi
	sne	qf+ 8*qs2,	qf+ 4*qs1
	seq	qf+ 8*qs2+qd,	qf+ 4*qs1+qd	; B+1, E
	jmp	qfas,	}qtab
	sne	qf+ 7*qs2,	qf+ 5*qs1
	seq	qf+ 7*qs2+qd,	qf+ 5*qs1+qd	; B, E+1
	jmp	qfas,	>qtab
	sne	qf+ 6*qs2,	qf+ 3*qs1
	seq	qf+ 6*qs2+qd,	qf+ 3*qs1+qd	; B-1, E-1
	djn.f	qfas,	qtab
	sne	qf+13*qs2,	qf+11*qs1
	seq	qf+13*qs2+qd,	qf+11*qs1+qd	; C, F
	jmp	qfas,	}qfas
	sne	qf+15*qs2,	qf+10*qs1
	seq	qf+15*qs2+qd,	qf+10*qs1+qd	; A, D
	jmp	qfas,	{qfas
	sne	qf+14*qs2,	qf+ 9*qs1
	seq	qf+14*qs2+qd,	qf+ 9*qs1+qd	; A-1, D-1
	djn.f	qfas,	{qfas

away    equ     (spin+4846+6)

boot	spl	 spin,	#away+rinc-3
	mov	*rock,	@boot
	mov	{rock,	<bptr
	mov	{rock,	<bptr
	mov	{rock,	<bptr
	mov	{rock,	<bptr
	mov	{rock,	<bptr
	spl	@bptr,	<4000
	spl	@bptr,	<4000
bptr	djn.f	@bptr,	#away

rinc	equ	( 197)
rclk	equ	(3500)
roff	equ	(rdjn-1151)
rorg	equ	(radd-rinc*rclk)

rock	spl	#   5,	$   0
	spl	#   0,	<roff
rmov	mov	 rinc,	 rorg
radd	add.ab	{   0,	}   0
rdjn	djn.f	 rmov,	<roff
rbmb	dat	>  -1,	}   1
;rbmb	dat	}   1,	>  -1

end	qscan

