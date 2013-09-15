;redcode
;assert CORESIZE==8000
;name Tangle Trap 2
;author David Moore
;strategy  .4c vampire with airbag protection.
;strategy  My "fangs" cannot be used to locate me.

step equ 15
incA equ (2*step)
incB equ step
incS equ 381

posM equ 3000
posT equ (posM - incS - 4)
posF equ (incB + posM + 4 - step*5)
pos1 equ (posM + 4 + step*7)

boot	mov wipe+3,  boot+posM+8
	mov wipe+2, <boot
	mov wipe+1, <boot
	mov wipe+0, <boot
	mov main+4, <boot
	mov main+3, <boot
	mov main+2, <boot
	mov main+1, <boot
	mov main+0, <boot
	mov fang1, boot+posF
	mov fang2, boot+posF+incB

	spl s0, 0
	spl s1, 0
	spl 2, 0
	jmp boot+posM+1, 0
	jmp boot+posM+2, 0
s1	spl 2, 0
	jmp boot+posM+3, 0
	jmp boot+posM+4, 0
s0	spl s2, 0
	spl 2, 0
	jmp boot+posM+0, 0
	jmp boot+posM+1, 0

s2	mov trap+2, boot+posT+2
	mov trap+1, <s2
	mov trap+0, <s2

	dat #0, #0

trap	spl  0, <2  ; <- each captured soul goes here exactly once
	spl -1,  0
	jmn -1, #MAXPROCESSES  ;exit the trap when everyone
;;;	dat                    ;has been captured

fang1	jmp posT-pos1, incB
fang2	jmp -incB, 1

f1 equ (main + posF - posM)
f2 equ (f1 + incB)

;attack ends after fang2 replaces f1

main	sub #-incA, @1
	mov f1, @1
	mov f2, @(main + pos1 - posM)
	add main,  f1
	jmn main, <f1

wipe	spl     0, <incS+4
	add #incS,  wipe   ;anti-imp pattern
	mov     1, @wipe
;;;	dat 0, 0

;spl 0, <0 becomes spl 0, <-1, avoiding self-wipe

end boot

