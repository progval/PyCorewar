;redcode-b test
;name Jolt v0.3
;author J.A-Worth
;strategy boot->scan->clear
;strategy v 0.1-original, scan->clear
;strategy v 0.2-added boot
;strategy v 0.3-parallelized clear
;strategy 126->107->62?!
;assert 1

special equ 48
bdest   equ 4123   ; not real one, though this probably won't help anybody.

        org boot


clearp	dat #bomb, #100
target	dat #100, #112
next	add step, target
check	sne *target, @target
	add step, target
	seq *target, @target
	slt.ab #special, target
	djn next, #1000
attack	mov bomb,}target	; yeah, its huge, and it bombs both spots
	mov bomb,>target	
	mov bomb+1,}target
	mov bomb+1,>target
	mov bomb+2,}target
	mov bomb+2,>target
	add.f bomb+1, target
	jmn.b next, attack-1 
clear	spl #4, #0
	mov *clearp, >clearp
step	dat #42, #42
	dat #18,#40
bomb	spl #18,#93
	spl #-3,>-3 
	jmp -2, <-3

a for 44			; big decoy, but my scanner will bomb it too
	dat a,45-a
rof

bptr	dat bomb+3,bdest

boot	mov {bptr,<bptr
for 24
	mov {bptr,<bptr
rof
	add.ab #4,bptr
	spl @bptr, #0		; start up scanner
	add.ab #14,bptr
	spl @bptr, #0		; start up coreclear
	mov 2, <-1		; wipe boot sequence
	djn.b -1,#33
	dat #23,#2356

        end

