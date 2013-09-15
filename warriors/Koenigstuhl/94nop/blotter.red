;redcode-94nop
;author inversed
;name Blotter
;strategy Paper/dclear
;assert (CORESIZE==8000) && (MAXPROCESSES==8000)

ofs0	equ	3150+0-10
ofs1	equ	2420+13-10
ofs2	equ	1360+16-10

dist	equ	1383
x	equ	24

org	qgo

sstart	spl	1
	spl	1

silk0	spl	@0,	<ofs0
	mov	}silk0,	>silk0
	mov	}silk0,	>silk0
silk1	spl	@0,	<ofs1
	mov	}silk1,	>silk1
	mov	{silk1,	<silk2
silk2	jmp	@0,	>ofs2

	for	x
	dat	0,	0
	rof

	A	equ	6
	B	equ	3
	C	equ	9

	qf	equ	qkill
	qs	equ	qh*2
	qh	equ	106
	qi	equ	7
	qnum	equ	11

qgo	seq	qf+qs+qh,		qf+qs		;1
	jmp	qskip,			{qf+qs+qh+qi
	seq	qf+B*qs+qh,		qf+B*qs		;B
	jmp	qfast,			{qf+B*qs+qh+qi
	seq	qf+(B-1)*qs+qh,		qf+(B-1)*qs	;B-1
	jmp	qfast,			<qbomb
	seq	qf+(B+1)*qs+qh,		qf+(B+1)*qs	;B+1
	jmp	qfast,			>qbomb
	seq	qf+(A-1)*qs+qh,		qf+(A-1)*qs	;A-1
	djn	qfast,			{qfast
	seq	qf+A*qs+qh,		qf+A*qs		;A
	jmp	qfast,			{qfast
	sne	qf+B*C*qs+qh,		qf+B*C*qs	;BC
	jmz.f	wgo,			qf+B*C*qs+qh-10

qslow	mul	#C,		qkill
qfast	mul.b	qbomb,		@qslow
qskip	sne	{4096,		@qkill
	add	#qh,		qkill
qloop	mov	qbomb,		@qkill
qkill	mov	qbomb,		*qs
	sub	#qi,		qkill
	djn	qloop,		#qnum
	jmp	wgo,		{A
qbomb	dat	{qi*qnum-10,	>B

	for	(55-x)
	dat	0,	0
	rof

wgo	spl	0,	}0
	spl	1
	mov	}bptr,	>bptr
	djn	stone+dist,	#4
	jmp	sstart

bptr	dat	stone,	stone+dist

stone	spl	#0,	>stone-2
inc	spl	#0,	>stone-2
loop	mov	bomb,	>stone-2
	djn.f	-1,	>stone-2
	dat	0,	0
bomb	dat	0,	10

