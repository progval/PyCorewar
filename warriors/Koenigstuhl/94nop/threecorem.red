;redcode-b
;name Three Core Monty
;author Andrew Fabbro
;version 1.0
;strategy transposing stone
;strategy based on Matthew Householder's "Stone"
;contact afabbro@umich.edu
;assert CORESIZE==8000

magic		EQU 3364		; mod-4

start		SPL 0			; * start 2 processes
loop		MOV <2, 3		;
		ADD ptr, loop		;
		JMP loop		; B-field is not available
		DAT #0			; * 
ptr		DAT #-magic,#magic	; 

boot		MOV start, start+2666
		MOV loop, start+2667
		MOV loop+1, start+2668
		MOV loop+2, start+2669
		MOV loop+3, start+2670
		MOV loop+4, start+2671
		JMP @boot

decoy		FOR 85
			DAT boot+1, <boot	
		ROF

		END	boot
