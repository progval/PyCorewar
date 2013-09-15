;redcode-94nop
;name Xerox v0.2
;strategy paper,bomber?
;strategy weird versino
;author Andrew Hunter
;assert CORESIZE==8000

sstart 	spl 1
	spl 1
	mov -1,0 
	mov -1,0
silk spl 3620, 0
	mov >-1,}-1
	spl 6593, 0
	mov >-1,}-1
fsilk 	spl 1324,0
	mov >-1,}-1
incr 	spl #34,#38
ststart mov bomb, *stone
	mov bomb, @stone
stone 	mov 6,<46
	add.f incr, stone
	djn.f ststart, tail
tail bomb dat 34, 38

	end sstart

