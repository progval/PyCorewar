;redcode-94nop
;name SoulEater
;author Nenad Tomasev
;assert CORESIZE==8000
;multishot scanner

step equ 21
span equ 10
ini equ 213
dc equ gate-4036

	org decoy
gate	dat 0, 0
pok	dat ini, ini+span
b	dat 1, 8
more	spl #step, step
	mov.i *b, >gate
	mov.i *b, >gate
	djn.f (more+1), }more
	for 5
	dat 0, 0
	rof
top	nop }swap, {loop
shoot	mov.i more, >gate
incr	add.x more, @scan
scan	jmn.f att, *pok
loop	jmz.f incr, @pok
	mov.x @loop, @loop
att	slt.ab #20, pok
	jmp *incr, 0
	mov.ab pok, gate
swap	jmn.b top, loop
	for 70
	dat 0, 0
	rof
decoy	nop >dc, }dc+1
	mov <dc+2, {dc+4
	mov {dc+5, <dc+7
	mov <dc+8, {dc+11
	djn.f scan, {dc+13
	end
