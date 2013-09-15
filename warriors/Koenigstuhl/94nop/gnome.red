;redcode-open
;name Gnome
;author Nathan McKenzie
;strategy dwarf/vampire/core-clear/imp gate -> imp
;assert CORESIZE == 8000

org
start	Mov 0, 0	;does nothing, but it is critical
	spl 0
dwarf	add #16, pntr
calc	mov.a #(pntr-(pntr*2))+1, bomb	;calculates where the enslaved
should go
	mov bomb, @pntr		;enslaves at regular intervals (mod 20)
	sne.f start, #0		;why the first instruction is so important
	jmp dwarf
	mov 2, stop+1		;bootstraps imp
	jmp stop+1
	mov 0, 1	;imp
pntr	dat 0, 6
bomb	jmp 0
pit	spl 0		;reproduces enslaved vampires
	mov pntr, start-1	;imp gate
	mov pntr, >1	;core-clear
stop	;this looks crazy, but it's important for the imp
end

