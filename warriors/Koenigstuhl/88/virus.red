;redcode verbose
;name Virus
;author Scott Adkins
;(sadkins@bigbird.cs.ohiou.edu)
;assert 1
;strategy Copies itself through memory (slowly) to help ensure survival.  It
;strategy also launches two dwarves to help out with cleaning the memory.  It
;strategy then spends the rest of the time splitting to memory locations, 
;strategy hoping that it will execute and enemy program and make it all that
;strategy much harder to win.
;
src	dat	#0,	#0

start	mov	dst,	loc1
	mov	src,	loc2
	mov	#111,	host
	mov	#111,	dst

	spl	dwarf1
	spl	dwarf2
	spl	virus

copy	mov	#30,	src
loop	mov	@src,	<dst
	djn	loop,	src
	spl	@dst
	add	#777,	dst
	jmp	copy

virus	spl	@host
	add	#111,	host
	jmp	virus
                                 
dwarf1	add	#111,	loc1
	mov	loc1,	@loc1
	jmp	dwarf1

dwarf2	sub	#111,	loc2
	mov	loc2,	@loc2
	jmp	dwarf2

loc1	dat	#0,	#0
loc2	dat	#0,	#0
host	dat	#0,	#0
dst	dat	#0,	#0
	end	start
