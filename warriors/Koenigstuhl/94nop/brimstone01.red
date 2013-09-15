;redcode
;name Brimstone v0.1
;author Andrew Hunter
;assert CORESIZE==8000

	org boot
boot 	mov tail, 2145

for 6
	mov {boot, <boot
rof
	jmp @boot
	mov.ab boot, boot

x for 84
	dat x,x-1
rof

incr 	spl #34,#38
sstart	mov bomb, *stone
	mov bomb, @stone
stone 	mov 6,<46
	add.f incr, stone
	djn.f sstart, tail
tail 	bomb dat 34, 38
end

