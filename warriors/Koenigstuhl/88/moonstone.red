;redcode
;name Moonstone 1
;author Dan Nabutovsky
;strategy bomb, then coreclear, then JMP 0,<-15
;assert 1

	MOV 7, <-7
incr 	MOV 7, <-7
start 	SPL 0
loop 	MOV <75, -74
	ADD incr, loop
	DJN loop, <4400
	JMN -1, 303
	JMP 0, <-15

	END start
