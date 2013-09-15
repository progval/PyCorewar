;redcode-lp
;name Furry Hat
;author Philip Kendall
;strategy vamp or spl/jmp bombs using the myVamp engine
;assert CORESIZE==8000
;planar vamp,stun,clear,gate,decoy

decoy	equ	(start-1183)

start	mov.i	{decoy,<decoy+2
	mov.i	{decoy+3,<decoy+5
	mov.i	<decoy+6,{decoy+8
	mov.i	<decoy+9,{decoy+11
	mov.i	{decoy+12,<decoy+14
	mov.i	<decoy+15,{decoy+17
	mov.i	{decoy+18,<decoy+20
	mov.i	<decoy+21,{decoy+23
	mov.i	{decoy+24,<decoy+26
	jmp.a	vamp,<decoy+1

	for	(107-(96*(MAXLENGTH<200))-CURLINE)
	dat.f	0,0
	rof

step	equ	3568
bomb1	equ	(hit-step)
cstart	equ	(jbomb+2-ptr)

ptr	dat.f	0,(pite+3)
dbomb	dat.f	>2667,}cstart
vbomb	jmp.a	*(pit-bomb1),bomb1
inc	dat.f	#step,#-step
hit	nop.f	0,}vbomb	; bombed
loop	add.f	inc,vbomb
vamp	mov.i	@0,@vbomb
	jmz.a	loop,*vbomb
	mov.i	jbomb,*vbomb
	mov.i	sbomb,{vbomb
	jmz.a	@0,hit
sbomb	spl.a	#0,}ptr 	; scanned
	mov.i	dbomb,>ptr
jbomb	jmp.a	-1,}ptr

	for	47
	dat.f	0,0
	rof

pit	jmp.a	pits,}ptr

	for	20
	dat.f	0,0
	rof

pits	spl.a	#0,}ptr
pite	jmp.a	-1,}ptr

	end	start

