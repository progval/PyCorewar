;redcode-94
;name One Man Army v1.0
;author Ian Sutton
;strategy lightning fast large bomber
;assert CORESIZE == 8000

gate	equ	(stcode-3)
step	equ    	-6503
stbomb	equ	(ecode+1489)

	org	strt


stcode
drop2	mov	bomb2, *drop
loop
strt	mov	bomb, @drop
drop	mov	stbomb+step*2, *stbomb
	add	incr, drop
nxt	jmz.f	loop, *drop
	jmn.f	drop2, @drop2		; gets bombed with spl to start clear
bomb	spl	#step, >step*2+1	; yes 2 spls in a row
	mov	cbomb, >gate
ecode	djn.f	-1, >gate
	dat	0,0
	dat	0,0

cbomb	dat	>5335, 20
incr	spl	#step*3, #step*3
bomb2	mov	-step*2, >-step*2

