;redcode-94b
;name Yet 4b
;author Justin Kao
;strategy This is Yet Another core clear w/quickscan
;assert CORESIZE == 8000

;put the pointers a bit farther away to hide in the spots between?
;#:0123456789012345678901234567890
;4:x   x   x   x   x   x   x   x
;5:x    x    x    x    x    x    x
;me:xx                 xxxxx
;a bit big for avoiding bombs now....

sep     equ 17
bootdist equ 6000

        org     scan

        ;begin quick scan

space   equ     (CORESIZE/81)   ; Step when scanning for code.
qbomb   equ     6               ; Step when bombing.

scan    sne.X   space*1+bottom, space*3+bottom
	seq.X   space*2+bottom, space*4+bottom
	mov     #space*1+bottom-found, found
	sne.X   space*45+bottom, space*47+bottom
	seq.X   space*46+bottom, space*48+bottom
	mov     #space*45+bottom-found, found
	sne.X   space*65+bottom, space*67+bottom
	seq.X   space*66+bottom, space*68+bottom
	mov     #space*65+bottom-found, found
	jmn.B   found, found    ; Get out early if found something.

	sne.X   space*13+bottom, space*15+bottom
	seq.X   space*14+bottom, space*16+bottom
	mov     #space*13+bottom-found, found
	sne.X   space*57+bottom, space*59+bottom
	seq.X   space*58+bottom, space*60+bottom
	mov     #space*57+bottom-found, found
	sne.X   space*69+bottom, space*71+bottom
	seq.X   space*70+bottom, space*72+bottom
	mov     #space*69+bottom-found, found
	jmn.B   found, found    ; Get out early if found something.

	sne.X   space*5+bottom, space*7+bottom
	seq.X   space*6+bottom, space*8+bottom
	mov     #space*5+bottom-found, found
	sne.X   space*25+bottom, space*27+bottom
	seq.X   space*26+bottom, space*28+bottom
	mov     #space*25+bottom-found, found
        sne.X   space*73+bottom, space*75+bottom
	seq.X   space*74+bottom, space*76+bottom
	mov     #space*73+bottom-found, found
	jmn.B   found, found    ; Get out early if found something.

	sne.X   space*17+bottom, space*19+bottom
	seq.X   space*18+bottom, space*20+bottom
	mov     #space*17+bottom-found, found
	sne.X   space*37+bottom, space*39+bottom
	seq.X   space*38+bottom, space*40+bottom
	mov     #space*37+bottom-found, found
	sne.X   space*77+bottom, space*79+bottom
	seq.X   space*78+bottom, space*80+bottom
	mov     #space*77+bottom-found, found
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

	sne.X   space*33+bottom, space*35+bottom
	seq.X   space*34+bottom, space*36+bottom
	mov     #space*33+bottom-found, found
	sne.X   space*53+bottom, space*55+bottom
	seq.X   space*54+bottom, space*56+bottom
	mov     #space*53+bottom-found, found

	jmn.B   found, found    ; Quick-bomb if found something.
        jmp     warrior         ; Execute regular code, because nothing found.

	add     #space, found
found   jmz.F   -1, 0           ; Goto the location where we found something.

	mov.B   found, backwd   ; Save this value for use in backward bomb.

forward mov.I   b1, >found
        mov.I   b2, @found
	add     #(qbomb-1), found
	jmn.F   forward, @found

	sub     #(2*qbomb), backwd      ; Don't re-bomb over forward-scan.

backwd  mov.I   b2, 0
        mov.I   b1, <backwd
	sub     #(qbomb-1), backwd
	jmn.F   backwd, @backwd

        ;boot away clear and start it
warrior mov     movptr, movptr+bootdist
        mov     djnptr, djnptr+bootdist
        mov     clear-1,    clear+bootdist+sep-1
        mov     clear,      clear+bootdist+sep
        mov     clear+1,    clear+bootdist+sep+1
        mov     clear+2,    clear+bootdist+sep+2
        mov     clear+3,    clear+bootdist+sep+3

        jmp     clear+bootdist+sep

;core clear
movptr  dat     {4000,   {200
djnptr  dat     {4000,   {200

;when booted there are sep(=17) spaces here

        dat     {sep+9,    {1
clear   spl     #sep+12,    1
        mov     clear,   }-2-sep-2	;== mov clear, }movptr
        mov     clear,   }-3-sep-2
        djn.a   -2,     >-4-sep-1	;== djn.a -2, >djnptr

;qscan bombs
b1      spl     #2,     0
b2      mov     -1,     }-1

bottom  end

