;redcode
;name orc
;author Timothy Echeandia
;strategy Well I am rather new to corewar so I tried combining imp
;strategy and dwarf. You get a more deadly imp an thereby the name orc. I am
;strategy running corewars the X11 version and it survived against xtc. I think
;strategy that this warrior more survives and ties than kills off. Right now
;strategy killing off is giving me problems.
;assert 1
orc	mov	orc,	orc+1
bomb    dat     #0,     #0
bomber  add     #-4,    bomb
	mov     bomb,   @bomb
	jmp     bomber
	end	orc
