;redcode-94
;name DB2
;author Robert Macrae
;strategy  Imp bomber 
;assert CORESIZE == 55440

; Trivial 1p 0.5c m4 DAT bomber and gate

STEP	equ	(4*269)
gate	equ	(stone-7)
  
loop    add     #2*STEP, stone            
    	mov     imp,     @stone   
stone   mov	imp,	 *STEP   
	djn	loop,    #(55440/8)-2
clear	mov 	>gate,	 }gate-1       ; align to avoid wipe?
	jmp     -1,      >gate   
imp	dat 	STEP,	 <1

	end

