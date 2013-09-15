;redcode
;name juggernaut
;author Jon Blow
;blojo@soda.berkeley.edu
;assert 1

src:	dat	#7
dest:	dat	#13
start:	mov	<src,	<dest
	jmn	start,	src
	mov	#7,	3
	mov	#13,	3
	jmp	3

        end     start
