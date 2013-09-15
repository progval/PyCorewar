;redcode-94
;name Self-Modifying Code v0.11
;author Ben Ford
;assert (CORESIZE==8000)
;strategy p^3++: silk, rock, scan, burn, wipe
;strategy heavily based on Recycled Bits by David Moore
;strategy improved the brain with ideas from the P^3 switcher
;strategy saved 15 instructions and 1 cycle in brains + tables
;strategy
;strategy v0.11 more constants tweaked and more instructions shaved
;strategy       and anti-combatra measure added
;strategy
;strtaegy nothing else seems to want to fall into place
;strategy so going with this and will see what happens

boot	equ	1430	; boot distance
w0	equ	(silk-silk)
w1	equ	(rock-silk)
w2	equ	(scan-silk)
w3	equ	(burn-silk)
w4	equ	(wipe-silk)

; ----- silk -----

d1	equ	4496	; 4496  771 2333 4195
d2	equ	1283	; 1283  748 1737 6234

silk	spl	2,	<  13	; lose, need non-0 b-field in prev cell
	spl	1,	<  14	; win
	spl	1,	<  15	; tie

slk0	spl	@   0,	<  d1
	mov	}slk0,	>slk0
	mov	sdat,	}3307
	mov	{slk0,	<slk1
slk1	djn.f	@   0,	<  d2
sdat	dat	$   1,	$   1

	dat	$   0,	$   0
	dat	$   0,	$   0
	dat	$   0,	$   0
	dat	$   0,	$   0
	dat	$   0,	$   0
	dat	$   0,	$   0
	dat	$   0,	$   0
	dat	$   0,	$   0
	dat	$   0,	$   0

; ----- wipe -----
; fight 3 point imps and stones which bomb with core

wtop	equ	(wipe-3)	; hope for dat 0,0 here

wipe	spl	#  -1,	wend-wtop
	mov	*wend,	>wtop
	mov	*wend,	>wtop
	djn.f	   -1,	{wtop
	jmp	   -2,	<wtop-2667

	dat	#   0,	wend-wtop-1
	dat	<5334,	<2667         ; 2nd pass
	spl	#  -2,	wend-wtop    ; 1st pass bomb
wend	spl	#wipe,	wend-wtop

	dat	$   0,	$   0
	dat	$   0,	$   0
	dat	$   0,	$   0
	dat	$   0,	$   0

; ----- burn -----

binc	equ	2394	; 2394 7629 7036
bhop	equ	7953	; 7953 7965 7969
bclk	equ	1378	; 1378 1427 1323
bptr	equ	   3	;    3    4    3
borg	equ	(2-binc*bclk)

burn	spl	#   1,	bhop	; spl half of the incendiary
	add	#binc,	    1
	mov	bmov,	>borg
	mov	burn,	@  -1
	jmz	   -3,	#   0	; bombed with spl to start clear
	mov	bdat,	>burn-bptr
	djn.f	   -1,	>burn-bptr
bdat	dat	<2667,	2+bptr-burn
bmov	mov	-bhop,	>-bhop	; mov half of the incendiary

	dat	$   0,	$   0
	dat	$   0,	$   0
	dat	$   0,	$   0
	dat	$   0,	$   0

; ----- scan -----

sinc	equ	5393	; 5397 5393
slen	equ	(sbmb-scan+3)

scan	jmz.f	sjmp,	5000
smov	mov	sbmb,	>scan
sadd	add	#sinc,	#sinc
sjmp	jmz.f	smov,	@sadd
	slt.b	sadd,	#slen
	mov.b	sadd,	scan
	jmn	smov,	sadd
	jmp	smov,	}smov
sbmb	spl	#   0,	{   0


	dat	$   0,	$   0
	dat	$   0,	$   0
	dat	$   0,	$   0
	dat	$   0,	$   0

; ----- p^3++ brain -----

PKEY	equ	34
SIZE	equ	9

pmod:
main	ldp.a	#   0,	#  13	; main specific distance from vect
	ldp.a	#PKEY,	vect	; 15
	mod.ba	*pmod,	vect	; 14
	stp.b	*vect,	#PKEY
	add.x	*vect,	last	; .x is anti-combatra... 'random' booting!

for	SIZE
	mov	<last,	{last
rof

last	djn.f	boot,	#silk+SIZE

	dat	$   0,	$   0

; ----- p^3++ table -----	; ##	L-13	W-15	T-14	type
				; --	----	----	----	----
vect	spl	#  w0,	#2055	;  0	1	0	11	silk
	spl	#  w1,	# 407	;  1	4	2	1	rock
	spl	#  w1,	#2718	;  2	1	3	2	rock
	spl	#  w1,	#1263	;  3	2	3	3	rock
	spl	#  w2,	# 410	;  4	7	5	4	scan
	spl	#  w2,	#2721	;  5	4	6	5	scan
	spl	#  w2,	#1266	;  6	5	6	6	scan
	spl	#  w3,	# 728	;  7	0	8	0	burn
	spl	#  w3,	#2724	;  8	7	9	8	burn
	spl	#  w3,	#2725	;  9	8	10	9	burn
	spl	#  w3,	#1270	; 10	9	10	10	burn
	spl	#  w4,	#2097	; 11	4	12	11	wipe
	spl	#  w4,	#2728	; 12	11	13	12	wipe
	spl	#  w4,	#1273	; 13	12	13	13	wipe

; ----- rock -----
; not quite a dwarf, it's different somehow

rinc	equ	81
rhop	equ	5277+1
rclk	equ	1677
rorg	equ	rinc*rclk+1

rock	spl	#  w0,	<rhop+1	; 14	??	??	??	unreachable
rptr	mov	rbmb,	<rorg
	mov	rbmb,	@rptr
	sub	#rinc,	rptr
	djn.f	rptr,	<rhop-3

	dat	$   0,	$   0
	dat	$   0,	$   0
	dat	$   0,	$   0

rbmb	dat	<   1,	<rhop

; ----- filler -----

for	MAXLENGTH-CURLINE
	dat	$   0,	$   0
rof

end	main
