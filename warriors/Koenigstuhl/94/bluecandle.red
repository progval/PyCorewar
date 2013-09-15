;redcode-94
;name blue candle
;author bjoern guenzel
;strategy stone/spiral
;strategy synchrone boot (to make it sound more interesting :->)
;strategy release 19.5.96
;assert CORESIZE==8000

;constants for blue x-torch
stshift		equ (-1234)	;boot distance
gate		equ hit+5001
sign		equ (-1)	
step4		equ (3364)	
step		equ (sign*step4)
magic		equ (1000)

;constants for spiral launch
istep		equ 2667
spshift		equ (ptr+stshift+imagic) ;magic boot distance
imagic      	equ (4875-1451+11)

 		
;launch stone
stlaunch z for 8
		mov.i {stsource,<booptr
rof
stboot		jmp @booptr,>1000


;launch spiral and stone
splaunch	spl stlaunch,>2001	;start here
for 8
		mov.i {spsource,{booptr
rof
		spl @booptr,>3002	;put a second processes into stone!
booptr		spl spsource+spshift,stsource+stshift
		mov.i #0,booptr		
		dat >4003,>5004		

; ************ blue x-torch ***********

clptr		dat 0,0
		dat 0,0
		dat 0,0			
steps		spl #2*step,-step 	;doubles as bomb
loop		add.x steps,ptr		
ptr		mov.i >ptr+magic*step,@hit+step
		mov.i steps,@ptr
hit		djn.f loop, <gate	;bombed with spl 
		mov.i bomb,>clptr
		djn.f -1,{clptr
bomb		dat #-1,<bomb-clptr+2	;bomb for clear

stsource    	dat 0,0

; ************ binspiral *************

		spl #-1000,>2000	;bombed after 15 process
		spl 4,>-1		;spiral has been created
		spl 2,}j3
j1		jmp imp-1,}0
j2		jmp imp+istep-1,}0
		nop }j1,}j2
j3		jmp imp+2*istep-1,}0
imp		mov.i #istep,istep

spsource    	dat 0,0


z for (MAXLENGTH-CURLINE)/2
		spl #z+z*1237,#-z-z*1237
		stp.ab >0,#z
rof

		end splaunch

