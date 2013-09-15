;redcode-94
;name NCC-1701-A
;author Philip Kendall
;strategy Captain Kirk is commanding the USS Enterprise
;strategy He has two weapons at his disposal:
;strategy 1) Photon Torpedoes (aka One Shot)
;strategy 2) Phasers (modified Carbonite)
;strategy Original self-destructed over Genesis to prevent Khan
;strategy from gaining possession
;strategy The new version has an improved phaser array
;strategy Also, Kirk has had advanced tactical training from Starfleet
;assert CORESIZE==8000
;planar pspace,boot,stone,scan,clear,gate
;show source

;show off
tStep   equ     30
tSep    equ     15
tStream equ     (tPtr-412)
;show on

tScan1  equ     (tInc+tStep)
tImp    equ     2667
tCstart equ     (tLast+2-tPtr)

tPtr    dat.f   tBomb1,#0               ; scanned-low
tBomb3  dat.f   >tImp,>(2*tImp)
tInc    dat.f   tStep,tStep
tBomb2  spl.a   #(tBomb3-tPtr),tCstart
tLoop   add.f   tInc,tScan
tScan   sne.i   tScan1,tScan1+tSep
        djn.f   tLoop,<tStream
        mov.ab  tScan,tPtr
tBomb1  spl.a   #(tBomb2-tPtr),tCstart
tClear  mov.i   *tPtr,>tPtr
        mov.i   *tPtr,>tPtr
tLast   djn.f   tClear,<tStream

        spl.a   #1,1
        spl.a   #1,1
        spl.a   #1,1
        dat.f   (tBomb1-tPtr),#0        ; scanned-hi

;show off
tBdist  equ     3018
;show on

tBoot
i       for     (tLast-tPtr+1)
        mov.i   (tPtr+i-1),>tBptr
        rof
        spl.a   *tBptr,>-1000
        div.f   tBptr,tBptr
tBptr   dat.f   (tScan+tBdist),(tPtr+tBdist) ; scanned-low

        spl.a   #1,1

;show off
pspace1 equ     318
pspace2 equ     167
;show on

losses  equ     4

kirk    ldp.ab  #0,#0
        ldp.a   #pspace1,strat
        jmn.b   win,kirk
loss    ldp.ab  #pspace2,#0
        nop.f   >loss,}-400
        mod.ab  #losses,loss
        jmn.b   win,loss
        nop.f   }strat,>-800
        stp.ab  strat,#pspace1
win     stp.b   loss,#pspace2
        mod.a   #2,strat
strat   jmp.a   @0,pBoot
        spl.a   #1,tBoot

        dat.f   1,1                     ; scanned-hi
        spl.a   #1,*1

;show off
pBdist  equ     -2138
;show on

pBoot   mov.i   {pBomb,{pBptr
        mov.i   pBomb,@pBptr
        mov.i   {pBomb,{pBptr
        mov.i   {pBomb,{pBptr
        mov.i   {pBomb,{pBptr
        spl.a   *pBptr,<4000
        div.f   pBptr,pBptr
pBptr   dat.f   #pStart+pBdist,#pStart+pBdist-pOffset-4

        spl.ab  *1,#1
        spl.ba  *1,#1
        spl.f   *1,#1
        spl.x   *1,#1
        spl.i   *1,#1
        spl.a   #1,#1                   ; scanned-low
        spl.a   #1,*1
        spl.b   #1,*1

;show off
pOffset equ     15
pStep   equ     197
pStream equ     (pStart-1152)
;show on

pStart  spl.a   #0, <pStream
pLoop   mov.i   (pStart-pOffset), pStep
pHit    add.ab  #pStep,pLoop            ; gets bombed to start coreclear
        djn.f   pLoop, <pStream
pBomb   dat.f   >0, >2667               ; a-field changed to -1 by boot

        spl.a   *1,#1
        spl.b   *1,#1
        spl.ab  *1,#1
        spl.ba  *1,#1
        spl.f   *1,#1
        spl.x   *1,#1
        spl.i   *1,#1
        spl.a   #1,#1                   ; scanned-hi
        spl.a   #1,*1
        spl.b   #1,*1
        spl.ab  #1,*1
        spl.ba  #1,*1
        spl.f   #1,*1
        spl.x   #1,*1
        spl.i   #1,*1
        spl.a   *1,#1
        spl.b   *1,#1
        spl.ab  *1,#1
        spl.ba  *1,#1
        spl.f   *1,#1
        spl.x   *1,#1
        spl.i   *1,#1
        dat.f   0,0                     ; scanned-low
        spl.a   #1,1
        spl.a   #1,1
        spl.a   #1,1
        spl.a   #1,1
        spl.a   #1,1
        spl.a   #1,1
        spl.a   #1,1
        spl.a   #1,1
        spl.a   #1,1

        end     kirk
_
