;redcode-94
;name Paradox v2
;author Mike Nonemacher
;contact mn2f+@andrew.cmu.edu
;strategy Vampiric anti-imp paper + anti-vamp Gemini
;strategy + gate-crashing imp-spiral
;strategy Some gate-crashing spirals can cross increment gates...
;assert CORESIZE==8000
;macro

;This beats all the na'ndor warriors I've found except cproba and
;(it's close, though) aa.  But, I'm hoping the success of Der Zweite
;Blitzkrieg, Blitzkrieg, and Squint will prevent him from using one
;of those.  Welp, it's worth a shot...

;anti-imp paper, anti-vamp paper, and gate-crashing spiral
;No, gate-crashing spirals aren't made obsolete by increment gates.
;When Paradox's spiral gets to an increment gate, the 2668-imp gets
;killed, but leaves a bunch of 2668-imp instructions around.  The
;2667-imp comes along, gets incremented to a 2668-imp, and continues.
;It only has 4 processes in it, but that's enough for most gates.

PC1	EQU	-2995	;normal (anti-imp) paper's constant
PC2	EQU	-2194	;anti-vamp's constant
PC3	EQU	1712
IMPC	EQU	232	;offset of start of imp-spiral
IMPOFF	EQU	1	;difference between 2667 & 2668 imps (-)
D1	EQU	2667
D2	EQU	2668
i1off	EQU	0	;start as 4-3-2-1, coreclear changes it to
i2off	EQU	2667	;2-1-4-3
i3off	EQU	5334
i4off	EQU	1
AVC	EQU	-571	;offset from av of pointer to pit

imp1	mov.i	#0,	2667
imp2	mov.i	#0,	2668
start	spl	p1
	spl	i2b
i2a	mov.i	imp2,	imp2+IMPC+i1off
	mov.i	imp2,	imp2+IMPC+i1off+1
	mov.i	imp2,	imp2+IMPC+i1off+2
	spl	1
	spl	1
	mov.i	-1,	0
	spl	2
	jmp	@0,	imp2+IMPC+i1off
	add.ab	#D2,	-1
	dat	#0
i2b	spl	i2c
	mov.i	imp2,	imp2+IMPC+i2off
	mov.i	imp2,	imp2+IMPC+i2off+1
	spl	1
	spl	1
	mov.i	-1,	0
	spl	2
	jmp	@0,	imp2+IMPC+i2off
	add.ab	#D2,	-1
	dat	#0
i2c	spl	i2d
	mov.i	imp2,	imp2+IMPC+i3off
	spl	1
	spl	1
	mov.i	-1,	0
	spl	2
	jmp	@0,	imp2+IMPC+i3off
	add.ab	#D2,	-1
	dat	#0
i2d	spl	i1a
	spl	1
	spl	1
	mov.i	-1,	0
	spl	2
	jmp	@0,	imp2+IMPC+i4off
	add.ab	#D2,	-1
	dat	#0
i1a	mov.i	imp1,	imp1+IMPC-IMPOFF
	spl	1
	spl	1
	mov.i	-1,	0
	spl	2
	jmp	@0,	imp1+IMPC-IMPOFF
	add.ab	#D1,	-1
	dat	#0
p1	spl	1
	spl	1
	spl	1
	spl	p2
	spl	p3
	spl	1
	mov.ab	#16,	#16
p001	mov.i	<-1,	<1
	spl	@0,	#PC1
	mov.i	b1,	<-1
	mov.i	b2,	<-2
	mov.i	b3,	<-3
	jmz.b	@0,	-6
b1	dat.f	<2667,	<5334
b2	mov.i	#0,	<1
b3	jmp.f	58,	<2667
	mov.i	b1,	>5
	spl.f	-1,	<-12
	jmp.f	-2,	<-13
	jmp.f	-3,	<-14
	jmp.f	-4,	<-15
	jmp.f	-5,	<1
	mov.ab	#8,	#8		;anti-vamp - attacks pit
p2	mov.i	<-1,	<1
	spl	@0,	#PC2
	mov.ab	#5,	av+AVC
	add.ab	<av+AVC-1,	av+AVC
av	mov.i	2,	<av+AVC
	jmp	-1
	dat.f	<2667,	<5334
	mov.ab	#8,	#8
p3	mov.i	<-1,	<1
	spl	@0,	#PC3
	mov.i	3,	<-1
	mov.i	3,	<-2
	jmz.b	@0,	-5
	dat.f	<2667,	<5334
	mov.i	#0,	<1
END	start
