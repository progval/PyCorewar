;redcode-94 test
;name Mrs Di
;author bjoern guenzel
;assert 1
;strategy dodger/spiral
;strategy VERY slow response time and endless boot...:-(
;strategy @date@
;released 24/10/96

istep	equ 2667
bdist1	equ (-3000)
scandist equ (-bdist1-200)
bdist2	equ (-2000)


; decoy

	for 7
	mov.f #0,#0
	spl #0,#0
	jmp #0,#0
	nop #0,#0
	djn.b #0,#0
	slt #0,#0
	rof


; dodger

	spl 1
	spl 1
	mov.i -1,0
	jmz.f #0,}ptr
	mov.i switch,-1
	mov.i empty,{ptr
	mov.i <ptr,{ptr
ptr	jmp *scandist,#last+1
switch	jmp 2,>-500

clptr	dat clear,100
bomb	dat >2667,last-clptr+3
empty	dat 0,0
	dat 0,0
clear	spl #0,{clptr
	mov.i bomb,>clptr
last	djn.f -1,>clptr
	
s1	dat #0,#0

; spiral

	spl 1
	mov.i -1,0
	spl 2,}0
	jmp @1,}0
	jmp imp+istep,imp
	jmp imp+3*istep,imp+2*istep
	jmp imp +5*istep,imp+4*istep
imp	mov.i #istep,*0

s2	dat #0,#0

boot z 	for 8
	mov.i <s2,<booptr
	rof
	for 16
	mov.i <s1,{booptr
	rof
booptr  spl bdist1,bdist2
	spl @booptr
	mov.i #0,booptr
fine	dat 0,0

	end boot

