;redcode-b
;name D'arko
;author Scott Manley
;strategy 0.6c Mod10/2 bomber -> core clear
;strategy Pspaced paper, better boot code 
;assert 1

	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
last	DAT	1,1
lost	DAT	1,1
plyd	DAT	1,1
strat	DAT	1,1
think	LDP.A   #0,last ;Won/lost
	LDP.A	#1,lost ;Battles lost
	LDP.A   #2,plyd ;Battles Played
	LDP.A 	#3,strat ;Dominant Strategy
	ADD.A	#1,plyd
	SNE.AB	last,#0
	ADD.A 	#1,lost
	SLT.AB	plyd, #20
	JMP	think2
	JMP	store
think2	STP.AB	lost,#1
	STP.AB	plyd,#2
	SUB.A	lost,plyd
	SLT.A	plyd,lost
	JMP 	decided
	STP.AB	#0,#1
	STP.AB	#0,#2
	SEQ.AB	strat,#0
	MOV.A	#-1,strat
	ADD.A	#1,strat
	STP.AB	strat,#3
decided	SEQ.A 	#0,strat
	JMP	paper
	JMP	boot
 store 	STP.AB 	lost,#1
	STP.AB	plyd,#2
	SEQ.A	#0,strat
	JMP	paper
boot	MOV.I	inc, -2500
	MOV.I   {boot,<boot
	MOV.I	{boot,<boot
	MOV.I	{boot,<boot
	MOV.I	{boot,<boot
	MOV.I	{boot,<boot
	MOV.I	{boot,<boot
	MOV.I	{boot,<boot
	MOV.I	{boot,<boot
	JMP	-2517
loop1	MOV	splb,*2
	MOV	jmpb,@1
	MOV	-2432,*-2430
	ADD.F	inc,-1
	DJN	loop1,#799
splb	SPL	0,<-3
	MOV	2,<1
jmpb	JMP	-1,<-3
inc	DAT	-2430,-2430
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
paper	SPL	1, <300
	SPL	1, <400
	SPL	1,<500
silk	SPL	@0,{2200
	MOV.I	}-1,>-1	
silk1	SPL	@0,<3740
	MOV.I	}-1,>-1
	MOV.I	bom,>933
	MOV	{silk1,<silk2
silk2	JMP	@0,>-1278
bom	DAT	<2667,<1
	DAT	0,0
	DAT 	0,0
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1
	DAT	1,1

	END	think	

