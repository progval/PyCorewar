;redcode
;name Impressive
;author Dan Nabutovsky
;strategy Impossible + self-splitting dwarf
;assert CORESIZE==8000

d EQU 2667
i EQU (imp-1000)
imp: mov 0,d

start: mov imp, i
spl 32
spl 16
spl 8
spl 4
spl 2
jmp i+d*0
jmp i+d*1
spl 2
jmp i+d*2
jmp i+d*3
spl 4
spl 2
jmp i+d*4
jmp i+d*5
spl 2
jmp i+d*6
jmp i+d*7
spl 8
spl 4
spl 2
jmp i+d*8
jmp i+d*0
spl 2
jmp i+d*1
jmp i+d*2
spl 4
spl 2
jmp i+d*3
jmp i+d*4
spl 2
jmp i+d*5
jmp i+d*6
spl 16
spl 8
spl 4
spl 2
jmp i+d*7
jmp i+d*8
spl 2
jmp i+d*0
jmp i+d*1
spl 4
spl 2
jmp i+d*2
jmp i+d*3
spl 2
jmp i+d*4
jmp i+d*5
spl 8
spl 4
spl 2
jmp i+d*6
jmp i+d*7
spl 2
jmp i+d*8
jmp i+d*0
spl 4
spl 2
jmp i+d*1
jmp i+d*2
spl 2
jmp i+d*3
jmp dwarf

	DAT #0
	DAT #0
	DAT #0
	DAT #0
	DAT #0
	DAT #0
	DAT #0

	MOV 7, <-7
incr:	MOV 7, <-7
dwarf:	SPL 0
loop:	MOV <75, -74
	ADD incr, loop
	DJN loop, <4400
	JMP -1

END start
