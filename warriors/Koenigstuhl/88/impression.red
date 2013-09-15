;redcode
;name Impression v3
;author Dan Nabutovsky
;strategy 2 imp spirals + self-splitting dwarf
;assert CORESIZE==8000

d EQU 2667
i EQU (imp-2000)

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
spl dwarf
spl dwarf
spl dwarf

	DAT #0
	DAT #0
	DAT #0
	DAT #0
	DAT #0
	DAT #0
	DAT #0

inc      dat #-2045,#2045
dwarf    spl 0,100
stone    mov <cnt+102-300,<cnt+100
	 add inc,stone
cnt      djn stone,<-3799


END start
