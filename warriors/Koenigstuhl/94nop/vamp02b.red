;redcode-94
;name vamp 0.2b
;author bjoern guenzel
;strategy vamp/scan->s/d-clear
;strategy submitted @date@
;assert 1

step	equ (2*5*19)
pgate	equ (pit-1)
pitlink equ (clbmb+hit-step)
bdist 	equ (-4000)


fang	jmp @-2*step+hit+1,pitlink-(hit-2*step)+1
clptr	dat #-step-1,step-1
clbmb   dat >1,incs-clptr+2	
loop	add.f clptr,fang
	mov.i @0,>fang
	jmz.f loop,}fang
	mov.i incs,*fang
hit	mov.i incm,{fang
	jmp loop,}fang		;hit with spl
	mov.i *incs,>clptr
last	djn.f -1,{clptr
	dat 0,0
	dat 0,0			;vamped
incm	mov.i 1,}1
incs	spl #1,1
        spl #clbmb-incs,incs-clptr
bsource	dat 0,0			;scanned

boot z	for 16
	mov.i {bsource,<booptr
	rof
	mov.i pl,@booptr2
booptr	spl loop+bdist,fang+bdist+16
	mov.i 0,-1
booptr2	div.f #0,#3816+9-42
	
pl	dat 0,-3774-9-3+42+3

	for 10
	dat 0,0
	rof

z	for 15
	spl 0,z
	rof


	for 15	
	dat 0,0
	rof

pit	spl #0,<pgate
	spl #0,<pgate
	mov.x #-3741,3739
	spl 2,<pgate	
	spl #0,<pgate		;fang
	spl #0,<pgate
	mov.i 3,>3
	jmp pit,<pgate
	dat >2667,-3000

	for MAXLENGTH-CURLINE
	dat 0,0
	rof

	end boot

