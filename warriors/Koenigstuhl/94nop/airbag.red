;redcode-94
;name airBag
;author Paulsson
;strategy First vers., I'm realy supprised over the scores :-)
;strategy 1/2 c bomber, d-clear and airbag (?)
;strategy July 7, 1996
;for Planar, stone,imp,cclear,other
;assert 1

        org start

step	equ	85	  ;taken from T.N.T

cptr	dat.f	0,start
	dat.f	-20,20
cbmb	dat.f	-20,20
	dat.f	0,0
	dat.f	0,0	  ;h(it)
finish		
st	spl	#step*3,step*3	;cclear
	mov.i	cbmb,>cptr
	djn.f	-1,>cptr		
	dat.f	0,0
	dat.f	0,0	  ;h
for 14
	dat.f	0,0
rof
start	spl	two	  ;h
one 	add.f	st,ptr    ;first part
ptr	mov.i	hit,*hit+step
	jmz.f	one,>check
	jmp	imps1
	dat.f	0,0	  ;h
for 18
	dat.f	0,0
rof
	dat.f	1,2
hit
check	dat.f	0,0	  ;airBag check!
bmb	dat.f	step,1
for 14
	dat.f	0,0
rof
two	mov.i	bmb,@ptr  ;second part
	mov.i	bmb,*ptr
	jmz.f	two,<check	
	jmp	imps2	
	dat.f	0,0	  ;h
for 15
	dat.f	0,0
rof
imps2	spl	finish    ;two continous imp launchers that are killed by the
	spl	#0	  ;dclear (if it is working!)
	add.a	#2668,1
	jmp	imp2-2668
	dat.f	0,0	  ;h
imps1	spl	finish
	spl	#0
	add.a	#2668,1
	jmp	imp1-2668
	dat.f	0,0	  ;h
imp1	mov.i	#2667,*0
imp2	mov.i	#2667,*0
	mov.i	#2667,*0
	mov.i	#2667,*0

	end
