;redcode-94
;author Windrider
;name Hijack'
;assert CORESIZE==800
;strategy Hijacks threads with the help of a JMP bomb,
;strategy and makes them do the dirty work.
	SPL shoot
body	MOV trap,-2
	SUB #24,-1
	CMP.AB #7,-2
	JMP -3,-2
	MOV.B -1,body
	JMP body, <body-5
land	MOV murder,12
	ADD #1,-1
	SPL land, <body-5
	SPL land, <body-5	
murder	DIV 453,#0
trap	JMP 24, <body-5
	DAT 0,0
	DAT 0,0
shoot	MOV murder,3
	ADD #4,-1
	DJN shoot, <body-5  ; #7999
	MOV murder, -9
	JMP -4, <body-5

