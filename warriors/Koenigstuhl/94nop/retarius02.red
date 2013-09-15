;redcode-94nop
;name Retarius v0.2
;author Andrew Hunter
;strategy v0.2 q^4 scanner/clear
;strategy added the q^4
;assert CORESIZE==8000

qf	equ	qptr
qs1	equ	(-120)
qs2	equ	(-240)
qd	equ	4000
qi	equ	7
qr	equ	13
qo	equ	(qi*qr-(qi/2))
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
	jmp	 scanner,	>1234

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
      jmp   scanner
bomb dat 1,2
dat 0,1
spl 0,1 
target dat 0,100
clear mov.i @bomb, >target
jmn.b -1,-2
mov.i tfix,target
jmp clear
tfix dat 0,100
sbomb spl 0,0
jbomb jmp @0,-1
step dat #7,#7
preset sne.a 100,101
creset dat 0,1100
counter dat 0,1100
scanner add.f step,scan
scan sne.a 100,101
djn scanner, counter
jmz.b finish, counter
mov.i sbomb, *scan
mov.i jbomb, @scan
jmp scanner, <counter
finish
mov.i creset, counter
mov.i preset, scan
spl clear
mov.i 2,-1
jmp scanner
jmp scanner+3
end scanner

