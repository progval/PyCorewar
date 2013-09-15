;redcode-94 quiet
;name Simple v0.2a
;author Ian Oversby
;strategy v0.1  Stone/Imp
;strategy v0.2  Added gate
;assert 1

gate1	equ	(stone-3)
impstep equ     2667
sval    equ     1900

org     boot

mimp    SPL.B   1,      <-500	; 16 process 3 point imp
        SPL.B   1,      {-500	; and decoy-maker :-)
        SPL.B   1,      <-500        
        SPL.B   1,      <-500        

        SPL.B   2,      {-500
        JMP.B   imp
        ADD.A   #impstep, -1
die     DAT.F   $0,     $0
imp     MOV.I   #-5,    impstep

boot    MOV.I   {sptr,  <sptr
for 6
        MOV.I   {sptr,  <sptr
rof
        SPL.B   @sptr,	<-300
        MOV.I   die,    sptr
        JMP.B   mimp,	<-300
sptr    DAT.F   gate+1,	sval

stone	SPL.B   #95,    >-95
	SPL.B   #0,     >gate1-hit
loop	MOV.I   {0+95,	2-95
	ADD.F   stone,  loop
hit	DJN.F   loop,   <1900
last    MOV.I   gate,	}gate1
gate	DAT.F	gate-gate1+2,	>gate1

for 70
	DAT.F	$0,	$0
rof
        END

