;redcode
;name Falling Leaf 1.21
;author Matt Hastings
;assert 1
start	mov trap3,<ptr2
	mov trap2,<ptr2
	mov trap,<ptr2
	mov inc,<ptr1
	mov jb,<ptr1
	mov l5,<ptr1
	mov l4,<ptr1
	mov l3,<ptr1
	mov mark,<ptr1
	mov l1,<ptr1
	mov l0,<ptr1
	mov ptr2+1,-2344+trap-l0+480-350
	jmp @ptr1,<ptr1
l0	spl 0,0
l1	add trap+11+5+20,jb
mark	mov jb,@jb
l3	mov <289-2,0+285
l4	add inc,-1
l5	djn -4,<2500-5+1-1500+5+350
jb	jmp trap+11+20+5-mark+1+285,mark-1-285
inc	dat #285,#285
trap	mov @285,<-285
trap2	spl -1,0
trap3	jmp -1,0
ptr1	dat #0,#-2100+480-350
ptr2	dat #0,#-2100+11+20+trap-l0-6+5+480-350
