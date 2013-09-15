;redcode-94nop
;name TheWingsOfTheHydra_v1.0
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy bishot

step equ (-13)

	org scan
gate	dat -4052, 4059
b	dat -1086, 2
	dat -11, 11
poc	spl #-11, 11
	mov poc, >gate
	mov poc, {gate
	djn.a -2, {b
	for 6
	dat 0, 0
	rof
incr	sub.f #-step, step
scan	sne *gate, @gate
	sub.f incr, @incr
	sne *gate, @gate
	djn.f incr, *gate
	jmp poc, 0
	end

