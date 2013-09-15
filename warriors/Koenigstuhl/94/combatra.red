;redcode-94
;name Combatra
;author David Moore
;strategy Start each battle with a few quick scans. If nothing
;strategy is found, then run either a core clear or a bomber.
;strategy Otherwise, assume that Combatra found the opponent's
;strategy original 100 instructions. Probe to discover where its
;strategy processes run. Remember where everything is. Compute
;strategy the bootstrap distance. Later, a scanner finds the enemy
;strategy simply by locating its enormous boot code.
;assert CORESIZE==8000 && MAXLENGTH==100

org start

;----------------------------------------------------------------------
; the core clear is used either alone or with the scanner

cgate   dat    -1,  sFirst
        dat <5334, <2667
        dat    -1,  12
clear   spl #3891,  sScan  ; spl #3891, 18
        mov    -1, >cgate
        mov   *-1, >cgate
        djn.a  -2,  cgate
        djn.a  -3, *-1

        dat 0,0
        dat 0,0
        dat 0,0
        dat 0,0  ; scanned

sDiff   equ    65 ; difference between sScan and cgate after boot
sStep   equ    98
sFirst  equ  1283

; Boot the scanner to take advantage of the magic number

sBoot   mov  <away, <where
        ldp.a #pBoot, sStore
        mov  <away, <where
        mov  >clear, >sJump
        djn -2, #7
sJump   djn.f start+dist-3+sDiff+1, #start+dist-3+sDiff

sScan   add.ab #sStep+1, @2
        jmz.f  sScan, <sScan-sDiff
        jmz.f  sScan, <sScan-sDiff    ; ignore the loners
        spl (-3-sDiff)+3, <(-3-sDiff) ; write over what I just found
        djn.a  #6, #4                 ; after about 12 SPLs, change
sStore  add.ab #0, -5-sDiff           ; attack to hit booted opponent
        dat 0,0

;----------------------------------------------------------------------
; bomber taken from Kline's Floody River and hacked

bstep   equ 7829
btime   equ  863
btime2  equ  420

