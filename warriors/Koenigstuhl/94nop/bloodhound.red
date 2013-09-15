;redcode-94b
;name Bloodhound
;author Andrew Fabbro
;assert CORESIZE==8000
;strategy	CMP scanner, stunning munitions, SPL/DAT coreclear
;strategy	Finishes off prey it finds before continuing the hunt.

gate		EQU	radar-1
bombduration	EQU	130
bomblength 	EQU	4

		ORG	scan

radar		DAT	#2667, #5334
loop		ADD 	step, radar		
scan		SEQ.F	*radar, @radar
avoid		SLT.I	check, radar
meter		JMP	loop, #bombduration

bombrun		MOV	bomb1, }radar
		MOV	bomb1, >radar
		MOV	bomb2, }radar
		MOV	bomb2, >radar
		DJN	scan, meter		; pointer is moved, skip ADD

cptr		SPL.B	#4, #5			; core-clear
cloop		MOV.I	*cptr, >cptr
		DJN	-1, <gate
		DAT.F	#3, #5
		SPL.B	#3, #5

step		DAT	#3039, #3359
check		DAT	#20, #20
bomb1		SPL.A	#0, #8
bomb2		MOV	-1, <-1

