;redcode-lp
;author Roy van Rijn
;name 100%% Evil
;strategy Warrior made for a fast IRC-Tournament
;strategy Made a bit nicer with a scanner pspaced to it, and a qscan
;strategy ---
;strategy I'm trying to give Chris some competition :)
;assert 1

pap     mov   #8,       #8
        add.a #2343,    to
ploop   mov   <pap,     {to
        mov   4,        {4412
        jmn   ploop,    pap
        spl   pap,      {4212
to      jmz   5223,     *0
        dat   }1,       >1

for	24
	dat   0,	0
rof

incr  equ 2946
time  equ 3980

stone   add.f  2, 1
        mov  > 0+(2*time), 0-(incr*time)
        jmp   -2, <incr

for	20
	dat   0,	0
rof


_RESULT equ #0
_STRAT  equ #116

ld      mov >loss,    <900
        mov.ba loss,  1
        stp #0,       _STRAT
        jmp choose,   <1000

pap2
res     ldp _RESULT,  #0
loss    ldp _STRAT,   #0
        djn ld,       res
choose  mod.ab #2,    loss
        jmz scan,     loss

        mov    <pptr     ,{pptr
        djn    -1        ,#8
pptr    spl    3105      ,to+2
        spl    pap
        jmp    stone

for	30
	dat   0,	0
rof

step    equ     98
protect equ     (adjust-scan)
stream  equ     -1308
scan1   equ     (loop+step)

ptr     equ     (inc-2)
cstart  equ     (adjust+2-ptr)

inc     dat.f   (step*2),(step*2)
loop    add.f   inc,@x
scan    cmp.i   scan1+step,scan1
        slt.ab  #protect,@x
        djn.f   loop,<stream
        mov.i   jbomb,@scan
x       mov.i   sbomb,<scan
        add.f   adjust,scan
        jmn.a   @x,inc
sbomb   spl.a   #0,}ptr
clear   mov.i   dbomb,>ptr
jbomb   jmp.a   -1,}ptr
dbomb   dat.f   >2667,>cstart
adjust  dat.f   step,(step+1)

for	20
	dat   0,	0
rof

	dat	<15,	<10	; A,D
qtab	dat	<7,	<4	; B,E
	dat	<13,	<11	; C,F
qbmb	dat	<76,	<1

qf	equ	qptr
qs	equ	-100
qd	equ	4000
qi	equ	9
qr	equ	12

;    -+)>] 0/1 cycles [(<+-

qscan	seq	qd+qf+qs,	qf+qs      ; 1
	jmp	qSki,	{qd+qf+qs+qi
	seq	qd+qf+8*qs,	qf+8*qs    ; B+1
	jmp	qfast,	}qtab
	seq	qd+qf+13*qs,	qf+13*qs   ; C
	jmp	qfast,	}qfast
	seq	qd+qf+6*qs,	qf+6*qs    ; B-1
	jmp	qfast,	{qtab
	seq	qd+qf+14*qs,	qf+14*qs   ; A-1
	djn.a	qfast,	{qfast
	seq	qd+qf+15*qs,	qf+15*qs   ; A
	jmp	qfast,	{qfast
	seq	qd+qf+7*qs,	qf+7*qs    ; B
	jmp	qfast,	{qd+qf+7*qs+qi

;    -+>)] 2 cycles [(<+-

	seq	qd+qf+4*qs,	qf+4*qs    ; E
	jmp	>qfast,	{qd+qf+4*qs+qi
	seq	qd+qf+77*qs,	qf+77*qs   ; B*F
	jmp	qslow,	}qslow
	seq	qd+qf+70*qs,	qf+70*qs   ; B*D
	jmp	qslow,	{qslow
	seq	qd+qf+5*qs,	qf+5*qs    ; E+1
	jmp	>qfast,	>qtab
	seq	qd+qf+63*qs,	qf+63*qs   ; B*(D-1)
	djn.b	qslow,	{qslow
	seq	qd+qf+3*qs,	qf+3*qs    ; E-1
	jmp	>qfast,	<qtab
	seq	qd+qf+56*qs,	qf+56*qs   ; (A-1)*E
	djn.a	qslow,	{qfast
	seq	qd+qf+39*qs,	qf+39*qs   ; C*(E-1)
	djn.b	qslow,	}qfast
	seq	qd+qf+24*qs,	qf+24*qs   ; (B-1)*E
	jmp	qslow,	{qtab
	seq	qd+qf+35*qs,	qf+35*qs   ; B*(E+1)
	jmp	qslow,	>qtab
	seq	qd+qf+60*qs,	qf+60*qs   ; A*E
	jmp	qslow,	{qfast
	seq	qd+qf+21*qs,	qf+21*qs   ; B*(E-1)
	jmp	qslow,	<qtab
	seq	qd+qf+11*qs,	qf+11*qs   ; F
	jmp	>qfast,	}qslow
	seq	qd+qf+32*qs,	qf+32*qs   ; (B+1)*E
	jmp	qslow,	}qtab
	seq	qd+qf+10*qs,	qf+10*qs   ; D
	jmp	>qfast,	{qslow
	seq	qd+qf+66*qs,	qf+66*qs   ; (B-1)*F
	djn.a	qslow,	}qslow
	seq	qd+qf+52*qs,	qf+52*qs   ; C*E
	jmp	qslow,	}qfast
	seq	qd+qf+18*qs,	qf+18*qs   ; (B-1)*(E-1)
	djn.f	qslow,	qtab
	seq	qd+qf+9*qs,	qf+9*qs    ; D-1
	djn.b	>qfast,	{qslow
	sne	qd+qf+28*qs,	qf+28*qs   ; B*E
	jmz	*qend,	qd+qf+28*qs-10

; ***** Q-SCAN BOMBER *****

qslow	mul.b	qtab,	qptr	; decode
qfast	mul.ab	qtab,	@qslow
qSki	sne	>3456,	@qptr
	add	#qd,	qptr
qloop	mov	qbmb,	@qptr	; .5c negative bomber
qptr	mov	qbmb,	*qs
	sub	#qi,	qptr
	djn	qloop,	#qr
qend	jmp	pap2,	<1234

end	qscan

