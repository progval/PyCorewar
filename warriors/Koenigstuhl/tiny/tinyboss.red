;redcode-94x
;name Tiny Boss
;author Neogryzor
;assert CORESIZE==800

;strategy Oneshot
; I never thought that a oneshot could be so deadly!
; Thanks to Metcalf for his hints.

	S EQU 2*15		;mod5
	D1 EQU 2*15
	D2 EQU 2*15+5
	N EQU 79

LOOP:	SUB.F STEP,SCAN
SCAN:	SNE.I D2,D1		;<- Ref
	DJN LOOP,#N
STEP:	SPL #-S,<-S
	MOV @BPTR,>SCAN
	MOV @BPTR,>SCAN
BPTR:	DJN.F -2,{SPB
DAB:	DAT #-10,SPB-SCAN
SPB:	SPL #-10,1-SCAN

	END SCAN

