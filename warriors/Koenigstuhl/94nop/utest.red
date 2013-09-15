;redcode-94
;name U Test
;author JKW
;strategy Very simple stone.  Boots fast.  Tried to optimize constants
;strategy for killing scanners...
;strategy Scanners got you down?  Looking for relief?
;strategy Try 'U Test'!  The new homeopathic herbal remedy!
;strategy Made from 100% rocks and stones!
;assert 1

S equ 2948
org boot

for 50
dat.ab start*3777, start*3177
rof

boot	mov	{bootp,	<bootp
	mov	{bootp,	<bootp
	mov	{bootp,	<bootp
	mov	{bootp,	<bootp
	spl	@bootp
	mov.f	0,	1

bootp	dat	5,	2300
start	spl #S, >-S
	add.f	-1,1
	mov.i >0,-2
	djn.f -2,<-1102

for 39
dat.ba start*3777, start*3177
rof
