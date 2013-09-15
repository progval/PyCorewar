;redcode verbose
;name Dwarf
;author A. K. Dewdney
;strategy Throw DAT bombs around memory, hitting every 4th memory cell.
;strategy   This program was presented in the first Corewar article.
;assert (CORESIZE % 4)==0
bomb	dat	#0
dwarf	add	#4,bomb
	mov	bomb,@bomb
	jmp	dwarf
	end	dwarf
