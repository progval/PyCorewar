;redcode-94
;name Smart Protoceratops
;author German Labarga
;assert CORESIZE==8000

;strategy       P-SWITCHER scissors/paper
;strategy       SPL-carpeting scanner / 3-split Silk
;strat-         Scanner is Neoshot "Multi-shot"
;strat-         Silk is based on Papirus IV
;strat-         Both made by me ;)
;		Warrior size: 46 instructions

		;Main constants *
	PAPER EQU 19
	SHOT EQU 4019
	LOC EQU 2000
		;scanner constants *
	S EQU 76	;(mod4 scan)
	D1 EQU 1*76+2
	D2 EQU 2*76+2
	N EQU 999
		;Paper constants* (Bad)
	DEST1 EQU 3364
	DEST2 EQU 5524
	DEST3 EQU 808

	ORG RESULT

RESULT:	LDP.AB #0,#0		;<- Last round result
STRAT:	LDP.AB #1,#0		;<- Last strategy
	JMN.B 2,RESULT
	ADD.AB #4000,STRAT	;If lost: switch strategy
	SEQ.AB #PAPER,STRAT	;Check if paper
	JMP 3,<-500
	SUB.AB #11,PTR
	JMP SAVE,<-502
	SEQ.AB #SHOT,STRAT	;Check if shot
	MOV.AB #SHOT,STRAT	;First round or brainwashed: Shot
SAVE:	STP.B STRAT,#1		;Save strategy
BOOT:	MOV.I <PTR,{PTR		;Copy 10 ins
	MOV.I <PTR,{PTR
	MOV.I <PTR,{PTR
	MOV.I <PTR,{PTR
	MOV.I <PTR,{PTR
	MOV.I <PTR,{PTR
	MOV.I <PTR,{PTR
	MOV.I <PTR,{PTR
	MOV.I <PTR,{PTR
	MOV.I <PTR,{PTR
PTR:	SPL @LOC,SOURC1		;Starts selected strategy
	SUB PTR,PTR		;Erase pointers
	DAT 0,0

PAP:	SPL 1,0			;<- Paper: 10 ins *START*
	SPL 1
	MOV.I -1,0
PNT1:	SPL @0,DEST1		;Paper
	MOV.I }PNT1,>PNT1
	MOV.I {PNT1,<PNT2
PNT2:	SPL @0,DEST2
	MOV.I <-705,<710 	;Attack
	MOV.I >PNT3,}PNT3
PNT3:	JMP.A @DEST3,-6

SOURC2:	DAT 0,0			;Source pointer for boot paper

DIR:	DAT 4000,4		;SPL-carpeting scanner: 9 ins
	DAT 0,0
LOOP:	SUB.F STEP,SCAN
START:	MOV.I STEP,}DIR
SCAN:	SEQ.I D1,D2		;<- Ref (+1) START ******
	MOV.A SCAN,DIR
	DJN LOOP,#N
STEP:	SPL #-2*S,<-2*S		;Core clear + Imp gate
	MOV.I 1,<-2
	DAT 0,0
SOURC1:	DAT 0,0			;Source pointer for boot scanner

	END




