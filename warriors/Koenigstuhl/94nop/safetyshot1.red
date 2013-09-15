;redcode-94nop verbose
;name SafetyShot_I
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy oneshot with airbag
;strategy v1.0

span equ 12
ini equ 157
dc equ (gate+5655)

	org divide
	for 40
	dat 0, 0
	rof
gate	dat ini+span, ini
ch	dat 0, 0
	for 2
	dat 0, 0
	rof
w	dat 1, 12
clr	spl #200, 12
	mov.i *w, >gate
	mov.i *w, >gate
	djn.f -2, }clr
	for 15
	dat 0, 0
	rof
top1	sub.f #gate, gate
	sne {gate, <gate
	jmn.a top1, <ch
	jmp clr, {gate
	for 12
	dat 0, 0
	rof
top2	sub.f top1, gate
	sne {gate, <gate
	jmn.a top2, >ch
	add.f top1, gate
	jmp clr, {gate
	for 9
	dat 0, 0
	rof
divide	nop }dc, >dc+1
	mov {dc+2, <dc+4
	mov <dc+5, {dc+7
	mov <dc+8, {dc+9
	spl top1+1, {dc+14
	djn.f top2, {dc+16
	end

