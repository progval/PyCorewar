;redcode-94nop
;name Uncertainty
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy clr
;oneshot / bomb dodger

more equ clr
ini equ 134

	org sc1
	for 71
	dat 0, 0
	rof
pok	dat ini, ini+4000
	dat 0, 0
	dat 0, 0
	dat 0, 0
w	dat 1, 13
clr	spl #13, 13
	mov *w, >pok
	mov *w, >pok
cend	djn.f -3, }clr
	for 7
	dat 0, 0
	rof
d	dat 0, 0
	dat 0, 0
stop	add.f more, pok
sc1	jmn.f choose, >pok
sc2	jmz.f stop, }pok
swap	mov.x @sc1, @sc1
choose	seq d, >pok
	jmp }cend, <pok
cboot	add.ba @sc1, cgo
	mov >cgo, }cgo
	djn.b -1, #4
	mov >cgo, *cgo
cgo	jmp }(pok-4), w
	end

