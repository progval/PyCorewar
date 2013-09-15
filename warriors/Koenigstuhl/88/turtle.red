;redcode-x
;name turtle
;author Pierre Baillargeon
;assert 1

	spl 1,4		; two instructions create 3 synchronised
	mov -1,0	; process with a useful offset as the B op.
	djn @-1,-1	; use B op. to spread process on 3 consecutive
			; instructions
	mov 1,2		; mov forward
	mov 1,2
	mov 1,250	; bombs away !

	end
