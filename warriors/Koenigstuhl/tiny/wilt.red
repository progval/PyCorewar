;redcode-94
;name Wilt ;)
;author G.Labarga
;assert CORESIZE==800

;strategy	Qbomb->paper
;strat		The constants have been optimized, but i'm not satisfied 
;strat		at all with the results

	DEST1 EQU 185
	DEST2 EQU 275
	ATTK EQU 632
	AT1 EQU 756
	AT2 EQU 576

PLCH:	SPL 2,{QBOMB+40+20*23
	SPL 2,{QBOMB+40+21*23
	SPL 1,{QBOMB+40+22*23
PBOT:	MOV <1,{1
	SPL PAP1+404,PAP2+1
PAP1:	SPL @0,DEST1
	MOV }PAP1,>PAP1
	MOV.I <AT1,{AT2
	MOV {PAP1,{PAP2	;<PAP2
PAP2:	JMP.F DEST2,<ATTK
QBOMB
I FOR 9
	MOV.I {QBOMB+40+I*23,QBOMB+40+(I+9)*23
ROF
	JMP PLCH,{QBOMB+40+19*23

	END QBOMB

