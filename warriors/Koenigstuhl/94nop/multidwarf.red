;redcode
;name multi dwarf
;author Lukasz Grabun
;assert 1

offset		equ	3503		;dwarves offset
bo		equ	404		;bombs offset
sp		equ	700		;start point

boot		mov	kamien, sp+3
		mov	{boot,	<boot
		jmp	boot1
		dat	0,	0

boot1		mov	{boot,	<boot
		mov	{boot,	<boot
		jmp	boot2
		dat	0,	0

boot2		spl	@boot
		mov.a	#kamien+CURLINE,boot
		jmp	boot3
		dat	0,	0

boot3		add	#offset,boot
		djn	boot,	#17
		mov	0,	1
		dat	0,	0

dwarf		mov	kamien,	@kamien
		add	#bo,	kamien
		jmp	dwarf
kamien		dat	0,	0

