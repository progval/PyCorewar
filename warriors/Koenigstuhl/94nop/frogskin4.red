;redcode-b quiet
;name frogskin 4
;author bjoern guenzel
;assert CORESIZE==8000
;release some weeks ago?? (today is 10.5.96)
;p-class (scanner/stone),clear

step		equ 2936
		org loop

steps		dat #step+1,-step+1
		dat 0,0 		;x8
ptr		mov.i ref,@jptr
loop		add.f steps,@aref
		mov.i jm,{ptr
jptr		jmz.f loop,<ptr	;hit by mv -> switch to clear
aref		mov.i mv,@ptr
		mov.i st,<ptr
clptr		jmp @jptr,>ptr
ref		nop <0,<0		;x8 + anti-imp nop :-)
st		spl #0,#0
		mov.i bomb,>clptr
		djn.f -1,{clptr
		dat 0,0
bomb		dat #-1,bomb-clptr+2

mv		mov -1,{(st-jptr)
jm		jmp @0,{jptr-st


