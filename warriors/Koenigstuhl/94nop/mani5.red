;redcode-94nop
;name Mani 5
;author Lukasz Grabun
;assert 1

step	equ	3364
safe	equ	(tail-top+3)
	org	scan

top
atk	mov	mvb		, @1
ptr	mov	spb		, @step
inc	add	#step		, ptr
scan	jmz.f	-1		, @ptr
	slt	ptr		, #safe
ptrc	jmp	atk		, mvb
	jmn	inc		, ptr
spb	spl	#2		, 0
write	mov	@incr		, >ptrc
	mov	@incr		, >ptrc
incr	djn.f	write		, {wipe
	dat	#ptrc-5		, #incr-ptrc+5
wipe	spl	#ptrc-5		, #incr-ptrc+5
mvb	mov	-1		, }-1
tail	dat	0		, 0

