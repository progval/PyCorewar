;redcode-94
;name Leprechaun deluxe
;author Anders Ivner
;strategy 75% bomber/scanner with decoy
;strategy bombs/scans +3700 locations before entering coreclear
;assert CORESIZE==8000

STEP	equ	(-5741)
A	equ	(loop+5-STEP)
start	equ	check
gate	equ	loop-3
offset	equ	3456             ; insert arbitrary number [2000..6000]

	; scan A, glue A+STEP, bomb A+STEP+STEP

boot	mov	clr+1,	clr+1+offset
	mov	{boot,	<boot
	mov	{boot,	<boot
	mov	{boot,	<boot
	mov	{boot,	<boot
	mov	{boot,	<boot
	mov	{boot,	<boot
	mov	{boot,	<boot
	mov	{boot,	<boot
	mov	const,	const+offset+2
	mov	mb,	mb+offset+2
	mov	bmb,	bmb+offset+4
	jmp	start+offset

loop	sub	const+2,@dp
	mov	sb,	@pt
pt	mov	A,	@A+STEP
check	jmz.a	loop,	*pt
dp	mov	mb+2,	*pt
	jmn.a	loop,	check
sb	spl	#-STEP+1,STEP
clr	mov	bmb+4,	>gate
	djn.f	clr,	{gate

const	dat	-STEP*3,-STEP*3
mb	mov	@0,	}STEP
bmb	dat	-1,	18

	for	75
	dat	boot*1023,1
	rof

	end	boot

