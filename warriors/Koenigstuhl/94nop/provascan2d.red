;redcode-94
;name Provascan 2.0d
;author Beppe Bezzi
;strategy B-scanner
;strategy a six months ago beginner's warrior :-)
;strategy trying to improve it for the hint
;assert CORESIZE == 8000 
  
step    equ 	#3364 
away	equ	3198

trap	dat	0,	0	;0
	dat	0,	0       ;we can use equs for those dat 0,0 they are left
dest	dat	0,	0       ;for clarity
	dat	0,	0
	dat	0,	0	;0
loop    add.ab 	step,   ptr 	;
ptr     jmz 	loop,	trap
	mov.b 	ptr,    dest
cnt     mov 	#7,	0	;0
clear	mov 	bomb,	>dest
	djn 	clear,	cnt
	jmn 	loop,	trap    
bomb	spl	#0,	0	;0
	mov	2,	>dest
	djn.f	-1,	{dest
kill	dat 	-5,	#kill-dest+2
	dat	0,	0	;0

boot	mov	kill,	away
for 10
	mov	{boot,	<boot          ;the faster way to boot away
rof
	mov	#0,	boot+3         ;we have to set those b-fields to zero
	mov	#0,	boot+7         ;to save time later
	mov	#0,	boot+11
jump	jmp	@boot,	>away-29       ;> is to set trap b-field non zero

a for (MAXLENGTH-CURLINE)/4
	dat	jump,	0              ;this decoy doesn't have two equal cells
	dat	bomb,	boot           ;and still has all fourth b-field at zero
	dat	boot,	kill
	dat	clear,	boot
rof
end boot
