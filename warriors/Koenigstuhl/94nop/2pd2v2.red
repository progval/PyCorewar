;redcode
;name 2-p d 2 (v2)
;author P._V._K.
;assert 1

inc	dat.f	(2376*3),(2376*3)+1

start   add.f   inc,    st
	mov.i	jb,	*st
        mov.i   mb,     @st
        mov.i   sb,     <st
st      mov.i   -3,     *-3+2376
        djn.b   -5,     #333
        jmz.f	clear,	start-2
mb      mov.i   @0,     >-1
sb	spl	#2376,	2
jb      jmp     2376,   7
	dat.f	0,0
clear	spl	#-1,	6
	mov.i	*bp,	>jb
	djn.f	-1,	<-20
db	dat.f	-4,	6
bp	dat.f	-4,	0
        end     start

