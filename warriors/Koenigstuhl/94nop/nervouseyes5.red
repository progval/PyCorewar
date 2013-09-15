;redcode-94
;name Nervous Eyes v5
;author A. Pagaltzis
;assert CORESIZE == 8000
;strategy 1c scanner

PASSES	EQU 1
TARG1	EQU 100
TARG2	EQU 4105
INCR	EQU 10

next	add.f incr, scan
scan	sne.i TARG1, TARG2
	jmz.f next, >scan

	slt.f scan, guard
	jmp.f clear

attack	mov.i bomb, }scan
	mov.i bomb, >scan
	mov.i bomb, }scan
	mov.i bomb, >scan
	jmp.i next, >scan

clear	djn.b next, #PASSES*4 ; finds self 4x/pass

	mov.i cbomb, bomb
cloop	mov.i cbomb, <bomb
	mov.i cbomb, <bomb
	mov.i cbomb, <bomb
	jmp.f cloop

incr	jmp.i #INCR, #INCR-1 
guard	dat.f #20, #20
cbomb	dat.f #0, #next-1
bomb	dat.f #0, #0

end scan

