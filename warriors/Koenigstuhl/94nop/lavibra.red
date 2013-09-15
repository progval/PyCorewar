;redcode-94nop
;author Lukasz Grabun
;name La Vibra
;assert 1

step	equ	3315

inc	add.ab	#step		, ptr
scan	jmz.f	-1		, @ptr
bmb1	mov	spb		, @1
ptr	mov	@1		, @1
back	jmp	inc		, mvb
	mov	*bmb1		, {ptr2
mvb	jmp	-1		, 0
spb	spl	#-5		, 1
ptr2	dat	inc-6		, 0

