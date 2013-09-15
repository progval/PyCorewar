;redcode
;name Retrovirus
;author Ray Cromwell
;(rjc@gnu.ai.mit.edu)
;USA
;September 1991
;strategy Subvert other program tricking it into impstomping and copying
;strategy our virus for it.
;assert 1
;Here is where the main debugging has to be concentrated. Make sure
;these offsets or correct or the subvert wil execute the wrong instruction.

sizeprog    equ (endprog-startprog)
rnaoffset   equ (virusrna-mainloop)

startprog   dat #0
impstomp    mov #0, -1
	    mov #0, -2
	    mov #0, -3
	    mov #0, -4
	    jmp impstomp
jmp0	    jmp 0
jmp1	    jmp 1
jmp5	    jmp 5
jmpvec	    jmp 600+rnaoffset ; make sure jmp points to "virusrna" routine
memptr	    dat #-600
tmp	    dat #0
execaddr    dat #0
size	    dat #0
ptr	    dat #0
dest	    dat #0
delta	    dat #0

start	    mov jmp1, startprog		   ; Put a nop in the beginning
	    mov jmp5, tmp		   ;
	    sub jmp0, tmp		   ; Find jmp5-jmp0
	    mov jmp1, delta		   ;
	    sub jmp0, delta		   ; Find jmp1-jmp0
	    spl exec			   ; start rna dispatcher
mainloop    cmp #0, @memptr		   ; scan for nonzero code
	    jmp subvert 		   ; if non zero, subvert it!
	    sub #5, memptr		   ; sub 5 from ptr
	    add tmp, jmpvec		   ; add 5 to jmp instruction
	    jmp mainloop		   ; loop

subvert     sub #6, memptr                 ; 6 instructions from cmp #0 #memptr
            mov jmpvec, @memptr		   ; poke jmp vector(subvert!)
	    sub #1, memptr		   ; sub 1 from ptr
	    add delta, jmpvec		   ; add 1 to jmp vector
	    add #6, memptr
	    jmp mainloop		   ; loop


code	    spl @execaddr

exec	    jmp 1			   ; dispatcher
	    cmp exec, code		   ; Execute another virus copy
	    jmp exec			   ; after our opponent has
	    mov jmp1, exec		   ; graciuously copied it then
	    jmp exec			   ; change the spl back into a nop.

virusrna    spl impstomp		   ; make the other program protect us!
	    mov #sizeprog, size		   ; find size
	    mov #endprog, ptr		   ; get ptr at end
	    mov #400, dest		   ; copy 400 ahead
cploop	    mov <endprog, <dest		   ; copy it
	    djn cploop, size		   ;
exc	    mov #409, execaddr  	   ; exec begging of code
	                                   ; it is 9 instructions from
		 	                   ; exec to cploop

	    mov code, exec		   ; trigger activation
endprog     dat #0			   ; kill the other program's process

            end start
