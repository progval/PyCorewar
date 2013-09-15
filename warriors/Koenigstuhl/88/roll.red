;redcode verbose
;name Roll v1.0
;author Peter Olcott
;strategy  Simple spl backwards, then bomb backwords when memory is covered.
;strategy  This program does not kill itself when it starts to clear memory
;assert 1
start mov 5,<5		;mov the spl 0 at the decremented pointer at the spl 0.
      djn -1,4		;decrement and jump if not zero -- double decrement.
      mov 2,3		;this part resets the code, substituting in dat #0's.
      jmp -3,#0		;jmp back and reset using the dat #0's.
      dat #0,#-5	;has to be -5, otherwise code will kill itself.
      spl 0,#-5		;this is the sting code.
      end start
