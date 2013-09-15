;redcode
;name Multi-Gate Bombing run
;author Kurt Kirkham
;assert 1

launch       	SPL bombfwd		; Start bombing run forward
                JMP bombbkwd		; Start bombing run backwards
; << Code above here gets over-written >>
bomb1       	DAT #0,#0               ; Gate for imps
bombbkwd 	MOV.I bomb1,<-1		; Bomb backwards pre-increment b-field
        	JMP bombbkwd		; loop
;
bombfwd		MOV.I bomb2, >2		; Bomb forwards
        	JMP bombfwd		; loop
bomb2		DAT #0, #1		; Gate for imps
		END launch

