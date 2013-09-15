;redcode-b
;name Uvavu
;author Scott Manley
;strategy 0.6 c Mod 2 Vamp -> core clear
;assert 1

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
	DAT	1,1
boot	SPL	1,0
	SPL	1,1
	SPL	1,2
	SPL	1,3
	MOV	}copy,>copy
	DJN	2,#1
	JMP	2434,#1
	MOV     }-10,>-10	
copy	DAT	0, 2430
jmpb	JMP	-2  , <-6 
begin	MOV.I	splb , @targ
	MOV.I	jmpb , *targ
targ	MOV.I	-2430,@-2432
	ADD.F	inc,targ
	DJN	-4,#799
splb	SPL	0,4
	MOV	1,<-2
inc	DAT	}-2430,>-2430
	DAT	0,0
	DAT	0,0
	DAT	0,0
	DAT	0,0
	DAT	0,0
	DAT	0,0
	DAT	0,0
	DAT	0,0
	DAT	0,0
	DAT	0,0
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

	END	boot

