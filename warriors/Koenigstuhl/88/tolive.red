;redcode
;name To Live Is To Die 3.5
;author Jarkko Lindblad
;strategy SPL-bomber with core clear
;assert  1
tappo	MOV	4,	<-1
start	MOV	bmb,	@bmb
	SUB	#5138,	bmb	;this will be bombed
bmb	SPL	-2,	-998
END start
