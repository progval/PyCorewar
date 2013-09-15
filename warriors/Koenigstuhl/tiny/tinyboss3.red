;redcode-tiny
;name Tinyboss III
;author G.Labarga
;assert CORESIZE==800
;strategy Bombing Oneshot scanner

	sgap equ 10	;8 ;7
	step equ (3*sgap)

loop:	sub.f inc,scan
start:	mov bmb,@scan
scan:	sne.i bpt+1+(2*sgap),}bpt+1+(1*sgap)
	djn.f loop,{bpt-71	;loop-80+1	;80+4

inc:	spl #-step,<-step
	mov @bpt,>scan
	mov @bpt,>scan
	mov @bpt,>scan
bpt:	djn.f -3,{sbm
	dat 0,0
	dat -9,9
sbm:	spl #-65,9
bmb:	mov.i #(2*sgap),}1	;dat <(2*sgap),}1

end start

