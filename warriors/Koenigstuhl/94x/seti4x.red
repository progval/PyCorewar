;redcode-94x
;name S.E.T.I. 4-X
;author JKW
;assert (CORESIZE == 55440)
;strategy heavy anti-imp scanner
;strategy v4 - change clr to >1
;strategy altered step.  switched to .b.
;strategy added line #16
;strategy v41 - changed #16 to @0

STEP	equ	16238 ;mod 2
DIST	equ	18
A	equ	(pt)
LEN	equ	(DIST/2)

	org	start

start	sub	c,	pt
pt	cmp.a   A,	A+DIST
	slt.ab	#50+DIST,	pt
cnt	djn	-3,	#CORESIZE/2
len	mov	#LEN,	#0
	mov	pt,	pt-3
	mov	glue,	}pt-3
	mov	glue,	>pt-3
	djn	-2,	len
	jmn.b	cnt,	cnt
        spl     #0
	mov	clr,    >-13
	jmp     -1,     }-14
clr     dat	>1,     20
c	dat	-STEP,	-STEP
glue	spl	@0,     -1

