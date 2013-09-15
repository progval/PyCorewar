;redcode-94
;name Prova_e_Riprova
;author Maurizio Vittuari
;strategy B-scanner
;strategy This is a personal defiance to Beppe ;-)
;strategy hoping to improve Provascan for the hint
;strategy on the New Year's Day issue
;assert CORESIZE == 8000

step    equ 	3364
away	equ	3198+1

trap	dat	0,	0	;0
	dat	0,	0    ;we can use equs for those dat 0,0 they are left
dest	dat	0,	0    ;for clarity
	dat	0,	0
	dat	0,	0	;0
loop    add 	#step,	ptr
ptr     jmz 	loop,	trap+step
	mov.b 	ptr,    dest
cnt     mov 	#7,	0	;0
clear	mov 	bomb,	>dest
	djn 	clear,	cnt
	jmn 	loop,	trap
bomb	spl	#6,	0	;0
	mov	kill,	}bomb   ;1st pass: spl0-dat carpet
	mov	kill-1,	}bomb	;and then 2nd pass: only dat <2667,<-2666
	jmp	-2
	spl	#4,	0	;0
kill	dat	<2667,	<-2666

boot	mov	kill,	away
for 12
	mov	{boot,	<boot	     ;the faster way to boot away
rof
	mov	#0,	boot+2	     ;we have to set those b-fields to zero
	mov	#0,	boot+6	     ;to save time later
	mov	#0,	boot+10
	mov	#0,	boot+14
jump	jmp	boot+away-11,>away-34	;> is to set trap b-field non zero

for (MAXLENGTH-CURLINE)/4
	dat	jump,	0	    ;this decoy doesn't have two equal cells
	dat	bomb,	boot	    ;and also has all fourth b-field at zero
	dat	boot,	kill
	dat	clear,	boot
rof
end boot

