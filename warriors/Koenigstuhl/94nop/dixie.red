;redcode-94nop
;assert (CORESIZE==8000)
;name Dixie
;author Lukasz Grabun

imp_size    equ     2667                ; 3 point, 8 process imp spiral
imp_prc     equ     10

imp_A_fld   equ     imp+(imp_prc+1-2*cnt)*imp_size
imp_B_fld   equ     imp+(imp_prc+0-2*cnt)*imp_size
cnt     for     5
        jmp     imp_A_fld,imp_B_fld
        rof
imp_vct spl     1              ,#0
        spl     1              ,#0
        spl     <0             ,#imp_vct
        djn.a   @(imp_vct-1),#0
imp     mov.i   #0,imp_size

cBoo	equ	1000
iBoo	equ	5000

gate	dat	0   , 2000
clear	spl      #0 , #0
	mov    bomb , >gate
	djn.f    -1 , >gate
bomb	dat   >5335 , 15

for 77
dat 0,0
rof

cSrc	spl	2   , bomb+1
cDst	spl	2   , cBoo-CURLINE
iSrc	spl	1   , imp+1
	mov    <cSrc, <cDst
	mov    <iSrc, <iDst
	mov    <iSrc, <iDst
	djn	cBoo-CURLINE-4,#5
iDst	jmp	iBoo-CURLINE-5,iBoo-CURLINE
	end	cSrc

