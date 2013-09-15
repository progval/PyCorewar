;redcode-94lp
;name red virus v1.0
;author bjoern guenzel
;strategy 0.66c scanner for wasted youth conditions
;assert CORESIZE==8000
;release 27.6.96

step4		equ (4*17)
gate		equ jb-2500


		dat 0,0
jb		jmp #step-jptr,<-2	;bomb		
loop		sub.f step,ptr
ptr		sne.i jptr+step4,jptr+2*step4
jptr		djn.f loop,<gate
		mov.i jb,*ptr
		mov.i jb,@ptr
		jmp *jptr,<gate		
		dat 0,0		;scanned
step		spl #-2*step4,>-2*step4
		mov.i clb,<clptr
		jmp -1,>-2*step4
		dat 0,0		;scanned
clb		dat >1,>-7
clptr		dat #0,-7


		end ptr

