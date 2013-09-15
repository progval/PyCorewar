;redcode verbose
;name Dwarfer
;author Scott Adkins
;(sadkins@bigbird.cs.ohiou.edu)
;assert 1
;strategy Copies a one dwarven fighter out into the core every 200 locations
;strategy and starts each one.  After this is done, it continually refreshes
;strategy each fighter in case they have been damaged.  This program is very
;strategy very fast and has a bit of split bomb immunity built into it.
;
start	mov	d2,	<dst
	mov	d1,	<dst
	spl	@dst
	add	#200,	dst
	jmp	start

d1	mov	d1-1,	d1-1
d2	jmp	d1, 	<d1

dst	dat	#0,	#200
	end	start
