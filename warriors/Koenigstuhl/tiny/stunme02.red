;redcode
;name stun me! v0.2
;author Berzerker
; <berzerker@ircfightclub.com>
;assert 1

stunt   mov.i   stun, 4000

stump   spl     3999

        add.ab   #279, stunt
        add.a   #279, stump        

        djn     stunt,#14
        jmp     lock
stun    jmp     0
stun2   dat	0,	0

lock   	mov.i  stun2, 6000

key    	spl     5999
       	add.ab   #400, lock
       	add.a   #400, key        
	jmp lock

