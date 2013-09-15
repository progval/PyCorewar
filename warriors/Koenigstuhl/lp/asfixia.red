;redcode-lp
;name Asfixia
;author G.Labarga
;assert CORESIZE==8000 && MAXPROCESSES==8

;--- scanner
	sstep equ 1186
	gate equ (attk-3)
;--- stone
	step equ 4954

attk:	mov *1,*scan
	mov bmb,@scan
loop:	add.f bmb,scan
scan:	sne.i sstep,sstep+6
	add.f bmb,scan
	seq.i *scan,@scan
	slt.ab #18,scan
ctr:	djn loop,#1400
	jmn.b attk,ctr
clr:	mov dbm,>gate
	jmp clr,>gate-1
dbm:	dat <2667,15
bmb:	jmp #2*sstep,2*sstep

	end scan

