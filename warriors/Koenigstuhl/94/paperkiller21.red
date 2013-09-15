;redcode-94
;author JKW
;name Paper Killer 2.1
;assert (CORESIZE == 8000)
; email jkw@koth.org
;strategy Am I falling into predictable patterns here?  pspacing
;strategy oneshot/hsa/blur.  Once again using what I believe
;strategy to be the best possible pspace routine there will ever be...
;strategy I can't remember where I got this oneshot.  I think it's
;strategy out of some other pspacer. :/

org start

w0 equ oneshot ;
w1 equ hsa
w2 equ blur

tgate   equ     (tloop-8)
half    equ     10
step    equ     (2*half)
dstr    equ     3001
tdist   equ     700

tpos    equ     (cptr+1)

oneshot
tboot   mov.i   {tpos,  <tptr
for 4
        mov.i   {tpos,  <tptr
rof
        djn.b   tboot,  #2
        spl.b   *tptr,  <-202
tptr    div.f   #tdist, #tdist+7
        dat.f   }-200,  >-303
        dat.f   #-25,   #cptr+4-tgate
        spl.b   #-20,   #20
b1      spl.b   #120,   #120-half
tloop   sub.f   tstep,  b1
        sne.i   *b1,    @b1
        djn.f   tloop,  <-dstr
tstep   spl.b   #-step, <-step
        mov.i   @cptr,  >tgate
        mov.i   @cptr,  >tgate
cptr    djn.b   -2,     {b1

        dat     0,       SPS-1 ; should point to an about-to-switch thingy
in      dat     0,       1  ;loss
paper   spl     1,      -1  ;win
        spl     1,       1  ;tie

start
think ldp.a  #0,in              ; get input value
load  ldp.a  #PSTATE,state      ; load old state
      mod.a  #STATES,state      ; brainwash protection
      add.ba *in,state          ; select correct state table
store stp.a  *state,load        ; store new state

state jmp    @-state+1, w0
      spl    #-state,   w0
      spl    #-state,   w0
      spl    #-state,   w0
      spl    #-state,   w0
      spl    #-state,   w0
      spl    #(-state+GAP)%STATES, w1
      spl    #-state+1, w1
      spl    #-state,   w1
      spl    #-state,   w1
      spl    #-state,   w1
      spl    #-state,   w1
      spl    #-state,   w1
      spl    #(-state+GAP)%STATES, w2
      spl    #-state+1, w2
      spl    #-state,   w2
      spl    #-state,   w2
      spl    #-state,   w2
      spl    #-state,   w2
      spl    #-state,   w2
      spl    #(-state+GAP)%STATES, w0

PSTATE EQU 250 ; pspace location containing current state
SPS equ 7
GAP EQU (SPS-1)
STATES EQU (SPS*3)  ; maximum number of states (for brainwash protection)

hsa mov    hbtm,@dest
N FOR 8
      mov    hbtm-N,<dest
ROF
      spl    @dest,1
dest: mov    #250,@away
      mov    bomb,<dest
      div.f  #0,dest

hptr EQU (bomb-5)
away EQU (bomb-4000) ; not the actual value

bomb: spl    #1,{1
kill: mov    bomb,<hptr
mptr: mov    >hptr,>hptr
      jmn.f  kill,>hptr
ha    add    #10,@mptr  ;94
      jmz.f  ha,<hptr
      slt    @mptr,#hbtm-hptr+3
      djn    kill,@mptr
      djn    ha,#16
hbtm: jmp    ha,{kill

destdiv2 EQU 2000 ; not really this
edest EQU (2*destdiv2+1) ; odd number :-)

blur
i for 10
mov <bbootptr, {bbootptr
rof
bbootptr jmp 3000, ptr+10


bstep EQU 70; mod-10
gate EQU top

ptr:  mov.i  $inc+1,>bstep ; New DJN protection... better than a SPL?
top:  mov.i  $inc,>ptr    ;                       Or worse?
scan: seq.i  $2*bstep+5,$2*bstep
chg:  mov.b  $scan,@top
a:    add.f  $inc,$scan
      djn.b  $top,#800
inc:  spl.i  #bstep,#bstep
      mov.i  $clr,>gate
btm:  djn.f  $-1,>gate
clr:  dat.f  <1,#clr-gate+2

