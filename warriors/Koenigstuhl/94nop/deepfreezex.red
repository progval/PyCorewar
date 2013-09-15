;redcode-94nop
;name Deep Freeze X
;author Lukasz Grabun
;strategy scanner
;assert 1

step	equ	1072
safe	equ	(tail-top+3)		;dunno why it's here, maybe it
					;comes from older version
gate	equ	(top-4)
away	equ	3000

	org	boot

;decoy
for 9
	spl	#1		, #1
	spl	#step		, <step
	spl	#step		, *step
	spl	#step		, @step
	spl	#step		, }step
	spl	#step		, {step
	spl	#step		, step
	spl	#step		, >step
rof

boot	mov	bmb		, away
for 9
	mov	{boot		, <boot
rof
	add	#2		, boot		;stupid idea;
						;should be done in one
						;instruction
	jmp	@boot		, 0

top
ptr	jmp	spb+1		, -away+9
atk	mov	-away-64	, >ptr
scan	seq	}2*step		, }2*step+8
	mov.ab	scan		, ptr
	add	spb		, scan
	jmn.a	atk		, scan
spb	spl	#step		, #step
	mov	bmb		, >gate
	djn.f	-1		, >gate
bmb	dat	>5335		, 2-gate

