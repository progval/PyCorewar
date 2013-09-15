;redcode-94nop
;name Teenage Metal Isis v0.6b
;author Pascal Hofstee
;mentor Mizcu
;assert (CORESIZE==8000)

		ORG	qGo

silkStepA	EQU	4723
silkStepB	EQU	2803
silkStepC	EQU	4135
bootStep	EQU	1113
bombStep	EQU	3870
bombLoc		EQU	3388

zero		EQU	qbomb
qtab3		EQU	qbomb

qbomb		DAT	>qoff,	>qc2
		DAT	0,	0

paper		SPL	1,	<qb1
qtab2		SPL	1,	<qb2
		SPL	1,	<qb3

		MOV.I	<1,	{1
		SPL	bootStep,	silkA+8

silkA		SPL	@0,	<silkStepA	; frontend-silk
		MOV.I	}silkA,	>silkA

silkB		SPL	@0,	<silkStepB	; center-silk
		MOV.I	}silkB,	>silkB

		MOV.I	#1,	{1
		MOV.I	bombLoc,>bombStep

		MOV.I	{silkB,	<silkJump	; backend-silk
silkJump	JMZ.A	@0,	silkStepC



FOR 6
		DAT	0,	0
ROF 

		DAT	zero-1,	qa1
qtab1		DAT	zero-1,	qa2 

FOR 42
		DAT	0,	0
ROF

qz		EQU	2108
qy		EQU	243

qc2		EQU	((1 + (qtab3-qptr)*qy) % CORESIZE)
qb1		EQU	((1 + (qtab2-1-qptr)*qy) % CORESIZE)
qb2		EQU	((1 + (qtab2-qptr)*qy) % CORESIZE)
qb3		EQU	((1 + (qtab2+1-qptr)*qy) % CORESIZE)
qa1		EQU	((1 + (qtab1-1-qptr)*qy) % CORESIZE)
qa2		EQU	((1 + (qtab1-qptr)*qy) % CORESIZE)
	
qGo		SNE	qptr + qz*qc2,		qptr + qz*qc2 +qb2
		SEQ	<qtab3,			qptr + qz*(qc2-1) + qb2
		JMP	q0,			}q0
		SNE	qptr + qz*qa2,		qptr + qz*qa2 + qb2
		SEQ	<qtab1,			qptr + qz*(qa2-1) + qb2
		JMP	q0,			{q0
		SNE	qptr + qz*qa1,		qptr + qz*qa1 + qb2
		SEQ	<(qtab1-1),		qptr + qz*(qa1-1) + qb2
		DJN.A	q0,			{q0
		SNE	qptr + qz*qb3,		qptr + qz*qb3 + qb3
		SEQ	<(qtab2+1), 		qptr + qz*(qb3-1) + (qb3-1)
		JMP	q0,			}q1
		SNE	qptr + qz*qb1,		qptr + qz*qb1 + qb1
		SEQ	<(qtab2-1),		qptr + qz*(qb1-1) + (qb1-1)
		JMP	q0,			{q1
		SNE	qptr + qz*qb2,		qptr + qz*qb2 + qb2
		SEQ	<qtab2 ,		qptr + qz*(qb2-1) + (qb2-1)
		JMP	q0
		SEQ	>qptr,			qptr + qz + (qb2-1)
		JMP	q2,			<qptr
		SEQ	qptr+(qz+1)*(qc2-1),	qptr+(qz+1)*(qc2-1)+(qb2-1)
		JMP	q0,			}q0
		SEQ	qptr+(qz+1)*(qa2-1),	qptr+(qz+1)*(qa2-1)+(qb2-1)
		JMP	q0,			{q0
		SEQ	qptr+(qz+1)*(qa1-1),	qptr+(qz+1)*(qa1-1)+(qb2-1)
		DJN.A	q0,			{q0
		JMZ.F	paper,			qptr + (qz+1)*(qb2-1) + (qb2-1)

qoff		EQU	-87
qstep		EQU	-7
qtime		EQU	14

q0		MUL.B 	*2,	qptr
q2		SNE	{qtab1,	@qptr
q1		ADD.B	qtab2,	qptr
		MOV	qtab3,	@qptr
qptr		MOV	qbomb,	}qz
		SUB	#qstep,	qptr
		DJN	-3,	#qtime
		JMP	paper 

		END

