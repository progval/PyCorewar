;redcode-94
;name blue torch
;author bjoern guenzel
;strategy bomber,improved (?) version
;assert CORESIZE==8000
;release 12.5.96

shift		equ -1000
gate		equ hit+4001
sign		equ (-1)
step4		equ (3364)
step		equ (sign*step4)
magic		equ (1000)

clptr		dat 0,0
		dat 0,0
		dat 0,0			
steps		spl #2*step,-step 	
loop		add.x steps,ptr
ptr		mov.i >ptr+magic*step,@hit+step
		mov.i steps,@ptr
hit		djn.f loop, <gate 
		mov.i bomb,>clptr
		djn.f -1,{clptr
bomb		dat >1,>bomb-clptr+2
bsource		dat 0,0
		dat 0,0			;bombed (obsolete)

boot z for 8
		mov.i {bsource,{booptr
rof
booptr		spl bsource+shift,clptr+shift
		mov.f #0,-1
		dat 0,0
		
for MAXLENGTH-CURLINE
		dat 0,0
rof

		end boot

