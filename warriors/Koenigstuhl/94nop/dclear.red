;redcode-94
;name d-clear
;author bjoern guenzel
;strategy clear (no scanning)
;assert CORESIZE==8000
;release 23.5.96

shift		equ -3000

ptr		dat >0,4000
		dat 0,0
start		spl #0,>ptr
		mov.i bomb,>ptr
		djn.f -1,>ptr
bomb		dat >2667,bomb-ptr+3
bsource		dat 0,0
boot z for 6
		mov.i {bsource,<bootptr
rof
bootptr		spl start+shift,bsource+shift
		mov.i #0,-1
		dat 0,0

z for MAXLENGTH-CURLINE
		spl #z*100,z*101
rof


		end boot

