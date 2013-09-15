;redcode verbose
;name Dwarfer II
;author Scott Adkins
;assert 1
;strategy Kills any leech-like programs and copies a dwarf program to every
;strategy 400 memory locations.  It also repairs all of the dwarves as they
;strategy get hurt, and provides itself with a bit of split bomb immunity.
;
bomb	dat	#0,	#0
trace	dat	#0,	#0

start	spl	dwarf

find	jmz	find,	<bomb
	add	@bomb,	catch
	mov	#0,	catch
catch	mov	#0,	0
	add	catch,	trace
	add	trace,	bomb

reap	mov	bomb,	<bomb
	jmp	reap

dwarf	mov	d2,	<dst
	mov	d1,	<dst
	spl	@dst
	add	#400,	dst
	jmp	dwarf

d0	dat	#0,	#0
d1	mov	d0,	d0
d2	jmp	d1,	<d1

dst	dat	#0,	#400
	end	start
