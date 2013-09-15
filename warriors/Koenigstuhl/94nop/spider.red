;redcode-94
;name Spider 1.1
;author Bill Shubert
;strategy Sit and wait.  When the enemy approaches, strike with a small and
;strategy   fast offense.
;strategy This is an attempt to demonstrate that an extremely complex and
;strategy   long fighter can succeed in the experimental hill.  Let's see how
;strategy   it goes.
;strategy 1.1 mod: Spider gets bored eventually and goes on the offense.
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
;Lots of improvements could be made - a better "clear" routine, and
;  especially a better routine to go to after boredom sets in.  Adding code
;  is not hazardous, since if an enemy gets close enough to hit my main
;  chunk of code I've probably lost already anyway.  And, of course, there's
;  no reason that a fang-style offense couldn't be put on a mobile program.

coresize	equ	8000
wdist	equ	250
bspace	equ	17		;How far apart to but the bombs.
bpasses	equ	5		;Number of bombing passes before giving up.
passlen	equ	wdist * 2 / bspace	;Number of bombs per bombing pass.

patience	equ	150	;Number of times to look for enemy before
				;  getting bored and going offensive.
lofang	equ	loatt - wdist		;Position for low fang.
lohit1	equ	lofang - wdist + 1	;Position for first low bomb.

hifang	equ	hiatt + wdist	;Position for high fang.
hihit1	equ	hifang + wdist	;Position for first high bomb.

loatt	mov	lokill1,lofang		;Move the lo fang to attack position.
	mov	lokill2,lofang+1
	spl	lofang			;Start it running.
loattl1	add	bmov,lobomb		;Move the bomb.
loattl2	djn	loattl1,#passlen	;Jump back.
	mov	#passlen,loattl2
	add	breset,lobomb		;Pass over; adjust position.
	djn	loattl1,#bpasses
	mov	locb,lobomb		;Passes over; first kill fang...
	jmp	clear			;  then start clearing core.

locb	dat	#lofang-lobomb

clfrom	equ	clbomb
clto	equ	cllpc
cljd	equ	-199
hicb
clbomb	dat	#hifang-hibomb
clear	mov	clbomb,clend-cljd	;Make sure the old "clear" is no good.
	mov	#-cljd+20,cllpc		;Reset the clearing loop counter.
	mov	#0,clbomb		;Reset the bomb location.
cllp	mov	clbomb,<clbomb
cllpc	djn	cllp,#0
	mov	#clend-clfrom,clfrom	;Set up the dats for copying me.
	mov	#clend-clto+cljd+1,clto
clcplp	mov	@clfrom,<clto		;Copy this code.
	djn	clcplp,clfrom
clend	jmp	clear+cljd		;Jump to the new clear.

trap	spl	trap		;Make sure that any process trapped is
	spl	trap		;  slowed down REAL fast.  Heck, I can afford
	spl	trap		;  to waste this space.
	spl	trap
	jmp	trap

locmp	dat	#lohit1
hicmp	dat	#hihit1
spider	cmp	>locmp,cmpspot
	jmp	loatt		;Enemy approaching from lo end!
	cmp	<hicmp,cmpspot
	jmp	hiatt		;Enemy approaching from hi end!
mlc	djn	spider,#wdist
	sub	#wdist,locmp	;Reset the scanners.
	add	#wdist,hicmp
	mov	#wdist,mlc
	djn	spider,#patience
	jmp	clear		;Spider is bored.  Go on the offense.

;Here is the code for the mini killers...the fangs.
lobomb	jmp	trap-lohit1,lohit1-lobomb
hibomb	jmp	trap-hihit1,hihit1-hibomb
lokill1	mov	lobomb-lofang,@lobomb-lofang
hikill1	mov	hibomb-hifang,@hibomb-hifang
lokill2
hikill2	jmp	hikill1,<-5	;Minor imp defense.
bmov	dat	#-bspace,#bspace
breset	dat	#wdist*2,#-wdist*2

hiattl1	sub	bmov,hibomb		;Move the fangs bite.
hiattl2	djn	hiattl1,#passlen
	mov	#passlen,hiattl2	;Pass is over.  Reset the bite.
	sub	breset,hibomb
	djn	hiattl1,#bpasses
	mov	hicb,hibomb		;All passes are done.  Start clearing.
	jmp	clear

hiatt	mov	hikill1,hifang		;Move the hi fang into position.
	mov	hikill2,hifang+1
	spl	hifang			;Start up the hi fang.
last	jmp	hiattl1			;Begin moving the bite around.
cmpspot	equ	last+1

	end	spider
