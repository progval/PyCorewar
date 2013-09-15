;redcode-94nop
;name Retarius v0.4
;author Andrew Hunter
;strategy v0.4 q^4 scanner/clear
;strategy massively optimized/shorter, just dat clear now
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
bounce  jmp   boot
for 22
dat 0,0
rof
boot mov.i tail, 3268
for 16
mov.i {boot, <boot
rof
add.ab  #7,     boot   
spl     @boot,       #1   
mov.i   0,     boot
dat 0,0
clear mov tfix, >tail
djn.a clear, clear-1
mov.b 1, tail
jmp clear, 3
tfix dat 1,2
sbomb spl #7,#7
jbomb jmp -1, 1100
spl clear, 1100
scanner add.f sbomb,scan
scan sne.a 1,2
djn scanner, scanner-1
mov.i sbomb, *scan
mov.i jbomb, @scan
jmn.b scanner, scanner-1
mov.b scanner-2, scanner-1
mov.f tfix, scan
tail jmp scanner, 3
end qscan

