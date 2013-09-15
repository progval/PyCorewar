;redcode-94tiny
;name si-test
;author G.Labarga
;assert CORESIZE==800
;strategy Qbomb->stone/imp
;strat	paper launched imp

	step equ 4043
	sloc equ sto- 273

sto:	spl #-(2*step),<-(2*step)-1
loop:	mov >step-1,2*step
	sub.f sto,loop
	djn.f @0,<loop

boot:	spl 1,>QBOMB+20+16*33
	spl 1,>QBOMB+20+17*33
go:	spl sloc,sto
	mov >go,}go

papi:	spl @0,<268
	mov }papi,>papi
	mov.i #17 ,} 6137
	mov.i #267,*0

QBOMB:				;The Quick punch :)
I FOR 7
	MOV.I {QBOMB+20+I*33,{QBOMB+20+(I+7)*33
ROF
	JMP boot,}QBOMB+20+15*33

	end 	QBOMB

