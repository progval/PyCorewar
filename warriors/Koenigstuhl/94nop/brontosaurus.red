;redcode-94
;name Brontosaurus
;author German Labarga
;assert CORESIZE==8000

;strategy       0.5c Stone (mod4)
;strategy       Improved version of BMZ
;		Warrior size: 32 instructions

	STEP EQU 76		;mod4 bombing
	LOCT EQU 2000
	EXEC EQU LOCT-13

BOOT:	MOV.I <SOURCE,<DEST	;13 instr.
	MOV.I <SOURCE,<DEST	;Left as decoy
	MOV.I <SOURCE,<DEST
	MOV.I <SOURCE,<DEST
	MOV.I <SOURCE,<DEST
	MOV.I <SOURCE,<DEST
	MOV.I <SOURCE,<DEST
	MOV.I <SOURCE,<DEST
	MOV.I <SOURCE,<DEST
	MOV.I <SOURCE,<DEST
	MOV.I <SOURCE,<DEST
	MOV.I <SOURCE,<DEST
	MOV.I <SOURCE,<DEST
	MOV.I <SOURCE,<DEST
DEST:	SPL EXEC,LOCT		;Starts the stone
	SUB.F DEST,DEST		;Erase pointers
	DAT 0,0			;Kills second process

BMB:	SPL #ADJ-REF,<-STEP	;Bomb, (pointers and imp-gate)
LOOP:	MOV.I BMB,@1		;<- START *****
REF:	MOV.I *-1,@3*STEP	;<- Ref and hit
	ADD.AB #2*STEP,REF
	DJN.B *REF,<BMB-300	;Paper detect/jump when self-hit
SETC:	MOV.AB #2,#CLEAR
A_PAP:	SPL #0,<0		;<- hit
	SPL *1,<-76		;Try to tie when paper is detected
	MOV.I #2667,}0		;... launching modified imps :)
ADJ:	JMP @SETC,<CHK
	DAT 0,0			;<- hit
CLEAR:	MOV.I @0,<BMB		;SPL/DAT core clear
CHK:	JMZ CLEAR,10
	DJN.B ADJ,CLEAR

SOURCE:	DAT 0,0			;Used as pointer for boot

	END BOOT

