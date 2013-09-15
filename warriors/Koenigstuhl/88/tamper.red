;redcode verbose
;name tamper
;author Mike & John
;(Michael Nidd <menidd@descartes.waterloo.edu>)
;strategy    A very small program which subtly alters instructions.
;strategy    It is hard to believe this has not been done before, so
;strategy    if it has, please let us know (We are new to Core Wars).
;assert 1
target	DAT	#-1000, #-1000
start	DJN	0,	<target	; decrement memory's B parameters
backup	JMP	-1,	-1	; in case something was 1 to start with
	end	start
