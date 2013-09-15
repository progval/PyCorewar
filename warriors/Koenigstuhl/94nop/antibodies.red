;redcode-94b
;name Antibodies
;author Andrew Fabbro
;version Mark I
;assert CORESIZE==8000

radar	ADD	#2936, #3999	; mod-8 scanning
	JMZ.F	radar, @radar	
bombrun	MOV	bomb1, >radar	
	MOV	bomb2, @radar	
adjust	SUB	#1, radar	; restores pointer to mod-8
	DJN	radar, #200
	JMP	cclear

marker	DAT	#0, #0		; ****************

bomb1	SPL	0, 8
bomb2	MOV	-1, <-1		
cclear	SPL	0, 0		; standard recipe core-clear
        MOV	marker, <-1
        JMP	-1, -1

	END	radar
