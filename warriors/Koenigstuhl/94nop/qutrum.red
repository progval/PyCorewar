;redcode-94nop
;name Qutrum
;author inversed
;strategy HSA-style scanner
;history v0.6 First normal version
;history v0.7 One line shorter
;history v0.8 Failure
;history v0.9 Better switch to dat wipe
;history v1.0 Better step size
;history v1.1 Decrement/increment protection (50% of code is protected!)
;history v1.2 Changed zero offset
;assert (CORESIZE==8000) && (MAXPROCESSES==8000)

bi	equ	3629
h	equ	(4000+bi)
bptr	equ	(loop-1)
len	equ	inc-bptr
zofs	equ	2+bi
	org	ptr

;  Protection:
;~ increment and decrement
;- decrement
;+ increment

loop	add	inc,	@p	;b~
ptr	sne.f	0+zofs,	h+zofs
	add	inc,	ptr
	jmn.f	b,	@ptr
p	jmz.f	*p3,	*ptr	;a-
	mov.x	@p,	ptr	;a~
b	mov.b	@p,	@p2	;f~
	slt.ab	#len,	@p2	;b~
	jmn.b	*p3,	@p	;a-b~
wipe	mov	bomb,	>bptr
p2	mov	*wipe,	>bptr
	jmn.f	wipe,	@bptr
	jmn.b	loop,	@p	;b~
p3	jmp	loop,	}wipe
	for	4
	dat	0,	0
	rof
inc	dat	#bi,	#bi
bomb	spl	#0,	{0

