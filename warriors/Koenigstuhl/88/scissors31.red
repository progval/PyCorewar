;redcode
;name scissors3.1
;author Scott Nelson
;strategy  capture the enemy and put him to work.
;strategy  only 5 code lines, scans every location.
;strategy 
;strategy  3.1 - fewer DAT statements
;assert 1
 
start	add	addval,	jp	;scan for non-zero B-field (double add)
	jmz	start,	@jp	;
 
	slt	#-16,	jp	;O.K. if it's me skip the next instruction
	mov	jp,	@jp	; not me! bombs away
	jmp	start		;go find another one.
 
;
; slave pit
;
pit	spl	1		;enemy comes in here
	spl	1
addval	mov	11,	<-11	;this is multi-purpose, it will
				;elimate other enemies, kill the pit
				;after clearing core, and I use it as
				;an ADD value in the main code.
	jmp	pit
;
jp	jmp	pit		;jp at end so SLT will work right
 
	end	start
