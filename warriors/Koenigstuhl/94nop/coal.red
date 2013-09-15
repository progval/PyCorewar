;redcode-94
;name coal 3.22b
;author bjoern guenzel
;strategy burn and smoke - stone without extras, but improved against 
;strategy djn-streams
;assert CORESIZE==8000
;release 29.4.96 - got 53 challenges old 
;p-class stone,clear

step4	equ (4*19)	;steps more or less randomly chosen...
step5	equ (5*19)
gate	equ clptr+5000
magic	equ (2000-1)	;a field has to point to bptr exactly when
			;b field points to ptr
	dat 0,0		;dec,hit
	dat 0,0

dec	djn.f -1,{clptr-ptr
clptr	dat -1,100	

	dat 0,0				;hit

b1	spl #b2-bptr,bptr-clptr+1 	;dec 	 
step	spl #-step5,#step4		;first to be executed
	mov.i *bptr,>clptr
ptr	mov.i <bptr+magic*step5,ptr+step4 	;last hit -  by the mov,
				;which moves a djn -1 there. So I have 
	add.f step,ptr		;a 0.5c clear+djn-stream
	djn.f ptr,<gate		;dec - mutilated djn stream :-(

	dat 0,0
	dat 0,0				;hit

b3	dat #b3-bptr,switch-clptr+1
b2	spl #b3-bptr,bptr-clptr	
bptr	dat #b1,switch+2		;dec

	dat 0,0				;hit
	
switch	mov.i dec-ptr+step5,>1-step4

	end step

