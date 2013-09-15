;redcode-x  
;name Middle-Earth_1.4
;author Rob Shultz
;strategy  warrior that uses a hobbit,dwarf,mute,and imp
;assert 1

dist	EQU	333
start	SPL	dwarf
	SPL	hobbit
	SPL	imp
	MOV	<start-1,<start-1
	ADD	#dist,here
here	DJN	start,<0
	JMP     start
bomb	DAT	#0
missle	DAT	#0
dwarf	ADD	#33,bomb
	MOV	bomb,@bomb
	JMP	dwarf
hobbit	ADD	#-17,missle
	MOV	missle,@missle
	JMP	missle
imp	MOV	imp,	imp+1
	END 	start
