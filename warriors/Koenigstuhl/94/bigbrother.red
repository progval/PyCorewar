;redcode-94
;name Big Brother
;author Philip Kendall
;strategy P^2 -> one shot/stone
;assert CORESIZE==8000
;planar boot,scan,clear,gate,stone,pspace

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

        spl.a   #1,1
        spl.b   #1,1
        spl.ab  #1,1            ; scanned-lo

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

        spl.ba  #1,1
        spl.f   #1,1
        spl.x   #1,1
        spl.ab  #1,1            ; scanned-hi

pstate  equ     666     ; pspace location containing current state
num     equ     6       ; maximum number of states

        dat     0,init_state-state
in      dat     0,loss_table-state
        dat     0,win_table-state
        dat     0,tie_table-state

think   ldp.a   #0,in              ; get input value
load    ldp.a   #pstate,state      ; load old state
        mod.a   #num,state         ; brainwash protection
        add.ba  *in,state          ; select correct state table
store   stp.a   *state,load        ; store new state
state   jmp     @0                 ; jump to warrior code

        for     4
        dat.f   1,1
        rof
        spl.a   #1,}1           ; scanned-lo

c1      equ     pBoot
c2      equ     oStart

loss_table
        dat     1,c1
        dat     2,c1
        dat     3,c2
        dat     4,c2
        dat     5,c2
        dat     0,c1

win_table
tie_table
init_state
        dat     0,c1
        dat     0,c1
        dat     0,c1
        dat     3,c2
        dat     3,c2
        dat     3,c2

        for     (MAXLENGTH-CURLINE)/3
        spl.a   #1,<1
        spl.a   #(CURLINE*13),>(CURLINE*17)
        for     (CURLINE!=90)
        spl.a   #1,}1
        rof
        for     (CURLINE==90)
        dat.f   0,0
        rof
        rof

        end     think
