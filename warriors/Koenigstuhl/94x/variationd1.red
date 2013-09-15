;redcode-94x
;name Variation D-1
;author Jay Han
;strategy Variation on the theme of "Twimpede"
;strategy Added a split/wimp
;strategy Stonger imp-gating, less trashing
;assert CORESIZE==55440
;macro

		org	start

; Mod-2 stone
p1		equ	27739
s1		equ	34
p2		equ	27705
s2		equ	-34

gate		equ	top-39

top		equ	stop
stop		dat.f	<gate-buckle,	<gate-buckle+1
loop		add.f	inc,		cast
stone		spl.b	loop,		<gate
cast		mov.i	<p1,		p2
buckle		djn.f	stone,		<gate
inc		spl.b	#s1,		<s2
clear		mov.i	plug,		<stop+1
plug		dat.f	<gate,		<gate+1
patch		jmp.b	3,		#1

for 105
		dat.f	0,		0
rof

wimp            spl.b   #0,             <gate
                djn.f   #0,             <gate
for 4
		dat.f	0,		0
rof
start           spl.b   stone
                spl.b   wimp

; 38-process 19-point spiral (coresize 55440, '94 standard)
step		equ	29179
launch
		spl	lbl3
		spl	lbl5
		spl	lbl9
		spl	lbl17
		spl	lbl33
		spl	lbl65
		jmp	imp+0*step+0
lbl65		jmp	imp+1*step+0
lbl33		spl	lbl67
		jmp	imp+2*step+0
lbl67		jmp	imp+3*step+0
lbl17		spl	lbl35
		spl	lbl69
		jmp	imp+4*step+0
lbl69		jmp	imp+5*step+0
lbl35		spl	lbl71
		jmp	imp+6*step+0
lbl71		jmp	imp+7*step+0
lbl9		spl	lbl19
		spl	lbl37
		spl	lbl73
		jmp	imp+8*step+0
lbl73		jmp	imp+9*step+0
lbl37		spl	lbl75
		jmp	imp+10*step+0
lbl75		jmp	imp+11*step+0
lbl19		spl	lbl39
		spl	lbl77
		jmp	imp+12*step+0
lbl77		jmp	imp+13*step+0
lbl39		spl	lbl79
		jmp	imp+14*step+0
lbl79		jmp	imp+15*step+0
lbl5		spl	lbl11
		spl	lbl21
		spl	lbl41
		spl	lbl81
		jmp	imp+16*step+0
lbl81		jmp	imp+17*step+0
lbl41		spl	lbl83
		jmp	imp+18*step+0
lbl83		jmp	imp+0*step+1
lbl21		spl	lbl43
		spl	lbl85
		jmp	imp+1*step+1
lbl85		jmp	imp+2*step+1
lbl43		spl	lbl87
		jmp	imp+3*step+1
lbl87		jmp	imp+4*step+1
lbl11		spl	lbl23
		spl	lbl45
		spl	lbl89
		jmp	imp+5*step+1
lbl89		jmp	imp+6*step+1
lbl45		spl	lbl91
		jmp	imp+7*step+1
lbl91		jmp	imp+8*step+1
lbl23		spl	lbl47
		spl	lbl93
		jmp	imp+9*step+1
lbl93		jmp	imp+10*step+1
lbl47		spl	lbl95
		jmp	imp+11*step+1
lbl95		jmp	imp+12*step+1
lbl3		djn.b	#0,		#2		; Idle 2 cycles
		spl	lbl25
		spl	lbl49
		spl	lbl97
		jmp	imp+13*step+1
lbl97		jmp	imp+14*step+1
lbl49		spl	lbl99
		jmp	imp+15*step+1
lbl99		jmp	imp+16*step+1
lbl25		mov	#0,		#0		; Idle
		spl	lbl101
		jmp	imp+17*step+1
lbl101		jmp	imp+18*step+1
imp		mov.i	#-step,		step		; well, why not?

                end

