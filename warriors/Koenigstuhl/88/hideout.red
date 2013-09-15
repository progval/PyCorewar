;redcode
;Name		HideOut D
;Author		Stig Hemmer
;               (stig@lise.unit.no)
;assert 1
;strategy	Search memory for enemy bomb (or enemy).  Copy a small
;strategy	bomber to the two locations preceding the bomb and JMP
;strategy	there. In case we found the enemy, we start bombing
;strategy	right (t)here.

where:		DAT	#-1
start:		JMZ	start,<where
		MOV	mbwhere,<where
		MOV	mybomber,<where
		JMP	@where
mybomber:	MOV	lastline,<mbwhere
mbwhere:	JMP	mybomber,#-1
lastline:	DAT	#0
		END	start
