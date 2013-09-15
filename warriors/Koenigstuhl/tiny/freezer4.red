;redcode-tiny
;name	Freezer4
;author G.Labarga
;assert CORESIZE==800
;strategy blur-style scanner
;strategy lost in my HD

	S EQU 16
	D1 EQU S
	D2 EQU S+5     ;oh, i had a typo here! should be S+8

pt:	dat 0,620
LOOP:	MOV.I INC,>pt
SCAN:	SEQ.I D1,D2		;<- Ref
PTR:	MOV.AB SCAN,pt
NEXT:	SUB.F INC,SCAN
	JMN.A LOOP,SCAN
INC:	SPL #-S,-S
	mov dbm,>-9
	djn.f -1,>-10
dbm:	dat <267,14

	END SCAN

