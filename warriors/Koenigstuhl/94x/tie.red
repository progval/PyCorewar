;redcode-x2
;name Tie
;strategy Oh, I give up.  At least this won't lose much.
;author Ilmari Karonen
;assert (CORESIZE == 55440) 
;(MAXPROCESSES == 10000)

step13	EQU	34117

silk	spl	1
	spl	1
	mov.i	-1, 0
	mov.i	-1, 0

	spl	#0
	add.a	#step13, launch
launch	jmp	imp-step13*13

imp	mov.i	#0, step13

	end silk


