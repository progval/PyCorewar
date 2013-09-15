;redcode-94
;name Imperator
;author bjoern guenzel
;strategy bomber with imp bombs
;assert CORESIZE==8000
;p-class: stone,clear
;release 7.6.96

shift		equ -3000
step		equ (10*21)

gate		dat 0,0
for 8
		dat 0,0
rof
bptr 		dat imp,1            ;bomb here to change to spl-bomb
steps		spl #step,>-step
ptr		mov.i hit+step,bptr-5*step
		mov.i *bptr,*ptr
		add.f steps,ptr
hit		jmp.b ptr,>gate ;bomb here to change to clear
		mov.i clbomb,<imp 
		jmp.f -1,>gate
imp		mov.i #1,1	;used as bomb
clbomb	             dat >1,>gate

boot		mov.i clbomb,*booptr
for 9
		mov.i {boot,{booptr
rof
booptr	             spl @imp+1+shift,>1000
		mov.i #0,-1
		dat >2000,>1500

z for MAXLENGTH-CURLINE
		spl #z*103,z*(-101)
rof
		
		end boot


