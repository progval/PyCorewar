;redcode-94nop
;name Crackling Ice
;author Lukasz Grabun
;strategy scanner
;password grabek
;kill Quick Freeze
;assert 1
;optimax cds

orig z for 0
       rof

step	equ	3024
gate	equ	(top-4)
away	equ	(16*191-1+orig)
gap	equ	5

	SPL.B	#0	, #1		; scanned low
ptr	MOV.I   10+gap  , >step
atk     MOV.I   9+gap  	, >-1		
scan    SEQ.I   step 	, }step+8
found   MOV.AB  -1   	, -3
none    ADD.F   2    	, -2     
loop    JMN.B   -4   	, @-4
spb     SPL.B   #step	, #step
	SPL.B	#0	, #1   		; scanned high
cl      MOV.I   2    	, >-11     
lcl     DJN.F   -1   	, >-12     
dbmb    DAT.F   <2667	, 15     

dat 0,0
bomb    SPL.B	#1	, #1

boot	MOV.I	spb	, away+5
	MOV.I	scan	, away+1
	MOV.I	{-1	, <-1		; scanned low
	MOV.I	found	, away+2	
	MOV.I	none	, away+3
	MOV.I	loop	, away+4
	MOV.I	ptr	, away-1
	MOV.I	bomb	, away+9+gap
	MOV.I	dbmb	, away+8
	MOV.I	{-1	, <-1		;
	MOV.I	{-2	, <-2		; scanne high
	JMP.B	away+1	, }-1		; trick

for 6
dat 0,0
rof

; decoy

FOR 8
spl.b  #0,1
spl.ab #1,@1
spl.ba #1,*1
spl.i  #1,#1
spl.a  #1,*1
spl.b  #1,#1
spl.ab #1,@1
spl.ba #1,*1
ROF

	end	boot
