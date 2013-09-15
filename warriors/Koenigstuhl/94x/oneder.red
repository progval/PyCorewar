;redcode-x2
;name Oneder
;author Ben Ford
;strategy hmm.... test scores 180ish
;strategy I change qscan constants slightly and back to 110
;strategy must be some amazing coincidence with the F-number
;strategy oh well, I can just hope...
;assert (CORESIZE==55440)

org	qscan

; ----- q-scan bomber -----

qf	equ	qptr
qs1	equ	200
qs2	equ	400
qd	equ	(55440/2)
qi	equ	7
qr	equ	11
qo	equ	(qi*qr-10)

	dat	#  15,	#  10	; A, D
qtab	dat	#   7,	#   4	; B, E
	dat	#  13,	#  11	; C, F
qbmb	dat	<   1,	<  qo
qinc	dat	#  qd,	#  qd

qslo	mul.x	qtab,	qptr	; decode
qfas	mul.f	qtab,	@qslo
qfnd	sne	*qptr,	@qptr
	add	qinc,	qptr
	sne	>3456,	@qptr
	mov.x	qptr,	qptr
qloo	mov	qbmb,	@qptr	; .5c negative bomber
qptr	mov	< qs2,	@ qs1
	sub.x	#  qi,	qptr
	djn	qloo,	#  qr
	jmp	boot,	>1234

; ----- space -----

for	25
	dat	0,	0
rof

; ----- q^4-scan -----

;    -+)>] 0/1 cycles [(<+-

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

;    -+>)] 2 cycles [(<+-
;	dat	#  15,	#  10	; A, D
;qtab	dat	#   7,	#   4	; B, E
;	dat	#  13,	#  11	; C, F

	sne	qf+ 5*qs2,	qf+ 7*qs1
	seq	qf+ 5*qs2+qd,	qf+ 7*qs1+qd	; E+1, B
	jmp	>qfas,	>qtab
	sne	qf+ 4*qs2,	qf+ 8*qs1
	seq	qf+ 4*qs2+qd,	qf+ 8*qs1+qd	; E, B+1
	jmp	>qfas,	}qtab
	sne	qf+ 3*qs2,	qf+ 6*qs1
	seq	qf+ 3*qs2+qd,	qf+ 6*qs1+qd	; E-1, B-1
	djn.f	>qfas,	qtab
	sne	qf+10*qs2,	qf+15*qs1
	seq	qf+10*qs2+qd,	qf+15*qs1+qd	; D, A
	jmp	>qfas,	{qslo
	sne	qf+ 9*qs2,	qf+14*qs1
	seq	qf+ 9*qs2+qd,	qf+14*qs1+qd	; D-1, A-1
	djn.f	>qfas,	{qslo
	sne	qf+11*qs2,	qf+13*qs1
	seq	qf+11*qs2+qd,	qf+13*qs1+qd	; F, C
	jmp	>qfas,	}qfas
	sne	qf+66*qs2,	qf+39*qs1
	seq	qf+66*qs2+qd,	qf+39*qs1+qd	; F*(B-1), C*(E-1)
	djn.f	qslo,	}qfas

	sne	qf+18*qs2,	qf+18*qs1
	seq	qf+18*qs2+qd,	qf+18*qs1+qd ; (E-1)*(B-1), (B-1)*(E-1)
	djn.f	qslo,	qtab
	sne	qf+21*qs2,	qf+21*qs1
	seq	qf+21*qs2+qd,	qf+21*qs1+qd	; (E-1)*B, B*(E-1)
	jmp	qslo,	<qtab

	sne	qd+qf+24*qs2,	qf+24*qs1
	seq	qd+qf+24*qs2+qd,	qf+24*qs1+qd   ; (B-1)*E
	jmp	qslo,	{qtab
	sne	qf+32*qs2,	qf+32*qs1
	seq	qf+32*qs2+qd,	qf+32*qs1+qd   ; (B+1)*E
	jmp	qslo,	}qtab
	sne	qf+35*qs2,	qf+35*qs1
	seq	qf+35*qs2+qd,	qf+35*qs1+qd   ; B*(E+1)
	jmp	qslo,	>qtab
	sne	qf+52*qs2,	qf+52*qs1
	seq	qf+52*qs2+qd,	qf+52*qs1+qd   ; C*E
	jmp	qslo,	}qfas
	sne	qf+56*qs2,	qf+56*qs1
	seq	qf+56*qs2+qd,	qf+56*qs1+qd   ; (A-1)*E
	djn.a	qslo,	{qfas
	sne	qf+60*qs2,	qf+60*qs1
	seq	qf+60*qs2+qd,	qf+60*qs1+qd   ; A*E
	jmp	qslo,	{qfas
	sne	qf+63*qs2,	qf+63*qs1
	seq	qf+63*qs2+qd,	qf+63*qs1+qd   ; B*(D-1)
	djn.b	qslo,	{qslo
	sne	qf+66*qs2,	qf+66*qs1
	seq	qf+66*qs2+qd,	qf+66*qs1+qd   ; (B-1)*F
	djn.a	qslo,	}qslo
	sne	qf+70*qs2,	qf+70*qs1
	seq	qf+70*qs2+qd,	qf+70*qs1+qd   ; B*D
	jmp	qslo,	{qslo
	sne	qf+77*qs2,	qf+77*qs1
	seq	qf+77*qs2+qd,	qf+77*qs1+qd   ; B*F
	jmp	qslo,	}qslo
	sne	qf+28*qs2,	qf+28*qs1
	seq	qf+28*qs2+qd,	qf+28*qs1+qd   ; B*E
	jmp	qslo,	{qd+qf+28*qs1+qi

; ----- silk -----

p1	equ	220	; 1700
p2	equ	6172	; 4388
p3	equ	3060	; 4924

boot	spl	    1,	>7648	; 4 processes
	spl	    1,	>7356

pap1	spl	@   0,	{p1
	mov	}pap1,	>pap1
	mov	}pap1,	>pap1
pap2	spl	@   0,	{p2
	mov	}pap2,	>pap2
	mov	{pap2,	{pap3
pap3	jmp	p3+1,	>p3-3
	dat	>   1,	}   1

; ----- end -----

end