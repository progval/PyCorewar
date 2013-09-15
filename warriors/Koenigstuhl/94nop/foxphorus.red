;redcode-b verbose
;author Bryn Davies
;name FOXphorus I
;strategy Self splitting stun bombing bootstrapping core clearing stone.
;strategy My first warrior, so be gentle! :)
;strategy d2aw4jf
;assert CORESIZE == 8000
lstep	dat	0,		2016
begin	mov	foxphor-1,	>lstep
	mov	foxphor,	>lstep
	mov	foxphor+1,	>lstep
	mov	foxphor+2,	>lstep
	mov	foxphor+3,	>lstep
	mov	foxphor+4,	>lstep
	mov	foxphor+5,	>lstep
	mov	foxphor+6,	@lstep
	add	#1993,		lstep
	seq	#8016,		lstep
	jmp	begin,		<lstep-10
	spl	2005,		<lstep-10
	spl	4004,		<lstep-10
	spl	6003,		<lstep-10
	jmp	3,		<lstep-10
bomb	spl	0,		8
foxphor	add	#4,		bomb
	mov	bomb,		@bomb
	seq	#2000,		@bomb
	jmp	foxphor,	<lstep-10
wipe	mov	2,		3
	jmp	wipe,		>wipe
	dat	#86,		#86
	end	begin
