;redcode-lp
;name Feed the Fire
;author Philip Kendall
;strategy Inferno 1.8 and Paper 'LP' II pspaced
;assert CORESIZE==8000
;planar paper,stone,clear,gate,pspace,boot
;show source

pLength equ	(pData&i-pPap&i+1)

pDist01 equ	883
pDist02 equ	1257
pDist03 equ	-573
pDist04 equ	3139
pDist05 equ	-2047
pDist06 equ	2155
pDist07 equ	3803
pDist08 equ	-921

pBomb01 equ	-2667		; lots of imp numbers
pBomb02 equ	-1143		; well, why not?
pBomb03 equ	-889
pBomb04 equ	-5091
pBomb05 equ	-3077
pBomb06 equ	-2353
pBomb07 equ	-7579
pBomb08 equ	-381

;all this messing about in the next few lines is because I have a couple of
;things on my HD which assume that all my warriors compile and run without
;errors under '94 rules

pCopies equ	7+(MAXLENGTH>=200)
	for	MAXLENGTH<200
pLast	equ	pCopy07
	rof
	for	MAXLENGTH>=200
pLast	equ	pCopy08
	rof

pGo
i	for	(pCopies-1)
	spl.a	pCopy&i,>(i*1000)
	rof
	jmp.a	pLast,>-500

	dat.f	1,1
	dat.x	1,1
	dat.i	1,1
	dat.a	1,#1

i	for	7+(MAXLENGTH>=200) ; 8 processes => 8 copies
			; but only room for 7 copies in 100 length

pPap&i	mov.a	#1,pData&i
	mov.ab	#pLength,pRep&i
pCopy&i mov.i	{pData&i,<pData&i
pRep&i	djn.b	pCopy&i,#pLength
	spl.a	*pData&i,>pBomb&i
	jmz.b	@pData&i,pRep&i
pData&i dat.f	1,pDist&i

	for	MAXLENGTH>=200
	dat.f	1,1
	dat.x	1,1
	dat.i	1,1
	dat.a	#1,1
	dat.b	#1,1
	dat.ab	#1,1
	dat.ba	#1,1
	dat.f	#1,1
	dat.x	#1,1
	rof

	rof

iBdist	equ	(1582-7*(MAXLENGTH>=200))
; complicated expression so that the boot pointer is always bombed

iStep	equ	3205
iBomb1	equ	(iHit+iStep)
iTrig	equ	(iHit-iStep)

iPtr	equ	(iCbomb-1)
iCstart equ	(iSafety+3-iPtr)

iGo
i	for	12
	mov.i	(iCbomb+i-1),>iBptr
	rof
iBptr	spl.a	(iLoop+iBdist),(iCbomb+iBdist)	    ; bombed early

	for	(MAXLENGTH>=200)
	dat.a	1,*1
	dat.b	1,*1
	dat.ab	1,*1
	dat.ba	1,*1
	dat.f	1,*1
	dat.x	1,*1
	dat.i	1,*1
	rof

iCbomb	dat.f	>5335,iCstart
iMbomb	mov.i	iStep,1
iJbomb	jmp.a	#1,1
iLoop	mov.i	iJbomb,*iStone
iX	mov.i	iMbomb,@iStone
iStone	mov.i	iBomb1,*iBomb1+iStep
	add.f	iInc,@iX
iHit	jmz.f	iLoop,iTrig
iInc	spl.a	#(iStep*3),>(iStep*3)
iClear	mov.i	iCbomb,>iPtr
	djn.f	iClear,>iPtr
iSafety jmp.a	iInc,>iPtr

	for	MAXLENGTH>=200
	dat.a	*1,@1
	dat.b	*1,@1
	dat.ab	*1,@1
	dat.ba	*1,@1
	dat.f	*1,@1
	dat.x	*1,@1
	dat.i	*1,@1
	rof

sResult equ	0
sSpace1 equ	327
sSpace2 equ	182
sLosses equ	2
sNum	equ	2

sGo	ldp.a	#sResult,sJump
	ldp.a	#sSpace1,sTable
sJump	jmp.a	@0,sLoss
	dat.f	0,sWin
	dat.f	0,sTie
sLoss	ldp.ab	#sSpace2,#0
	nop.f	>sLoss,}-1000
	mod.ab	#sLosses,sLoss
sThink	jmn.b	sWin,sLoss
	nop.f	}sTable,}-2000
	stp.ab	sTable,#sSpace1
sWin	stp.b	sLoss,#sSpace2
sTie	mod.a	#sNum,sTable
sTable	jmp.a	@0,iGo
	dat.f	0,pGo

	for	MAXLENGTH>=200
	dat.a	@1,*1
	dat.b	@1,*1
	dat.ab	@1,*1
	dat.ba	@1,*1
	dat.f	@1,*1
	dat.x	@1,*1
	rof

	end	sGo

