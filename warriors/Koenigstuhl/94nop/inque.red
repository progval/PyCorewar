;redcode-94nop
;author Lukasz Grabun
;name Inque
;assert 1

step	equ	2936		;3315 also possible
gate	equ	(TOP-4)

TOP
inc	add.ab	#step		, ptr
scan	jmz.f	-1		, @ptr
	mov	spb		, @1
ptr	mov	@back		, @1	;trick
back	jmp	inc		, mvb
	mov	bmb		, >gate
	djn.f	-1		, >gate
bmb	dat	>5335		, 2-gate
spb	spl	#2		, 1
;mvb	mov	}-1		, 1	;it seems that spl/jmp works better
mvb	jmp	-1

