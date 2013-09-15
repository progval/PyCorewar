;redcode-94nop
;name Damage
;author Andrew Hunter
;strategy Blur-style scanner .6/.2 scan/clear
;assert CORESIZE==8000

off 	equ 4670
first 	equ ptr+step
step 	equ 290;2936;632;24,632,328,936,952,968
gate 	equ ptr

cptr 	mov.b ptr, #-3154
clr 	mov.i sbmb,>-1
	sub incr,ptr
ptr 	sne first+step,first
	sub.x incr,ptr
	jmz.f clr,@ptr
	jmn.b cptr,ptr
sbmb 	incr spl #-2*step,<-step
	mov.i bmb,>gate
	djn.f -1,>gate
bmb 	dat <2667,bmb+1-gate
boot 	mov bmb,off

for bmb-cptr-1
	mov {boot,<boot
rof

	spl @boot
	mov {boot,<boot
	dat <boot,<boot

for (MAXLENGTH-CURLINE)/2
	spl.b  #1,1
	spl.x @1,<1
rof

	end boot

