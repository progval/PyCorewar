;redcode verbose
;name Charon v3.0 (Echo)
;author J.Cisek & S.Strack
;strategy creation date 4/11/92
;strategy cmp scan, spl trap, clear core, etc.
;strategy  v3.0 5/3/92 integrated with Stefan Strack's Echo
;strategy   Stefan very cleverly rewrote Charon to be much smaller.
;assert CORESIZE==8000

STEP	equ 1581			;step value
START	equ (search+STEP-3473)          ;hit self eventually
HALF	equ 4000			;set this to half the core

search	add steps, target		;turns into JMP -1, 0 eventually
target	cmp START, START+HALF		;axis-scan
	slt #switch-target+2, target	;don't hit self
	jmp search			;search at new location

	mov jump, @target		;set trap
	mov split, <target
	add switch, target		;swap a and b operands
	jmn target, search		;cmp again, unless search was bombed 

split	spl 0

	mov steps, <split		;clear core
jump	jmp -1

steps	dat #STEP, #STEP		;step value
switch	dat #HALF, #HALF+1

