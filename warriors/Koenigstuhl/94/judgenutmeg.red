;redcode-b
;name Judge Nutmeg
;author Scott Manley
;strategy Bring forth the Wheel of Justice!
;strategy Same tried and tested bombing engine as Uvavu/Hyakutake
;strategy Different backup strategy
;assert 1

strat	SPL	0,0
record	SPL	#0,#250
last	SPL	#0,#7
think	LDP.A	#0,last
	LDP.A	#1,record
	LDP.A	#2,strat
	ADD.AB	last,last
	JMP	@last
	JMP	boot
	JMP	lost
	JMP	won
	SLT.AB	record,record
	JMP	cs1
	STP	#0,#2
	JMP	boot,0
cs1	STP	#1,#2
	JMP	strat1
lost	ADD.A	#10,record
	MOD.A	#20,record
	ADD.A	#-10,record
	MOD.A	#2,strat
	JMZ.A 	ls0,strat
	STP	#0,#2
	ADD.A	#1,record
	STP.AB	record,#1
	JMP	boot
ls0	STP	#1,#2
	ADD.A	#-1,record
	STP.AB	record,#1
	JMP	strat1
won	JMZ.A	ws0,strat
	ADD.A	#-1,record
	STP.AB	record,#1
	JMP	strat1
ws0	ADD.A	#1,record
	STP.AB	record,#1
boot	MOV.I	jmpb, -3500
	MOV.I   {boot,<boot
	MOV.I	{boot,<boot
	MOV.I	{boot,<boot
	MOV.I	{boot,<boot
	MOV.I	{boot,<boot
	MOV.I	{boot,<boot
	MOV.I	{boot,<boot
	MOV.I	{boot,<boot
	MOV	-1,boot         ;really stupid......
	JMP	-3516
inc	DAT	<-2936,<-2936
loop1	MOV	splb,*2
	MOV	jmpb,@1
	MOV	-2938,*-2936
	ADD.F	inc,-1
	DJN	loop1,#999
splb	SPL	0,<-3
	MOV	inc,<1
jmpb	JMP	-1,<-3
	SPL	0,0
	DAT	0,0
strat1	MOV 	bck, 500
	MOV	{strat1,<strat1
	MOV	{strat1,<strat1
	MOV	{strat1,<strat1
	MOV	{strat1,<strat1
	MOV	{strat1,<strat1
	JMP	492
ptr	DAT.B	#8,#3
	DAT.F	#8,#1
	SPL.B	#8,#1
go	SPL.B	#8,#2
clr	MOV.I	@ptr,}ptr
bck	DJN.F	clr,<-12
	DAT 	0,0
	DAT	1,1
	DAT	1,1
	SPL	0,0
	SPL	0,1
	SPL	1,0
	SPL	1,1
	SPL	0,-1
	STP	0,>-1
	SPL	0,0
	STP	#0,{0
	SPL	0,1
	SPL	0,0
	STP	0,>-1
	SPL	1,0
	SPL	0,0
	STP	#0,}0
	SPL	0,1
	SPL	1,1
	SPL	0,1
	STP	#0,}0
	SPL	0,1
	SPL	1,1
	SPL	0,0
	SPL	#1,0
	SPL	0,0
	SPL	1,1
	JMP	-2,-2
	END	think	


