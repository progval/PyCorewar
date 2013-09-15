;redcode-94
;name Flame On
;author Ian Oversby
;strategy Incendiary bomber -> stun/dat clear
;strategy for lp and '94 environment
;strategy Compromise on step size
;strategy A few imps for the lp brigade
;strategy hoping to catch vampires ?!
;assert 1

step	equ	45
imp	equ	(impy+320)
ist	equ	2667

gate	dat.f	$0,	#cptr+3

	dat.f	$0,	$0
	dat.f	$0,	$0

sp      spl.b	#-step, -step+1
msm     mov.i	sm,     *(hit+2*step)
msp     mov.i	sp,     @msm
in      add.ab	#2*step, msm
hit     jmz.b	@in,    #0
clr	mov.i	*cptr,	>gate
	djn.f	clr,	{gate
	jmp.b	clr,	>gate-2667

	dat.f	$0,	$0

sm	jmp.b	#1,	>1

	dat.f	#0,	3-gate
b1	jmp.b	#-2,	1-gate
cptr	dat.f	#-1,	0

for 50
	dat.f	$0,	$0
rof

stun	mov.i	step,	>step
alt	spl.b	#-2,	1-(gate-b1)

delay	djn.b	#0,	#2
	spl.b	incen,	<-200
	jmp.b	msm,	}300

incen	mov.i	stun,	sm
	mov.i	alt,	b1
	spl.b	sp,	>-200
	mov.i	-1,	0
	dat.f	}300,	>200

boot	mov.i	impy,	imp
	spl     1,	#0
	mov.i	-1,	0
	spl     <0,	#vector+1
	djn.a   @vector,#0

impy	mov.i   #ist, *0

	jmp.b	delay,	sp
	jmp.b	imp+ist*3,imp+ist*2   
vector  jmp.b	imp+ist,imp

end boot
