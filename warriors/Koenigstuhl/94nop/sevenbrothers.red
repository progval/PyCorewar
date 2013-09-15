;redcode-94
;name Seven Brothers
;author David Moore
;assert CORESIZE==8000

	size equ 1143

	c1 equ 2365
	c2 equ 5715

start   spl  1, 0       ; start 7 parallel processes
	spl  1, 0
	mov -1, 0

paper   spl   @0,   c1
	mov  }-1,  >-1
        spl   @0,   c2+size
	mov  }-1,  >-1
	spl   @0,   c2
	mov  }-1,  >-1

imp     mov.i #1, size

end
