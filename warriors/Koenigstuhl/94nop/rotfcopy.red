;redcode-94 test
;name RotF Copy
;author Robert Macrae
;strategy q^4 -> silkish/imp after David Moore / Ben Ford 
;assert (CORESIZE==8000)

; Endless agonising, and I came back to the first version. Oh well, at
; least I learned to code a P^3, though it never quite beat this 8-/


iHOP	equ	(2667)
iINC	equ	(-iHOP-1)
iORG	equ	(spin+630)
iOFF	equ	(iORG+iINC)

qf	equ	qptr
qs1	equ	(-120)
qs2	equ	(-240)
qd	equ	4000
qi	equ	7
qr	equ	13
qo	equ	(qi*qr-(qi/2))


wimp  jmp   #0,         #0
 
    for 10
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
      jmp   boot

    for 25
      dat 0,0
    rof

d2    equ 1143
TSTEP equ 1751
bstep equ 1819 ;2283 ;1997
bootto equ 1700-(80+15)*4-1

boot    spl     wimp,   }-500          

;-------------------------
; Silk with Imps from ROTF
;-------------------------

impy equ 2667
aaa  equ 1880
bbb  equ 2050
ccc  equ  240

        spl 1, >-600
table2  spl 1, >-700
        spl 1, >-800
        mov <1, {1
        spl ccc+paper+8, paper+8

paper   spl  @0, >aaa
        mov }-1, >-1
        spl  @0, >bbb
        mov }-1, >-1
        spl  @0, <2668
        mov }-1, >-1
        mov.i #2*aaa, }-aaa
        mov.i #bbb, impy


        end	    qscan

