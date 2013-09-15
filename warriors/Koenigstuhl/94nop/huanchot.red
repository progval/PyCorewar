;redcode-94
;name   Huanchot
;author G.Labarga
;ASSERT CORESIZE==8000

;strategy	0.5c Oneshot scanner (mul)
;	No add/sub allowed
;	Lots of paper/imps expected, (or paper/stone)
;	and my paper/stone doesn't work fine, so I try a oneshot

	CTE EQU 9	; looks to be easy but it is really hard
	FCT EQU 9	; to find the correct constants

LOOP:	MUL #FCT,#CTE
SCAN:	JMZ.F LOOP,<LOOP
INC:	SPL #0,<-150
	MOV @DIR,>LOOP
DIR:	DJN.F -1,{BM1
BM2:	DAT #-10,6
BM1:	SPL #-10,6

	END SCAN

