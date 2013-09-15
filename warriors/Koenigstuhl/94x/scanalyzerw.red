;redcode-94x
;name Scanalyzer-W
;author Jay Han
;strategy Scanner/Vampire
;assert CORESIZE==55440
;macro

		org	scan

start		equ	scan-200
step		equ	-34

loop		add.f	inc,		scan
scan		cmp.i	start+step,	start
		slt.ab	#399,		scan
count		djn.b	loop,		#13860
		mov.i	fang,		@scan
		sub.ba	scan,		@scan
		add.f	half,		scan
p		jmn.b	scan,		count
inc		spl.b	#step*2,	<step*2
half		spl.b	#step,		<step
		mov.i	bomb,		<p
bomb		dat.f	<step-2,	<step-1
fang		jmp.b	pit-scan,	<-1

for 15
		dat.f	0,		0
rof

pit		spl.b	#0,		<scan-3
trap		jmp.b	-1,		<scan-3

for 15
		dat.f	0,		0
rof

fool		equ	55440/311
m for 155
		dat.f	fool*m,		-fool*m
rof

                end

