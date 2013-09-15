;redcode-94
;assert 1
;name Dodo
;author Lukasz Grabun

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			    ;
;          brain            ;
;	   		    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PLOC 	equ 	336

think	ldp.a	#0	, in
	ldp.ba	tloc	, table
	mod.ba	*in	, table
tloc	stp.b	*table	, #PLOC
	mov.i	#0	, -1   ;;  S  L  W  T
table	jmp	}0	, 175  ;;  0  1  0  0
	dat	paper	, 140  ;;  1  2  0  0
	dat	stone	, 157  ;;  2  1  2  3
	dat	scanner , 73   ;;  3  1  3  3
in	dat	paper	, 6 	; brainwashing with 4
	dat	paper	, 5 	; brainwashing with 5
	dat	0	, 7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			    ;
;         scanner           ;
;	   		    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

step	equ 13
off	equ 4000

top
ptr	jmp	switch	, 4000
stun	mov	bomb	, >ptr
inc	add.ab 	#step	, #step
	jmz.f	stun	, @inc
	slt.b	inc	, #tail-top+3
	mov.b	inc	, ptr
	jmn	stun	, inc
switch	jmp	stun	, }stun
bomb	spl	#0	, }0
tail
scanner mov	bomb	, off-CURLINE
	for 8
	mov  	{scanner, <scanner
	rof
	jmp	off-6-CURLINE, <-1000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			    ;
;          paper            ;
;	   		    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

p1 	equ 2333
p2 	equ 1737

paper  	spl 2		, >7398
       	spl 1		, >5483
       	spl 1		, >6723

       	spl @0		, >p1 
	mov }-1		, >-1
       	mov {-2		, <1
       	spl @0		, >p2
       	mov.i #2*p1	, }-p1
       	dat 1		, 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			    ;
;          stone            ;
;	   		    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sstep	equ	4289
time	equ	1217
hop	equ	17

stone	spl	#0		, #0
sptr	mov	sbmb		, }-(sstep*time)+1
smov	mov	sbmb		, @sptr
	add	#sstep		, @smov
	djn.f	sptr		, {4000
	for 3
	dat 0,0
	rof
sbmb	dat	>hop		, >1
	end 	think
