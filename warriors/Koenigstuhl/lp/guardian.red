;redcode-lp
;name Guardian
;author G.Labarga
;assert CORESIZE==8000 && MAXPROCESSES==8
;strategy stone/paper

;--- paper
pstep equ 6002
pdest equ 7480
;--- stone
sStep   equ   1564    ; stone from Mad LP, with tweaked constants. Longer
sStep2  equ   -3000   ; bombing cycle

	sloc1 equ paper+ 569
	sloc2 equ sloc1+4006

paper:	mov #8,#8
	add.ab #pstep,gocp
copy:	mov <paper,<gocp
	mov <paper,<gocp
	jmn.b copy,paper
	spl @paper,<paper-3
gocp:	jmz.b @0,pdest
	dat <1,{1
for 37
	dat 0,0
rof
boot:	mov @ssrc,>sgo1
	mov >ssrc,>sgo2
	spl copy
ssrc:	spl 1,stone
	spl secsto
	mov @ssrc,>sgo1
sgo1:	jmp <0,sloc1
for 114
	dat 0,0
rof
stone:	mov.i <sStep2 -2 ,2+sStep -sStep  ; <- sub tweak (due to procs.
	sub.f 1,-1                        ; order)
	jmp -2,<-sStep
secsto:	mov >ssrc,>sgo2
sgo2:	jmp <0,sloc2

	end boot

