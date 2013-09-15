;redcode-b quiet
;name x-frog 2
;author bjoern guenzel
;strategy 0.66c scan, bomb incendary
;strategy I think I found a really fast switch, but is bombing the
;strategy second location with a jmp first_loc really so bad?
;strategy that would be the fastest way to attack both locations.
;assert CORESIZE==8000
;P-class scan,djn,clear
;release 21.4.96

dist		equ 42		;2*3*7
step		equ (4*59)		;mod 4 -> scan mod 2
size		equ (bomb-steps+3)
skip		equ size

		org scan
steps		dat #step+1,step
ptr		dat #steps,#steps+dist

scan		add.f steps,@ref
loop		cmp.b {ptr,@ptr		;{ resets the pointer after the attack
		slt.ab #skip,@ref
		djn.f scan,<-2600
		
clptr		mov.i stun,>ptr
ref		mov.i mv,@ptr
		mov.x @0,ptr		;now the incremented b-field becomes the a-field
					;and will be decremented from the cmp { instruction
		jmn.b loop,steps
stun		spl #7,#0
		mov.i bomb,>clptr
		djn.f -1,{clptr
bomb		dat #-1,bomb+2-clptr
		dat 0,0
for 10
		dat 0,0
rof
mv		mov -1,{-1
for 10
		dat 0,0
rof
z for 60
		spl #z+5000,#0
rof

