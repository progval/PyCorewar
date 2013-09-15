;redcode-94
;name Nervous Eyes v2
;author A. Pagaltzis
;assert CORESIZE==8000
;strategy 1c scanner

TARG1	EQU 100
TARG2	EQU 500
INCR	EQU 10
BLEN	EQU INCR

next	add.f incr, scan
scan	sne.i TARG1, TARG2
	jmz.f next, >scan

; -- bombing start --

wipe	mov.i bomb, }scan
	mov.i bomb, >scan
	djn.b wipe, #BLEN
	mov.ab #BLEN, -1
	jmp.i next, >scan

; -- bombing end --

incr	dat.f #INCR, #INCR-1
bomb	dat.f #0, #0

end scan

