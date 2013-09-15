;redcode-94
;name Spider 2.0
;author Bill Shubert
;strategy Sit and wait.  When the enemy approaches, strike with a small and
;strategy   fast vampire-trap offense.  After an enemy is caught, switch to
;strategy   a simple memory-clearing routine.
;strategy This is an attempt to demonstrate that an extremely complex and
;strategy   long fighter can succeed in the experimental hill.  Let's see how
;strategy   it goes.
;strategy 1.1 mod: Spider gets bored eventually and goes on the offense.
;strategy 1.2 mod: Faster scan and sturdier clear.
;strategy 2.0 mod: Make chains of fangs so I can attack anywhere I want.
;assert 1

;This program operates by effectively doubling it's reach by using what I call
;  "fangs".  A fang is the following pair of instructions:
;fang	mov	bite,@bite
;	jmp	fang
;The variable "bite" is located very far away, and is modified by a cooperating
;  process which is also very far away.  By putting fangs in the path of
;  attacking processes, it is possible to have a 2-instruction target size
;  but still have a decent amount of intelligence.  The main loop is at the
;  label "spider".  spider loops, looking for opponents arriving from either
;  side.  When it sees an opponent, it goes to a routine that throws a fang
;  in from of the opponent and makes a few bombing passes.  After the passes
;  are done, hopefully the opponent is trapped and control transfers to a
;  piece of code that clears the entire core.

coresize	equ	7999
wdist	equ	250
att_dist	equ	wdist-2
bspace	equ	17		;How far apart to but the bombs.
bpasses	equ	5		;Number of bombing passes before giving up.
passlen	equ	wdist * 2 / bspace	;Number of bombs per bombing pass.

lohit1	equ	loatt - att_dist-1	;Position for first low bomb.
hihit1	equ	hiatt + att_dist-1

empty	equ	loatt-1
loatt	mov	@lobptr,@lobloc
fang2	jmp	loatt,<-5
fang1	mov	@lobptr-loatt,@lobloc-loatt
fmove	dat	#att_dist,#att_dist

lobptr
lo_nxt	jmp	-att_dist,#fang1
lo_jb	jmp	trap-lohit1,lohit1-lobloc
jbmove	dat	#att_dist,#-att_dist
lobloc	dat	#loatt-att_dist

lokill	spl	loatt
	add	#att_dist,locmp		;Move
lomvlp	mov	#fang1-lobptr,lobptr
	add	fmove,fang1		;Move the first fang word.
	add	#1,lobloc
	mov	#fang2-lobptr,lobptr	;Move second fang word.
	mov	#lo_nxt-lobptr,lobptr	;Set up jump to next fang.
	add	#att_dist-1,lobloc	;Move in jump to next fang.
	add	#att_dist,locmp
	sub	#att_dist*2,lobloc	;Point to the next fang position.
	add	jbmove,lo_jb
	slt	locmp,#att_dist+1
	jmp	lomvlp

	mov	#lobloc-lobptr,lobptr
	mov	lo_jb,lobloc
loklp1	add	bmov,lobloc
loklp2	djn	loklp1,#passlen
	mov	#passlen,loklp2
	add	breset,lobloc
	djn	loklp1,#bpasses
	mov	#jbmove-lobptr,lobptr
	sub	#bpasses*(passlen*bspace-wdist*2)-att_dist-1,lobloc

	mov	#empty-locmp,locmp
	mov	lk1c,spider
	mov	lk2c,s2
	mov	lk3c,s3
	djn	spider,kills
	jmp	clear

clbptr	equ	clend+1
clfrom
breset	dat	#wdist*2,#-wdist*2
cljd	equ	-199
clear	mov	clbomb,clto-cljd	;Make sure the old "clear" is no good.
	mov	#-cljd+20,cllpc		;Reset the clearing loop counter.
	mov	#clear-clbptr,clbptr	;Reset the bomb location.
cllp	mov	clbomb,<clbptr
cllpc	djn	cllp,#0
	mov	#clend-clfrom,clfrom	;Set up the dats for copying me.
	mov	#clend-clto+cljd+1,clto
clcplp	mov	@clfrom,<clto		;Copy this code.
	djn	clcplp,clfrom
clto	jmp	@0,0			;Jump to the new clear.
clend
clbomb
bmov	dat	#-bspace,#bspace

trap	spl	trap		;Make sure that any process trapped is
locmp	spl	trap,lohit1	;  slowed down REAL fast.  Heck, I can afford
hicmp	spl	trap,hihit1	;  to waste this space.
kills	jmp	trap,#2

lk1c	cmp	empty-spider,>hicmp-spider
lk2c	cmp	empty-s2,>hicmp-s2
lk3c	cmp	empty-s3,>hicmp-s3
hk1c	cmp	<locmp-spider,empty-spider
hk2c	cmp	<locmp-s2,empty-s2
hk3c	cmp	<locmp-s3,empty-s3
spider	cmp	<locmp,>hicmp
	jmp	found
s2	cmp	<locmp,>hicmp
	jmp	found
s3	cmp	<locmp,>hicmp
	jmp	found
	jmp	spider

hifang1	mov	@hibptr-hiatt,@hibloc-hiatt

hibptr
hi_nxt	jmp	att_dist,#hifang1
hi_jb	jmp	trap-hihit1+1,hihit1-hibloc-1
hibloc	dat	#hiatt+att_dist

found	cmp	@locmp,empty		;Which comparator found the enemy?
	jmp	lokill

hikill	spl	hiatt
	sub	#att_dist,hicmp		;Move
himvlp	mov	#hifang1-hibptr,hibptr
	sub	fmove,hifang1		;Move the first fang word.
	add	#1,hibloc
	mov	#hifang2-hibptr,hibptr	;Move second fang word.
	mov	#hi_nxt-hibptr,hibptr	;Set up jump to next fang.
	sub	#att_dist+1,hibloc	;Move in jump to next fang.
	sub	#att_dist,hicmp
	add	#att_dist*2,hibloc	;Point to the next fang position.
	sub	jbmove,hi_jb
	slt	#-att_dist-1,hicmp
	jmp	himvlp

	mov	#hibloc-hibptr,hibptr
	mov	hi_jb,hibloc
hiklp1	sub	bmov,hibloc
hiklp2	djn	hiklp1,#passlen
	mov	#passlen,hiklp2
	sub	breset,hibloc
	djn	hiklp1,#bpasses
	mov	#jbmove-hibptr,hibptr
	add	#bpasses*(passlen*bspace-wdist*2)-att_dist+2,hibloc

	mov	hk1c,spider
	mov	hk2c,s2
	mov	hk3c,s3
	djn	spider,kills
	jmp	clear

hiatt	mov	@hibptr,@hibloc
hifang2	jmp	hiatt

	end	spider
