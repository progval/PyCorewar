;redcode-94nop
;name The Boss
;author G.Labarga
;assert CORESIZE==8000
;startegy bishot-style scanner
;strategy fast decoy, 0.66c scan, core colouring, bomb detection
;strategy v5, slight changes

	SMOD EQU 5              ; maybe i should try mod7 and others
	DECOY EQU SCAN+501+(4506*15)
	STEP EQU SMOD*6691	;<- poorly optimized constant
	D1 EQU 2*STEP
	D2 EQU 1*STEP

GATE:	DAT SCAN+D1,SCAN+D2
FOR 7
	DAT 0,0
ROF
INC:	SPL #-(2*STEP)+1,>-(2*STEP)+1   ;nice coreclear killing imps
CLOP	MOV SBM,}GATE
	MOV SBM,>GATE
DIR:	DJN.A CLOP,<GATE+1
FOR 7
	DAT 0,0
ROF
DBM:	DAT <2667+1,22
SBM:	SPL #2667+22,22
FOR 40
	DAT 0,0
ROF
LOOP:	SUB.F INC,@SCAN		;becomes @2 (decoy)
SCAN:	SEQ.I }GATE,>GATE	;<-ref
BCHK:	SNE.I *GATE,@GATE	;bomb check
	DJN.F LOOP,*GATE        ;trashing core
	DJN.F INC,@BCHK
FOR 23
	DAT 0,0
ROF
	SPL #1,{1
	SPL #1,}1
	SPL #1,#1
	dat 0,0
START:	MOV.I {DECOY,<DECOY+5		;transparent ~3c decoy maker (2.5c)
	MOV.I {DECOY+1,<DECOY+8		;for not to trigger the clear
	MOV.I {DECOY+6,<DECOY+3
	DJN.F >LOOP,<DECOY+11
	dat 0,0
	SPL #1,{1
	SPL #1,}1

	END START

