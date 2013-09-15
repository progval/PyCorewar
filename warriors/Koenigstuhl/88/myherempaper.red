;redcode
;name MyHeremPaper
;author John K W
;assert 1
;strategy Anders Ivner wrote the original
;strategy Herem stone + 8 process anti-imp paper.
;strategy I made it less papery and added a 17 line core trash.
;strategy beats pacman and leapfrog... and a lot of the stuff that beats
;strategy pacman and leapfrog... which is what I expect to see. :/
;strategy all while watching the x-files I was debating between submitting
;strategy this and leapfrog myself.  I guess it's a coin toss.

step	equ	926
first	equ	5337
away	equ	5020

boot
i for 17
        mov     boot-1, i*4107+200
rof
        mov     gate,   gate+away+21
dpt	spl	1,	c+away+1
	mov	<spt,	<dpt
	mov	<spt,	<dpt
	mov	<spt,	<dpt
	spl	1
	spl	1
spt	spl	@dpt,	c+1

papers

l100
	mov	#8,	0
	mov	<-1,	<1
	spl	@0,	6300
	mov	3,	<-1
	mov	3,	<-2
	jmz	-5,	-5
	dat	<2667,	#1
	mov	0,	<1

herem	spl	0,	<-10
	sub	c,	pt
pt	mov	<100,	@herem+first
	mov	gate+21,@pt
c	djn	-3,	<-step

gate    dat     <-19,   <2666

	end	boot
