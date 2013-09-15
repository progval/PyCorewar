;redcode-94
;name Mobius
;author Matt Barnett
; <mbarnett@ualberta.ca>
;assert 1

boot	spl front, #8000
back	mov.i -3, @boot
	djn.b back, boot
front	mov.i stun, @bomb
	add	 #21, bomb
bomb	jmp front, #300
stun 	dat #0

end boot
