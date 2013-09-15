;redcode verbose
;name Droid
;author Andy Pierce
;(ajpierce@med.unc.edu)
;assert 1

start	cmp <a,<b
	spl b,0
	djn start,b
	mov -5,<0
slow	spl 0,0
stop	jmp -2,0
b	mov slow,5328
a	mov slow,-8
