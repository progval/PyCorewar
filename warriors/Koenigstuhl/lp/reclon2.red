;redcode-lp
;name Reclon 2 scanner
;author G.Labarga
;assert CORESIZE==8000 && MAXPROCESSES==8
;strategy Twin scanner
; Ben Ford's Switchblade modiffied.
; I changed the clear and optimized the constant
; Booted a parallel scanner

	step equ 238
	sloc equ ptr+4000

ptr:	jmp #step,atk+step
loop:	add.ab {0,}0
scan:	jmz.f loop,@ptr
atk:	mov @0,@ptr		;<-hit
	jmz.a loop,atk
clr:	spl #0,<0
	mov dbm,<-9
	dat 0,0
dbm:	dat <-9+5334,<1
for 100
	dat 0,0
rof
boot:	mov <dbm,<sgo
for 8
	mov <dbm,<sgo
rof
	spl scan,{0
sgo:	jmp sloc+2,sloc+9

	end boot

