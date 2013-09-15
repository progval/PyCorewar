;redcode-94b
;name Ick v1.5
;author Justin Kao
;assert 1


        org     scan

sep     EQU 17
bootdist equ -1500

        ORG     scan

        ;begin quick scan

space   equ     (CORESIZE/81)   ; Step when scanning for code.
qbomb   equ     6               ; Step when bombing whatever we found.

scan
        sne.X   space*1+bottom, space*3+bottom
	seq.X   space*2+bottom, space*4+bottom
	mov     #space*1+bottom-found, found
	sne.X   space*45+bottom, space*47+bottom
	seq.X   space*46+bottom, space*48+bottom
	mov     #space*45+bottom-found, found
	sne.X   space*65+bottom, space*67+bottom
	seq.X   space*66+bottom, space*68+bottom
	mov     #space*65+bottom-found, found
	sne.X   space*13+bottom, space*15+bottom
	seq.X   space*14+bottom, space*16+bottom
	mov     #space*13+bottom-found, found
	jmn.B   found, found    ; Get out early if found something.

	sne.X   space*57+bottom, space*59+bottom
	seq.X   space*58+bottom, space*60+bottom
	mov     #space*57+bottom-found, found
	sne.X   space*33+bottom, space*35+bottom
	seq.X   space*34+bottom, space*36+bottom
	mov     #space*33+bottom-found, found
	sne.X   space*5+bottom, space*7+bottom
	seq.X   space*6+bottom, space*8+bottom
	mov     #space*5+bottom-found, found
	sne.X   space*25+bottom, space*27+bottom
	seq.X   space*26+bottom, space*28+bottom
	mov     #space*25+bottom-found, found
	jmn.B   found, found    ; Get out early if found something.

	sne.X   space*17+bottom, space*19+bottom
	seq.X   space*18+bottom, space*20+bottom
	mov     #space*17+bottom-found, found
	sne.X   space*37+bottom, space*39+bottom
	seq.X   space*38+bottom, space*40+bottom
	mov     #space*37+bottom-found, found
	sne.X   space*53+bottom, space*55+bottom
	seq.X   space*54+bottom, space*56+bottom
	mov     #space*53+bottom-found, found
	jmn.B   found, found    ; Get out early if found something.

	sne.X   space*9+bottom, space*11+bottom
	seq.X   space*10+bottom, space*12+bottom
	mov     #space*9+bottom-found, found
	sne.X   space*29+bottom, space*31+bottom
	seq.X   space*30+bottom, space*32+bottom
	mov     #space*29+bottom-found, found
	sne.X   space*49+bottom, space*51+bottom
	seq.X   space*50+bottom, space*52+bottom
	mov     #space*49+bottom-found, found
        jmn.B   found, found    ; Get out early if found something.

	sne.X   space*21+bottom, space*23+bottom
	seq.X   space*22+bottom, space*24+bottom
	mov     #space*21+bottom-found, found
	sne.X   space*41+bottom, space*43+bottom
	seq.X   space*42+bottom, space*44+bottom
	mov     #space*41+bottom-found, found
	sne.X   space*61+bottom, space*63+bottom
	seq.X   space*62+bottom, space*64+bottom
	mov     #space*61+bottom-found, found
	jmn.B   found, found    ; Get out early if found something.


	jmn.B   found, found    ; Quick-bomb if found something.
        jmp     warrior         ; Execute regular code, because nothing found.

	add     #space, found
found
        jmz.F   -1, 0           ; Goto the location where we found something.

	mov.B   found, backwd   ; Save this value for use in backward bomb.

forward
        mov.I   b1, >found
        mov.I   b2, @found
	add     #(qbomb-1), found
	jmn.F   forward, @found

	sub     #(2*qbomb), backwd      ; Don't re-bomb over forward-scan.

backwd
        mov.I   b2, 0
        mov.I   b1, <backwd
	sub     #(qbomb-1), backwd
	jmn.F   backwd, @backwd


warrior 
        ;boot away clear and start it
        mov     ptr, ptr+bootdist
        mov     bomb, bomb+bootdist
        mov     cc1,      cc1+bootdist+sep
        mov     cc1+1,    cc1+bootdist+sep+1
        mov     cc1+2,    cc1+bootdist+sep+2
        mov     cc1+3,    cc1+bootdist+sep+3

        jmp     cc1+bootdist+sep


ptr     dat     125,     1+sep+1
bomb    dat     >25,     }1       ;28 or 25

        ;sep spaces here

cc1     spl     #25,      1
        mov     @-1-sep-2,    }-1-sep-2
        mov     @-2-sep-2,    }-2-sep-2
        djn.f   -2,     }-3-sep-2


;bombs
b1      spl     #2,     0
b2      mov     -1,     }-1

bottom  end


