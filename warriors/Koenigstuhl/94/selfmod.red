;redcode-94
;name Self-Modifying Code v0.10
;author Ben Ford
;assert (CORESIZE==8000)
;strategy p^3++: silk, rock, scan, burn, wipe
;strategy heavily based on Recycled Bits by David Moore
;strategy improved the brain with ideas from the P^3 switcher
;strategy saved 15 instructions and 1 cycle in brains + tables
;strategy
;strategy v0.1 still tweaking the components

; ----- p^3++ table -----	; ##	L-13	W-14	T-15	type
				; --	----	----	----	----
vect	spl	#  w0,	#1106	;  0	 1	 0	11	silk
	spl	#  w1,	#1486	;  1	 4	 2	 1	rock
	spl	#  w1,	#1067	;  2	 1	 3	 2	rock
	spl	#  w1,	#1263	;  3	 2	 3	 3	rock
	spl	#  w2,	#1489	;  4	 7	 5	 4	scan
	spl	#  w2,	#1070	;  5	 4	 6	 5	scan
	spl	#  w2,	#1266	;  6	 5	 6	 6	scan
	spl	#  w3,	#1170	;  7	 0	 8	 0	burn
	spl	#  w3,	#1073	;  8	 7	 9	 8	burn
	spl	#  w3,	#1074	;  9	 8	10	 9	burn
	spl	#  w3,	#1270	; 10	 9	10	10	burn
	spl	#  w4,	# 446	; 11	 4	12	11	wipe
	spl	#  w4,	#1077	; 12	11	13	12	wipe
	spl	#  w4,	#1273	; 13	12	13	13	wipe
	spl	#  w0,	# 911	; xx	 1	 1	11
unreachable
pmod	spl	#   0,	#  13	; lose, need non-0 b-field in prev cell
	spl	#   0,	#  14	; win
	spl	#   0,	#  15	; tie

boot	equ	1430	; boot distance
w0	equ	(silk-silk)
w1	equ	(rock-silk)
w2	equ	(scan-silk)
w3	equ	(burn-silk)
w4	equ	(wipe-silk)

for	8
	dat	$   0,	$   0
rof

; ----- silk -----

d1	equ	4496	; 4496  771 2333 4195
d2	equ	1283	; 1283  748 1737 6234

silk	spl	2,	<-1500
	spl	1,	<-1608
	spl	1,	<-1716

slk0	spl	@   0,	<  d1
	mov	}slk0,	>slk0
	mov	 sdat,	}3307
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

wipe	spl	#  -1,	 wend-wtop
	mov	*wend,	>wtop
	mov	*wend,	>wtop
	djn.f	   -1,	{wtop
	jmp	   -2,	<wtop-2667

	dat	#   0,	 wend-wtop-1
	dat	<5334,	<2667         ; 2nd pass
	spl	#  -2,	 wend-wtop    ; 1st pass bomb
wend	spl	#wipe,	 wend-wtop

	dat	$   0,	$   0

; ----- burn -----

binc	equ	2394	; 2394 7629 7036
bhop	equ	7953	; 7953 7965 7969
bclk	equ	1378	; 1378 1427 1323
bptr	equ	   3	;    3    4    3
borg	equ	(2-binc*bclk)

burn	spl	#   1,	 bhop	; spl half of the incendiary
	add	#binc,	    1
	mov	 bmov,	>borg
	mov	 burn,	@  -1
	jmz	   -3,	#   0	; bombed with spl to start clear
	mov	 bdat,	>burn-bptr
	djn.f	   -1,	>burn-bptr
bdat	dat	<2667,	 2+bptr-burn
bmov	mov	-bhop,	>-bhop	; mov half of the incendiary

; ----- scan -----

sinc	equ	5393	; 5397 5393
slen	equ	(sbmb-scan+3)

scan	jmz.f	 sjmp,	 5000
smov	mov	 sbmb,	>scan
sadd	add	#sinc,	#sinc
sjmp	jmz.f	 smov,	@sadd
	slt.b	 sadd,	#slen
	mov.b	 sadd,	 scan
	jmn	 smov,	 sadd
	jmp	 smov,	}smov
sbmb	spl	#   0,	{   0

; ----- rock -----

rinc	equ	81
rhop	equ	5277+1
rclk	equ	1677
rorg	equ	rinc*rclk+1

rock	spl	#   0,	<rhop+1
rptr	mov	 rbmb,	<rorg
	mov	 rbmb,	@rptr
	sub	#rinc,	 rptr
	djn.f	 rptr,	<rhop-3
	dat	$   0,	$   0
	dat	$   0,	$   0
	dat	$   0,	$   0
rbmb	dat	<   1,	<rhop

	dat	$   0,	$   0
	dat	$   0,	$   0
	dat	$   0,	$   0
	dat	$   0,	$   0

; ----- p^3++ brain -----

PKEY	equ	1 ; not really
SIZE	equ	9

main	ldp.a	#   0,	 pmod
	ldp.a	#PKEY,	 vect
	mod.ba	*pmod,	 vect
	stp.b	*vect,	#PKEY
	add.ab	*vect,	 last

for	SIZE
	mov	<last,	{last
rof

last	djn.f	 boot,	#silk+SIZE

end main

