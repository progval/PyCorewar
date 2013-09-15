;redcode-94
;name tinc 2
;author bjoern guenzel
;strategy scanner, not as small as I had hoped... 
;assert CORESIZE==8000
;release

step5		equ 15
dist		equ step5		
clptr		equ step

		dat 0,0		;scan
		dat 0,0
loop		add.f step,@return
return	sne.i @ptr,{ptr
jb		jmp loop,#sp-loop
ptr		mov.x #ptr+step5+1,#ptr+step5+dist
		mov.i sp,}ptr
		mov.i sp,}ptr
		mov.i jb,*ptr
		jmp @loop,{ptr
		dat 0,0		;scan
for 8
		dat 0,0
rof
step		spl #2*step5+1,#2*step5
		dat 0,0		;scan
		dat #1,#last-clptr+3
sp		spl #-4,#last-clptr+3
		mov.i @1,>clptr
last		djn.b -1,{sp
		dat 0,0		;scan

		end return

