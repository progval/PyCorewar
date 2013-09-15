;redcode-94nop
;name Xerox v0.1
;strategy paper
;author Andrew Hunter
;assert CORESIZE==8000

sstart 	spl 1
	spl 1
	spl 1 
	spl 1
silk 	spl 3620, 0
	mov >-1,}-1
	spl 6593, 0
	mov >-1,}-1
fsilk 	spl 1324,0
	mov >-1,}-1
	mov bomb, >2113
	mov bomb, }2042
	mov bomb, >1000
	mov bomb, >bomb+1
	mov bomb, >4690
	mov bomb, <3250
	mov bomb, {2490
	add.a #50, fsilk
	jmp fsilk, <fsilk
bomb    dat >2667,>5334

	end sstart

