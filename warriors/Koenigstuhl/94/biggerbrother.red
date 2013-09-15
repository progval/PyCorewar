;redcode-94
;name Bigger Brother
;author Philip Kendall
;strategy P^2 -> one shot/stone/paper
;assert CORESIZE==8000
;planar boot,scan,clear,gate,stone,pspace,paper

        dat.f   }1,>1           ; scanned-lo

oBdist  equ     1111

oStart
i       for     12
        mov.i   (oDbomb+i-1),>oBptr
        rof
oBptr   spl.a   (oScan+oBdist),(oDbomb+oBdist)
        div.f   oBptr,oBptr
        dat.f   }1,>1           ; scanned-hi

oStep   equ     30
oSep    equ     15
oStream equ     -1507
oScan1  equ     (oCptr+22)
oPtr    equ     (oDbomb-3)
oCstart equ     (oCptr+2-oPtr)

oDbomb  dat.f   -20,>oCstart
oSbomb  spl.a   #0,>oCstart
oLoop   sub.f   oInc,oScan
oScan   sne.i   oScan1,oScan1+oSep
        sub.f   oInc,oScan
        sne.i   *oScan,@oScan
        jmz.b   oLoop,#0
        mov.ab  oScan,oPtr
oInc    spl.a   #-oStep,>-oStep
oClear  mov.i   @oCptr,>oPtr
        mov.i   @oCptr,>oPtr
oCptr   djn.b   oClear,{oSbomb

        dat.a   #1,1
        dat.b   #1,1
        dat.ab  #1,1            ; scanned-lo

pBdist  equ     -2138
pOffset equ     15

pBoot   mov.i   pLast ,@pBptr
        mov.i   pHit  ,<pBptr
        mov.i   pLoop ,<pBptr
pBptr   mov.i   pBomb ,*(pLast+pBdist)
        mov.i   pStart,<pBptr
        jmp.a   @pBptr,<4000

pStep   equ     197
pStream equ     (pStart-1152)

pStart  spl.a   #0, <pStream
pLoop   mov.i   (pStart-pOffset), pStep
pHit    add.ab  #pStep,pLoop            ; gets bombed to start coreclear
pLast   djn.f   pLoop, <pStream
pBomb   dat.f   >-1,>1

        dat.ba  #1,1
        dat.f   #1,1
        dat.x   #1,1
        dat.ab  #1,1            ; scanned-hi

pstate  equ     237     ; pspace location containing current state
num     equ     7       ; maximum number of states

        dat     0,init_state-state
in      dat     0,loss_table-state
        dat     0,win_table-state
        dat     0,tie_table-state

c1      equ     pBoot
c2      equ     oStart
c3      equ     cStart

think   ldp.a   #0,in              ; get input value
load    ldp.a   #pstate,state      ; load old state
        mod.a   #num,state         ; brainwash protection
        add.ba  *in,state          ; select correct state table
store   stp.a   *state,load        ; store new state
win_table
init_state
state   jmp     @0,c1
        dat     0,c1
        dat     0,c1
        dat     3,c2
        dat     3,c2
        dat     5,c3            ; scanned-lo
        dat     5,c3

loss_table
        dat     1,c1
        dat     2,c1
        dat     3,c2
        dat     4,c2
        dat     5,c3
        dat     6,c3
        dat     0,c1

        for     6
        dat.f   1,1
        rof
        dat.f   5,16            ; scanned-hi

cStart  spl.a   1,<-3000
        mov.i   -1,0
        mov.i   -1,0
        mov.i   -1,0

cDist1  equ     3039
cDist2  equ     2365
cDist3  equ     777
cLen    equ     9
cGate   equ     -10

cPaper1 spl     @0,>cDist1
        mov     }cPaper1,>cPaper1
cPaper2 spl     @0,>cDist2
        mov     }cPaper2,>cPaper2
cPaper3 spl     @0,>cDist3
cPtr    mov     }cPaper3,>cPaper3
cAttack mov     cBomb,<cPtr
        jmp     cAttack,<cGate
cBomb   dat     >2667,>(2667*2)

        dat.f   1,1
        dat.f   0,0             ; scanned-lo

tie_table
        dat.f   0,c1
        dat.f   0,c1
        dat.f   0,c1
        dat.f   3,c2
        dat.f   3,c2
        dat.f   3,c2
        dat.f   5,c3

        end     think
