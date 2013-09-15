;redcode-nano
;name Malevolo
;author G.Labarga
;assert CORESIZE==80
;strategy Scanner
;strategy 4 lines!
;slower attack

	bmb equ (loop-1)
	ptr equ loop

loop:	add.ab #4,#9
scan:	jmz.f loop,>ptr
	mov.i bmb,<ptr
	jmp scan,<ptr
end scan

