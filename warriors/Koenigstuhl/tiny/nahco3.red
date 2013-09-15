;redcode-94
;name NaH-CO3
;author G.Labarga
;assert CORESIZE==800

;strategy Bombing Oneshot scanner
;strategy Tinyboss II modified
;strategy 0.5c scan, 0.25c bomb -> partial anti-imp ~0.66c S/D clear

	STEP EQU 2*17*4
	D1 EQU 2*STEP
	D2 EQU 2*STEP-4

LOOP:	SUB.F INC,*SPB
	MOV DAB,*1
SCAN:	SNE.I @D2,D1		;<- Ref
	JMN.B LOOP,SCAN
INC:	SPL #-STEP,<-STEP
	MOV @LOOP,>SCAN
	MOV @LOOP,>SCAN
	JMP -2,<INC-STEP
DAB:	DAT <267,8
SPB:	SPL #SCAN,8

	END SCAN

