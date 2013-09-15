;redcode
;name Stalin is dead too
;author Max Stahl & Planar
;assert 1

core		DAT	0,0
scan		ADD.AB	#1,#7
        	SEQ.I	core, @scan
		MOV.I   core, @scan
		SEQ.AB	#-1, scan
		JMP	scan
		MOV.AB	#7, scan
		JMP	scan
		END	scan
