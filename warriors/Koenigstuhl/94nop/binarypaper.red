;redcode-94x
;name Binary paper
;author Csaba Biro
;strategy Paper.

;assert 1

dest1 equ 2345
dest2 equ 3456

org start
start	spl 1
	spl 1

split	spl @0, dest1
	mov }split, >split
	mov {split, <jump
jump	jmp @0, <dest2

