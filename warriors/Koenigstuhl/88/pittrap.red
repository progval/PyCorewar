;redcode
;name PitTrap v2.3a
;author J.Cisek
;strategy creation date 4/6/92
;strategy steal processes into slave pit
;strategy slave pit is a simple bomber that kills itself
;strategy  v1.1  4/7/92 doesn't trap itself...
;strategy  v2.0  4/8/92 smaller code/quicker search
;strategy  v2.1  4/13/92 better slave pit
;strategy  v2.2a 4/22/92 better step value
;strategy  v2.3  4/24/92 decoys [v2.3a optimal step]
;assert CORESIZE==8000

INSTALL	equ 3000
STEP	equ 3044

init	mov trap, INSTALL
	mov intval, INSTALL
	mov bomb, INSTALL

here	mov search, INSTALL+1
	mov search+1, INSTALL+1
	mov search+2, INSTALL+1

	mov pit, INSTALL+2
	mov pit+1, INSTALL+2
	mov pit+2, INSTALL+2

	jmp INSTALL+here+1

trap	jmp pit+1, #-1
intval	dat #STEP, #-STEP
bomb	dat #trap

	dat #42

search	add intval, trap
	mov trap, @trap
	jmp search, #0

	dat #42

pit	mov bomb, <bomb
	spl pit, #0
	jmp pit, #0

	dat #42				; decoys
;fill the space after this point with as many dat #42's (or whatever)
;as you can fit.  It'll play havoc with scanning programs.

	end init

