;redcode
;name The Shortest Worm
;author Lukasz Adamowski
;assert 1

LENGTH	equ 8
WHERE	equ 100

start	mov #LENGTH,		$0
	mov <-1,		<(WHERE+LENGTH-1)
	jmn $-1,		$-2
	jmp @(WHERE+LENGTH-3)
	end start

