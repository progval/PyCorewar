;redcode
;name FI V1
;author PVK
;strategy Ver 1(spl/dat/spl/... clear)
;assert 1

	org scan-1

x	equ	(scan-15)	; neat trick: since the two scan positions 
                         	; are 15 cells apart, moving the b-field to 
				; scan-15 points directly to scan+x 8)

clear	spl	#-5,	{-2 	; not sure about the {-2
	mov	@4,	{4
	jmp	-1,	<-4
db	dat.f	-5,	-5
	spl	#-100,	-100
inc	dat.f	31,	30
sb	spl	#1,	0
for 22
	spl	#0,0
rof
	add.x	inc,	1
scan	mov.i	<-2,	{13
	jmz.f	-2,	<-1
chkself	slt.ab	scan,	#-8
	djn.f	scan-1,	scan
	jmp	attack,	-100	; i think that this line is hit, 
				; if not, i'll just o the b-field
db2	dat.f	-5,	-5	; inc's b-field point to this line
for 9
	dat.f	-100,	-100 	; might not be needed, except for the 
				; 1st one, but i'm not sure
rof
attack	mov.b	scan,	x
	mov.i	sb,	<x
	mov.i	>x,	>x
	jmn.f	-2,	>x
check	jmn.b	scan-1,	-1
	jmp clear

