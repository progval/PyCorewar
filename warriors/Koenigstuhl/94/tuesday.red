;redcode-94
;name Tuesday Afternoon
;author John K W
;strategy pspace: pclear, paper, scanner
;assert 1

org start

w0 equ alien
w1 equ scan
w2 equ pclear;

DEAD equ start + 100
PSTATE EQU 145 ; pspace location containing current state
STATES EQU (lastp+1-state) ; maximum number of states (for brainwash protection)

start
think ldp.a  #0,in              ; get input value
load  ldp.a  #PSTATE,state      ; load old state
      add.ba *in,state          ; select correct state table
      mod.a  #STATES,state      ; brainwash protection
store stp.a  *state,load        ; store new state
state jmp    @0,        w0
      spl    #-state,   w0
      spl    #-state,   w0
      spl    #-state,   w0
      spl    #-state,   w0
w00   spl    #-state,   w0
      spl    #-state+w11, w1

      spl    #-state+1, w1
      spl    #-state,   w1
      spl    #-state,   w1
      spl    #-state,   w1
      spl    #-state,   w1
w11   spl    #-state,   w1
      spl    #-state+w22,      w2

      spl    #-state+1, w2
      spl    #-state,   w2
      spl    #-state,   w2
w22   spl    #-state,   w2
lastp spl    #-state+w00,      w0

        dat     0,      w00-state     ;should point to an about-to-switch thingy
;********************** PAPER
in      dat     0,      1       ;loss
iStart  spl    1,          -1   ;win
        spl    1,          0    ;tie
        spl    1,          0
        spl    1,          0
        spl    1,          0
        spl    2,          0
        djn.f  imp,        <-250
        add    bst,        -1
        djn.f  cSp+cBptr,  <-100
bst     dat    iStep,      -100

cBptr   equ    3000
iStep   equ    2667

alien
cBoot   spl    iStart
        mov    cBomb,      cSp+cBptr+198
        mov    cSp,        cSp+cBptr
        mov    cSp+1,      cSp+cBptr+1
        mov    cSp+2,      cSp+cBptr+2
        mov    cSp+3,      cSp+cBptr+3
        jmp    cSp+cBptr,  {0

cSp     spl    #0,         <-1151+3
        mov    197,        cAd-(197*3500)
cAd     add.ab {0,         }0    
        djn.f  -2,         <-1151
cBomb   dat    >-1,        >1

imp     mov.i   #iStep,      *0

;************ BLUR

dist equ 2942 ;boot distance
step equ 2891 ;scan pattern; -723 might be better
time equ 2210 ;number of SPLs copied

scan   mov <bboot, <btop
i    for 4
       mov <bboot, <btop
     rof
        djn     scan+1, #2
bboot   jmp     bstart+dist, btop+9

btop    mov.b  2, #dist+9
       mov   sp, >btop
       add #step, #-step*time
bstart jmz.f -2, @-1
       jmn  btop, *btop
sp     spl   0, 0
       mov    2, >btop-4
       djn.f -1, >btop-4
       dat    <1,  6-btop

;************ harq's HSA

sFIRST	equ	(swipe-sptr-SDIST+100)
sSTEP   equ     (8)
sptr	equ	(swipe-5)

swdat	dat	0	,	{0
swspl	spl	#1	,	}1
swipe	mov	swspl	,	<sptr
spptr	mov	>sptr	,	>sptr
	jmn.f	swipe	,	>sptr
sscan	add	#sSTEP	,	@spptr
	jmz.f	sscan	,	<sptr
	slt	@spptr	,	#ssend+3-sptr
	djn	swipe	,	@spptr		; is this causing problems?
	djn	sscan	,	#12
ssend	jmp	sscan	,	{swipe

SDIST   equ     (3600)

HSA	mov	#sFIRST	,	sptr+SDIST
scploop	mov	<ssrc	,	<sdst
	mov	<ssrc	,	<sdst
	mov	<ssrc	,	<sdst
	djn	scploop	,	#3
ssrc	spl	@sdst	,	ssend+1
	mov	<ssrc	,	<sdst
	mov	<ssrc	,	<sdst
sdst	div.f	#0	,	#swdat+SDIST+11

;*************** PCLEAR

paGate    equ    Pair-7

pclear
slPair    mov    #-3950,paGate+1300-7  ; initialize wipe pointers
          mov    #-3950,paGate+5302-7
          spl    1                     ; use multiple processes
          mov    -1,0
          spl    1
          mov    <paBoot1,{paBoot1     ; boot 'em up
          mov    <paBoot2,{paBoot2
paBoot1   spl    Pair+1300,Pair+6
paBoot2   jmp    Pair+5302,Pair+6

Pair      spl    #0     ,}paGate
          mov    paBomb ,>paGate
          mov    paBomb ,>paGate
          djn.f  -1     ,>paGate
          dat    0,0
paBomb    dat    >1,15


