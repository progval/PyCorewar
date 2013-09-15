;redcode-tiny
;name Little
;author Lukasz Grabun
;assert CORESIZE==800

step   equ     586
time   equ     156

soff   equ     200
ioff   equ     352

boot    SPL.B  2  		, bomb+1
isrc	SPL.B  2		, imp+1
	SPL.B  1		, 0
	MOV.I  <isrc		, {iptr
	MOV.I  <boot		, {sptr

sptr	DJN.B  soff		, #5
iptr	JMP    ioff		, 0

        SPL.B   #0              , #0
atk     MOV.I   bomb            , @loop
        ADD.AB  #step           , loop
loop    DJN.F   atk             , {-1-(time*step)
bomb    DAT.F   {4              , >1

istep	equ	267

pump	SPL.B   #imp 	, #imp+1
     	SUB.F   #-istep-1,  iloop
     	MOV.I   imp 	, }pump
iloop	JMP.B   imp-2*(istep+1) , >imp+2*istep-1
imp	MOV.I  #0	, istep

	end boot

