;redcode-94nop
;name OnceAgainAShotForGlory
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy oneshot

step equ 13
ini equ 210
dc equ scan-2095
cnt equ 4000

	org decoy
cl	dat 0, 20
w1	mov s, >cl
	mov s, >cl
	djn.b w1, chk
wipe	add.a  #(8001/21)+1,cbomb
	mov @-1, {cbomb
chk	jmp -2, #cnt
cbomb	spl #1, #4
more	dat -2*17, -2*17
s	spl #1, #20
	for 16
	dat 0, 0
	rof
incr	sub.f more, @loop-1
scan	sne ini+step, ini
	sub.f more, scan
	jmn.f prepare, @scan
loop	jmz.f incr, *scan
	mov.x @loop-1, @loop-1
prepare	mov.b @loop-1, cl
	djn.b w1, cl
	for 55
	dat 0, 0
	rof
decoy	nop >dc, }dc+1
	mov <dc+2, {dc+4
	mov {dc+5, <dc+7
	mov <dc+8, <dc+10
	djn.f scan, dc+11
	end

