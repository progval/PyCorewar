;redcode-b verbose
;name Sunstone I
;author Bryn A Davies
;strategy "Air of salt, bare feet, around the rocks to the next beach,
;strategy  Corrugated grooves, witness ugly truths. Sunstone, sunstone
;strategy  warm my blood..."
;strategy			- Skunkhour, "Sunstone"
;strategy
;strategy Just another mod-5 stone. This is my second warrior. I dedicate
;strategy Comments REQUIRED!
;assert CORESIZE == 8000
;-Equates-------
opst	equ	#3315
opit	equ	#1600
gate	equ	(wipe-30)
;-Main----------
bomb	dat	opit,	opst
start	mov	bomb,	@bomb
	add	opst,	bomb
	djn.a	start,	bomb
	jmp	2
	dat	0,	0
wipe	spl	#0,	#1
	mov.i	gbomb,	>gate
	djn.f	-1,	>gate
gbomb	dat.f	>5335,	#40
	for	(MAXLENGTH-CURLINE-40)
		dat	0,	0
	rof
	for	40
		dat	@86,	}69
	rof
	end	start
