;redcode-94nop
;name  The Boss is back again!
;author G.Labarga
;assert CORESIZE==8000
;startegy Oneshot scanner
;strategy 0.66c scan, core colouring, bomb detection
;strat v6: Oneshot instead of bishot, no decoy, tweaked a bit.

	smod EQU 7
	sstep EQU (smod*667)
	d1 EQU (2*sstep)+smod
	d2 EQU (2*sstep)

gate:	dat scan+d1,scan+d2
for 3
	dat 0,0
rof
sw:	dat <1,(clr+6-gate)
sbm:	spl #clr+20,(clr+7-gate)
for 4
	dat 0,0
rof
clr:	spl #1-(2*sstep),>1-(2*sstep)	;clear from Geist
clop:	mov *sw,>gate
	mov *sw,>gate
	djn.f clop,}sbm
for 81
	dat 0,0
rof
loop:	sub.f clr,@bchk		;< and > protection
scan:	seq.i }gate,>gate	;scan
bchk:	sne.i *gate,@gate	;bomb check
	djn.f loop,@gate	;core trashing
	djn.f clr,@bchk		;enters clear mode after 1141*2 scans
				; wiping scanner's code
end scan

