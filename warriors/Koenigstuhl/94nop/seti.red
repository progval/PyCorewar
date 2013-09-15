;redcode-94
;name SETI
;author JKW
;assert (CORESIZE == 8000)
;strategy Double scanner

STEP	equ	3044
DIST	equ	12
A	equ	(pt)
ISTEP	equ	(8001/21)
LEN	equ	(DIST/2)

	org	start

start	sub	c,	pt
pt	cmp	A,	A+DIST
	slt.ab	#40,	pt
cnt	djn	-3,	#1500
len	mov	#LEN,	#0
	mov	pt,	pt-3
	mov	glue,	}pt-3
	mov	glue,	>pt-3
	djn	-2,	len
	jmn.b	cnt,	cnt
	add.a   #ISTEP+1,cpt
	mov	@-1,	{cpt
	jmp     -2
cpt	spl	#1,	#4
c	dat	-STEP,	-STEP
glue	spl	-1

end


