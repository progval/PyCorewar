;redcode verbose
;name Ike v.21
;author Paul S. Kilroy
;strategy A bomber with a cool twist
;strategy    v.01 - fixed little tiny bug
;strategy    v.02 - oops... realized i should have that little bug hehe
;strategy    v.2  - added clear core
;strategy    v.21 - took out an unneeded ptr
;assert 1
bomb	spl 0, jump;
ptr	dat #0, #0
inc	add #468, b
start	jmz inc, @b
b  	mov bomb, @464;
	mov bomb, @b
jump	jmp inc
	mov 10, <-2
	end start
