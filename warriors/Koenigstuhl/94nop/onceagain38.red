;redcode-94m
;name OnceAgainAShotForGlory3.8
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy oneshot
;Summary
;=======
;Warrior             Length    Score   Given      W%      L%      T%
;-------             ------    -----   -----  ------  ------  ------
;OeAgnAShtFrGlry3.8 0,68143    138,3   126,4    34,3    30,4    35,4
;Maelstrom          0,68143    126,4   138,3    30,4    34,3    35,4

gate equ cl
step equ 2007
ini equ 137
cnt equ 3500	;3500
ds equ scan-4013
cl equ scan
span equ 14

	org scan
	for 82
	dat 0, 0
	rof
incr	sub.f more, @3
scan	sne ini+span, ini
	sub.f more, scan
	sne *scan, @scan
loop	djn.f incr, <ds
clr	spl #0, >cl-1143
w1	mov s, >cl
	mov s, >cl
	djn.b w1, #cnt
	mov s+2, w1
	mov s+2, clr
wipe	add.a  #(8001/21)+1,cbomb
	mov @-1, {cbomb
	jmp -2, >(gate-5)
cbomb	spl #1, #4
	dat -20, -20
s	spl #1, #30
more	dat -step, -step
	end

