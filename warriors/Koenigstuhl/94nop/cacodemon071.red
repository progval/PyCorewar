;redcode-94nop
;name Cacodemon v0.71
;strategy q^4->paper/stone
;strategy different Qscan?
;author Andrew Hunter
;assert CORESIZE==8000

sOff equ 3377
for 20
dat 0,0
rof
silkstart spl 1
	mov -1,0 
	spl 1
	spl 1
silk spl 7688, 0
	mov >-1,}-1
	spl 1403, 0
	mov >-1,}-1
fsilk spl 953,0
	mov >-1,}-1
	mov bomb, >1587
	mov bomb, }5633
	mov bomb, >1961
	add.a #50, fsilk
	jmp fsilk, <fsilk
bomb dat >2667,>5334
qf	equ	qptr
qs1	equ	(-120)
qs2	equ	(-240)
qd	equ	4000
qi	equ	7
qr	equ	13
qo	equ	(qi*qr-(qi/2))
for 8
dat 0,0
rof
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
	jmp	 sBoot,	>1234

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
bounce  jmp   sBoot
sBoot mov tail, 6+sOff-CURLINE
	spl 1
	mov -1,0
	spl 1
	mov {sBoot, <sBoot
	djn @sBoot,#6
	mov.ab sBoot, sBoot
	jmp silkstart
	step    equ     2777
time    equ     1206
incr sstart spl #0, #step
ptr spl #0,#0
stone mov sBomb, }2941
	mov sBomb,@stone
	add.f incr, stone
	djn.f ptr, incr-1
tail sBomb dat 27, 1
	end qscan

