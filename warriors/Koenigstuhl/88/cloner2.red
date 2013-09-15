;redcode
;name CLONER II
;author Kenneth D. Miller
;kdmiller@athena.mit.edu
;assert 1

SRC	mov	 FIX,	-1	;set up the SouRCe counter (and do bonus attack)
CPY	mov	@SRC-1,	<DST	;fat, unrolled loop to copy...
	mov	<SRC-1,	<DST	;does it in 15 cycles
	mov	<SRC-1,	<DST
	mov	<SRC-1,	<DST
	djn	 CPY,	 SRC-1
DST	spl	 @DST,	 5000	;activate new copy
HNT	jmz	 HNT,	<DST	;search for a new spot...
	jmp	 SRC		;copy again
FIX	dat	 #0,	 #12	;this is the starting value for SRC-1
	dat	 #0,	 #0	;death-dealin' data
	dat	 #0,	 #1
	end	 SRC
