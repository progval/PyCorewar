;redcode verbose
;name SplitBomb
;author Scott Adkins
;assert 1
;strategy Slows the opponent down, and then unleashes a single deadly dwarf
;strategy to finish the job nicely.  Uses "spl -1" similar to XTC, but in a
;strategy more efficient way, and much, much faster.  Does well against many
;strategy splitters and bombers, but does poorly against mice and leech.
;
bomb1	spl	-1

start	add	#412,	dest
dest	jmz	start,	dest

kill	mov	#44,	loop+1
	mov	dest,	20
loop	mov	bomb1,	<19
	djn	loop,   #44
look	spl	dwarf,	bomb1-1
	jmp	start

dwarf	mov	bomb2,	<look
	jmp	dwarf

bomb2	dat	#0,	#0
	end	start
