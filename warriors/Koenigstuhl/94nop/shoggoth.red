;redcode-94 
;name Shoggoth 1.1
;author Bill Shubert
;strategy Crawl through memory, sweeping aside everything in the way.
;strategy V1.1 - Faster & smaller with a bigger attack range.
;assert 1
wdist	equ	250

procs	equ	16
cpnum	equ	11

st	spl	st1
st1	spl	st2
st2	spl	st3
st3	spl	st4
st4	jmp	shog

from	dat	#0
to	dat	#from
shog	mov	#from-to,to
	mov	to,<to
	mov	to,<to

	mov	to,<to
	mov	to,<to
	mov	to,<to
	mov	to,<to
	mov	to,<to

	mov	to,<to
	mov	to,<to
	mov	to,<to
	mov	to,<to
	mov	>from,>to

	jmp	(from-procs*cpnum)+(shog-from)

	end	st
