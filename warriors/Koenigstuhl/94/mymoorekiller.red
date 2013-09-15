;redcode
;name myMooreKiller
;author Magnus Paulsson
;assert 1
;
; Moore improved my warrior myBlur into a realy good warior
; would be a fitting way to thank him by beating him here!
;
; Thinking, Moore has written nice p-space warriors, some
; switch after two losses or ties. So I write my first
; p-space warrior that use mini-HSA, two losses->two rounds 
; of Jed Imp (hoping that Moore will switch).
; The only problem is the small logical inconsistency that
; there is no reason to switch on ties since we're not 
; fighting a hill!
;
; Testing gives losses to most wariors but .... :-)

org think

;----------
; Jed by JKW
;----------

d2    equ 1143;2667
TSTEP equ 3120;1751
bstep equ 2365;1819 ;2283 ;1997
jboot  equ 1700-(80+15)*4-1

w1   spl     1
        spl     1
        spl     e4
        spl     1
        mov     <b,     {b
b:      jmp     jboot,   imp2+1
evol:   spl     @evol,  }TSTEP
        mov.i   }evol,  >evol
evoli:  spl     #d2,    bstep-1
        mov     jedbmb,   >2
        add.f   evoli,  j
j:      jmp.f   imp2-(d2+1), {-4+bstep
jedbmb    dat     {1,     {2
imp2    mov.i   #d2,    *0


;----------
; Mini HSA : HSA by Paul Kline, Mini by ?
;----------

mst	equ	9
ptr	equ	(bomb-5)

away	equ	5000

bomb	spl    #1,{1
kill	mov    bomb,<ptr
mptr	mov    >ptr,>ptr
	jmn.f  kill,>ptr
a	add    #mst+1,@mptr
scan	jmz.f  a,<ptr
	slt    @mptr,#btm-ptr+3
	djn    kill,@mptr
	djn    a,#15
btm	jmp    a,{kill
hp	dat.f	0,	-1

w0
boot	mov    btm,@dest
for 4
	mov	<hp,<dest
rof
	djn.b	-4,	#2
	spl    @dest,1
dest	mov    #250,@away
	mov    bomb,<dest
	div.f  #0,dest


;----------
; Brain : Took D. Moores P^3 from corewarior 70 but couldn't be bothered
;   to analyze it and ended up with this.
;----------

PSTATE	equ	5731

think	ldp.a	#0,in
	ldp.a	#PSTATE,table
	mod.a	#12,table
	add.ba	*in,table
	stp.b	*table,#PSTATE
table	jmp	*1	

ptab		;state1 use HSA
	dat.f	w0,0		;w
	dat.f	w0,0		;t
	dat.f	w0,3		;l goto state2

		;state2
	dat.f	w0,0		;w goto state1
	dat.f	w0,0		;t goto state1
	dat.f	w1,6		;l goto state3

		;state3 use Jed
	dat.f	w1,9		;w goto state4
	dat.f	w1,9		;t goto state4
	dat.f	w0,0		;l goto state0

		;state4 use HSA
	dat.f	w0,0		;w goto state1
	dat.f	w0,0		;t goto state1
	dat.f	w0,0		;l goto state1



	dat.f	0,ptab-table
in    dat 0, ptab-table+2 ;l ; must have non-zero b-field in the
previous cell
      spl 1, ptab-table+0 ;w
      spl 1, ptab-table+1 ;t

;----------
; second half of Jed by JKW
;----------

d    equ 2667

e4:     spl     #d,     bstep-1
        add.f   e4,     1
        jmp.f   imp-(d+1), {-4+bstep
imp     mov.i   #d,     *0 