bomb    spl #bstep*2, -bstep
        mov {(bomb-2)+bstep*btime2, @3-(bstep*2)*btime
        mov   bomb, @-1
        add.x bomb,  -2
        djn.f -3, {-(bstep*2)*(btime-1)  ; hit by SPL to start clear
        mov    2, >bomb-3
        djn.f -1, >bomb-3
        dat <2667, 6-bomb

;----------------------------------------------------------------------
; Did I find something last time?

check   ldp.a #pTroll, tab
        add.a   #5,  tab  ; ignore small numbers
tab     slt.ab  #0, #11
        jmp compute,  9   ; (yes, go compute the boot distance)
        jmp bBoot,   10   ; (no, keep trolling)

; Compile all of my information into one nice number

compute ldp.a #pQuick, diff
diff    sub.a  #0, tab
        add.a #((start-qPtr)+tDist+5-6)-11-196, tab
        stp.ab tab, #pBoot
        stp.ab #6, #pMode  ; run scanner next time
        jmp boot, 0  ; I'm too slow to risk booting everything now

        dat 0,0
        dat 0,0
        dat 0,0
        dat 0,0  ; scanned

pMode   equ 271  ; overall strategy (code for one of the 11 states)
pBoot   equ 292  ; opponent's bootstrap distance

; intermediate results used to compute pBoot
pQuick  equ 433  ; what cell was quickscanned
pTroll  equ 454  ; what cell was occupied by the opponent

start   ldp.a #0, tab
        ldp.a #pMode, state
        mod.ba *tab,state; current;  next      loss       win       tie
        stp.b *1, #pMode ;  state ; state      ----       ---       ---
state   jmp     }0, 472  ; 0 check; 472= 42*11+ 10 = 52*9+ 4 = 47*10+ 2
        spl #check, 472  ; 1 check; 472= 42*11+ 10 = 52*9+ 4 = 47*10+ 2
        spl #bBoot, 472  ; 2 bomb ; 472= 42*11+ 10 = 52*9+ 4 = 47*10+ 2
        spl #sBoot, 943  ; 3 scan ; 943= 85*11+  8 =104*9+ 7 = 94*10+ 3
        spl #bBoot,  qA  ; 4 bomb ;3874=352*11+  2 =430*9+ 4 =387*10+ 4
qTable  spl #cBoot,  qB  ; 5 clear;2705=245*11+ 10 =300*9+ 5 =270*10+ 5
        spl #sBoot,  qC  ; 6 scan ;1536=139*11+  7 =170*9+ 6 =153*10+ 6
        spl #sBoot, 267  ; 7 scan ; 267= 24*11+  3 = 29*9+ 6 = 26*10+ 7
        spl #sBoot, 768  ; 8 scan ; 768= 69*11+  9 = 85*9+ 3 = 76*10+ 8
        spl #sBoot, 849  ; 9 scan ; 849= 77*11+  2 = 94*9+ 3 = 84*10+ 9
        jmp #cBoot, 455  ;10 clear; 455= 41*11+  4 = 50*9+ 5 = 45*10+ 5

;----------------------------------------------------------------------
; program intended to "troll" the enemy into revealing its location

tStep  equ 98
tTime  equ 2448

troll  mov    @0, *5
       add.f   3,  4
       jmz.a  -2,  1
       stp.ab #0, #pTroll
       jmp  #tStep, <-tStep
       ; this bomb causes my foe to report its location to me
       mov.a #(-2-tStep*tTime), -2-(-2-tStep*tTime)

; quickscan got something! (presumably boot code)

tDist   equ  2100 ; difference between start and troll after boot

tBoot   mov <tJump, {tJump
        mov <tJump, {tJump
        djn -2, #3
qCalc   mul.ba qTable, qPtr   ; compute the scanned location
qPtr    sne     qX, datZero
        add.a #qDiff, qPtr
        stp.ab qPtr, #pQuick  ; remember where I found it
        stp.ab  #1,  #pMode   ; next time, check the results
        stp.ab  #0,  #pTroll  ; forget previous troll now
tJump   djn.f start+tDist+6, #troll+6  ; start trolling

bAway   dat -3, bomb-(clear-3)

        dat 0,0
datZero dat 0,0
        dat 0,0
        dat 0,0  ; scanned

bBoot   add.f bAway, away  ; converts clear boot into bomber boot

; note: changing the distance between qTable and qPtr affects
; both the quickscan and the pspace!

qX      equ 5072
qInv    equ 6831  ; inverse of qX-1 (such that (qX-1)*qInv==1)
qDiff   equ 5983
qA      equ (((qX+(qTable-qPtr)-2)*qInv)%CORESIZE)
qB      equ (((qX+(qTable-qPtr)-1)*qInv)%CORESIZE)
qC      equ (((qX+(qTable-qPtr)-0)*qInv)%CORESIZE)

cBoot   sne qPtr+(qA-0)*qX, qDiff+qPtr+(qA-0)*qX
        seq      <qTable-1, qDiff+qPtr+(qA-1)*qX
        jmp          tBoot, {qCalc
        sne qPtr+(qC-0)*qX, qDiff+qPtr+(qC-0)*qX
        seq      <qTable+1, qDiff+qPtr+(qC-1)*qX
        jmp          tBoot, }qCalc
        sne qPtr+(qB-0)*qX, qDiff+qPtr+(qB-0)*qX
        seq      <qTable+0, qDiff+qPtr+(qB-1)*qX
where   jmp          tBoot, start+dist+5

dist    equ 6942  ; distance between start and clear after boot

boot    mov <away, <where
        mov <away, <where
        mov <away, <where
        mov <away, <where
        djn -4, #2
away    djn.f start+dist, #clear+5

end
