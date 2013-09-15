;redcode-94nop
;name Mani 24
;author Lukasz Grabun
;assert 1

step	equ	3364
safe	equ	(tail-top+3)
gate	equ	(top-2)
away	equ	3257

	org	boot

;decoy
for 18
	spl	#1		, >1
	spl	#1		, <1
	spl	#1		, *1
	spl	#0		, #0
rof
	dat	0		, 0

boot	mov	tail		, away
for 9
	mov	{boot		, <boot
rof
	add	#3		, boot
	jmp	@boot		, 0

top
ptr	jmp	spb+1		, -away+9
atk	mov	spb		, >ptr
inc	add	#step		, #step
scan	jmz.f	atk		, @inc
	mov.b	inc		, ptr
	jmn	atk		, inc
spb	spl	#0		, #0
	mov	tail		, >gate
	djn.f	-1		, >gate
tail	dat	>5335		, 2-gate

