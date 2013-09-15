;redcode-lp
;name Twin Flame
;author Ian Oversby
;strategy Double Torch for 8 processes
;assert 1

step	equ	95
gate	equ	(sp-3)		; 365
dist	equ	(7+(401*10))	; 3517 + 140

org boot

sp	spl.b	#-step, -step
msm	mov.i	sm,	*(hit+2*step)
msp	mov.i	sp,	@msm
in	add.ab	#2*step, msm
hit	jmz.b	@in,	#0
clr	mov.i	cbomb,	>gate
	jmp.b	clr,	>gate-2667
	dat.f	$0,	$0		; Too lazy to remove bugs

here	dat.f	$0,	$0
sm	jmp.b	#1,	#1
cbomb	dat.f	$0,    $15

for 20
	dat.f	$0,	$0
rof

bptr	dat.f	#dist,	#dist+3
boot	mov.i	cbomb,	<bptr
	mov.i	sm,	<bptr
for 8
	mov.i	<here,	{bptr
rof
	spl.b	*bptr,	<-2000
	djn.b	#0,	#5
	jmp.b	sp,	<-2200

	for (MAXLENGTH-CURLINE)/4

	spl.b	#1,	{1
	spl.b	#1,	>1
	jmp.b	#1,	>1
	spl.b	#1,	}1

	rof

end

