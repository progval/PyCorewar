;redcode-94
;name Mad pixel
;author Neogryzor
;strategy Qbomb->paper
;strategy 2c Qbomb, (1c bomb + 1c dec)
;strategy The Qbomb seems to score better than Qscan against tiny scanne
;assert CORESIZE==800

	DEST1 EQU 484
	DEST2 EQU 290

QBOMB				;The Quick punch :)
I FOR 12
	MOV.I {QBOMB+40+I*23,QBOMB+40+(I+12)*23
ROF
PLCH:	SPL 1,{0
	SPL 1,{QBOMB+40+23*23
PBOT:	MOV <1,{1
	SPL PAP1+404,PAP2+1
PAP1:	SPL @0,DEST1
	MOV }PAP1,>PAP1
	MOV {PAP1,{PAP2	;<PAP2
PAP2:	DJN.F DEST2,<110

	END QBOMB

