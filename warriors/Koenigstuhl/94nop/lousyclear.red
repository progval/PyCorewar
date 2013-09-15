;redcode-94nop
;name lousy clear 1.02 + boot
;strategy: boot -> multiple stone -> imp
;author Lukasz Grabun
;assert 1

;added boot sequence

dens		equ 	15
offset		equ	500

boot		mov	bomb,	3268

for		17
		mov	{boot,	<boot
rof
		add	#1,	boot
		jmp	@boot

start		mov 	bomb,	offset
;copying
for		2
		mov	{start, <start
rof
		add.a	#2,	start
		add	#offset+2,start
		djn	start,	#dens

splitting	spl	offset - (splitting - start) - 1
		add.a	#offset,splitting
		djn	splitting, #dens

		djn	0,	#300		;do zmiany

disease		add 	#100, 	bomb
		mov	imp,	@bomb
		spl	@bomb
		jmp	disease

imp		mov	0,	1
clear		mov 	bomb, 	}bomb
back		jmp 	clear,  }bomb 
bomb		dat	1,	500

;for		15
;		dat 	0, 	1
;		mov	2,	0
;		mov	3,	15
;		cmp	100,	23
;		cmp	101,	24
;rof

