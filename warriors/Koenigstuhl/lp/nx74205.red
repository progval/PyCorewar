;redcode-lp
;name NX-74205
;author Philip Kendall
;strategy P^2 switcher for spl/jmp and dat bombing stones
;assert CORESIZE==8000
;planar stone,stun,clear,boot,pspace,other

jStep	equ	3205
jBomb1	equ	(jHit+jStep)
jTrig	equ	(jHit-jStep)
jDbomb	equ	(jLoop-3)

jLoop	add.ab	#jStep,jStone
jStart	mov.i	jSbomb,@jStone
jStone	mov.i	jJbomb,*jBomb1
jHit	jmz.f	jLoop,jTrig
jSbomb	spl.a	#1,4
	mov.i	jDbomb,>jSbomb
jJbomb	jmp.a	-1,1

jBdist	equ	2134

jBoot
i	for	6
	mov.i	(jJbomb-i+1),<jBptr
	rof
	spl.a	@jBptr
	mov.i	jLoop,<jBptr
jBptr	div.f	#0,#jBdist

kStart	spl.a	1,>-1000
	mov.i	-1,0
	spl.a	2,>-3000
	jmp.a	*kBptr,}0
	jmp.a	@kBptr,}0
kBptr	dat.f	kLoop+1,kLoop+2
	dat.f	kLoop+3,kLoop+4
	dat.f	kLoop  ,kLoop+1

pResult equ	0	; pMARS puts results here
pSpace	equ	202	; pspace location containing current state
pNum	equ	6	; maximum number of states (for brainwash protection)

	dat.f	0,pInit-pJump
pTable	dat.f	0,pLoss-pJump
	dat.f	0,pWin-pJump
	dat.f	0,pWin-pJump

pGo	ldp.a	#pResult,pTable    ; get input value
pLoad	ldp.a	#pSpace,pJump	   ; load old state
	mod.a	#pNum,pJump	   ; brainwash protection
	add.ba	*pTable,pJump	   ; select correct state table
	stp.a	*pJump,pLoad	   ; store new state
pJump	jmp.a	@0		   ; jump to warrior code

c1	equ	kStart
c2	equ	jBoot

pLoss	dat.f	1,c1
	dat.f	2,c1
	dat.f	3,c2
	dat.f	4,c2
	dat.f	5,c2
pWin	dat.f	0,c1	; this entry shared between both tables
	dat.f	0,c1
pInit	dat.f	0,c1
	dat.f	3,c2
	dat.f	3,c2
	dat.f	3,c2

	for	7*(MAXLENGTH>=200)
	dat.a	1,1
	dat.b	1,1
	dat.ab	1,1
	dat.ba	1,1
	dat.f	1,1
	dat.x	1,1
	dat.i	1,1
	rof

	for	59*(MAXLENGTH>=200)
	dat.f	0,0
	rof

kStep	equ	85
kBomb1	equ	(kStone+kStep)

kLoop	sub.f	kInc,kStone
	mov.i	kDbomb,@kStone
kStone	mov.i	kBomb1,@(kBomb1+kStep)
	mov.i	>kCheck,*kStone
	jmz.f	kLoop,<kCheck
	jmp.a	kClear,<kPtr

	for	32
	dat.f	0,0
	rof

kPtr	equ	(kCbomb-3)
kCstart equ	(kSafety+3-kPtr)

kCbomb	dat.f	>5335,>kCstart
kDbomb	dat.f	>(-2*kStep),}kStep
kCheck	dat.f	0,0
	dat.f	0,0
	dat.f	0,0		; bombed
kInc	spl.a	#(-3*kStep),>(-3*kStep)
kClear	mov.i	kCbomb,>kPtr
	djn.f	kClear,>kPtr
kSafety jmp.a	kInc,}kPtr

	end	pGo

