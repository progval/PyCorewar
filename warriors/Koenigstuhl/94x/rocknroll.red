;redcode-94x
;name Rock'n'Roll
;author Christian Schmidt
;assert 1
;strategy Well, I guess Janeczek will come with an
;strategy unexpected strategy, so I really don't know
;strategy what to do. There was not much time, so that
;strategy I have finaly choosen a two component p-warrior
;strategy strongly based on jkw's Black Box, but with 
;strategy a simpler p^2 brain ;-)
;strategy It should slightly win against most warriors,
;strategy especially against multi component p-warriors.

        org    pThink


pStr1   equ     paper
pStr2   equ     bstone
pLoc    equ     871

pInit   dat.f   #0,          #0
pLoss   dat.f   #0,          #1
pWin    dat.f   #0,          #-1
pTie    dat.f   #0,          #0

pThink  ldp.a   #0,          pLoss
        ldp.a   #pLoc,       pTable
        add.ba  *pLoss,      pTable
        mod.a   #9,          pTable   
        stp.ab  *pTable,     #pLoc

pTable  jmp.b   @0,          pStr1  

        dat.f   #1,          pStr1    
        dat.f   #2,          pStr1
        dat.f   #3,          pStr1
        dat.f   #4,          pStr1

        dat.f   #7,          pStr2      
        dat.f   #7,          pStr2     
        dat.f   #8,          pStr2
        dat.f   #9,          pStr2    
  
for 75
dat 0, 0
rof

d       equ    34117
TSTEP   equ    3520
bstep   equ    16373

paper	spl	1
	spl	1
	mov	-1,	0
	spl	1

evol:   spl	@evol,  }TSTEP
	mov.i   }evol,  >evol
evoli:  spl	#d,    bstep-1
	mov	b1,	>2
	add.f   evoli,  j
j:	jmp	imp2-(d*14), {+1+bstep
	dat	0,	0
	dat	0,	0
	dat	0,	0
	dat	0,	0
	dat	0,	0
	dat	0,	0
b1	dat	<1,	1
imp2    mov.i   #d,	*0

for 70
dat 0, 0
rof

step    equ     185
away    equ     23750
djnoff  equ     -5000

bstone	mov	<booter1,{booter1
	mov	<booter1,{booter1
	mov	<booter1,{booter1
booter1 jmp	stone+20000, stone+3

sStep	equ	16238
off	equ	145
stone	mov	}off,	1-sStep
		sub.x	#sStep,	-1
		jmp	-2,	}-2
