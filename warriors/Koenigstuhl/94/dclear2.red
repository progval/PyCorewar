;redcode-94
;name d-clear II
;author bjoern guenzel
;strategy d-clear
;assert CORESIZE==8000
;release 30.5.96

shift		equ -3000

ptr		dat 0,#-shift+1003
		dat 0,0
		dat 0,0
		spl #0,>ptr
loop		mov.i bomb,>ptr
		djn.f loop,>ptr
		dat 0,0
		dat 0,0
bomb		dat >1,>bomb-ptr+2
bsource		dat 0,-3

boot		mov.i }ptr,>booptr
		mov.i }ptr,>booptr
for 6
		mov.i {bsource,{booptr
rof
booptr	spl bsource+shift,ptr+shift
		mov.f #0,-1
		dat >2000,>2500

z for (MAXLENGTH-CURLINE)/2
		spl #z*100,#z*101
		stp.a >0,#1
rof

		end boot
			
