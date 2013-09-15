;redcode-nano
;name The Core is never enough
;author G.Labarga
;assert CORESIZE==80
;strategy Scanner
;strategy Different engine. Faster scan, deadly attack.
;0.5c forward scan, backwards attack

	dest equ (scan+6)
	bmb equ (ptr-1)

ptr:	mov bmb,dest
	jmn.f ptr,<ptr
loop:	add #5,ptr
scan:	jmz.f loop,@ptr
	jmp ptr,>ptr

end scan

