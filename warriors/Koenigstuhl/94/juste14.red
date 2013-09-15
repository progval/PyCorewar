;redcode-94
;name Just experimenting 1.4
;author Blake Escritt
;strategy Handshake>Pspace(scanner|paper/stone)
;strategy 1.0: Original program based on Moore's Sunset
;strategy 1.1: Added decoy/padding
;strategy 1.2: Switched to a live decoy
;strategy 1.3: Anti-Brainwashing
;strategy 1.31: Bugfix - Handshake broken
;strategy 1.4: Maximum mutual score when battling with one of my programs.
;assert 1
; Sorry about the sparse comments.

ORG enemy
WID EQU (1123)

rStep equ 6557   ; overcomes 3, 7, 9, and 11 point imps

rPlaceA equ 1282
rPlaceB equ 6800

rDestB  nop (rPlaceB - rPlaceA), (rPlaceB-rPlaceA)

reconB  add.f rDestB, rDest   ; boot to location B
reconA  mov  rEnd,   <rDest   ; boot to location A
       mov {reconA, <rDest
       mov {reconA, <rDest
       mov {reconA, <rDest
       mov {reconA, <rDest
rSrc    jmn  reconA, {reconA
rDest   spl  rPlaceA+5, rPlaceA+15
       mov  2, rDest   ; hide boot pointer


rPtr equ (rScan-8)

       dat      19,  19
rDiff   spl #-rStep, #-rStep
rWipe   mov   rDiff, >rPtr    ; hit 'em with SPLs
rW2     mov  *rWipe, >rPtr    ; later, this becomes a DAT clear
       djn.a rWipe,  rLength

rLoop   sub   rDiff, @rS2
rScan   sne rStep-1,  rStep-7 ; check a pair
       sub   rDiff,  rScan
rS2     seq  *rScan, @rScan   ; check another pair
       slt.a   #20,  rScan   ; ignore self
rTimer  djn   rLoop, #4800    ; count down to DAT phase

rLength sub.ba   #0,   #-7     ; set up for SPL wipe
rTweak  mov.ab @rS2,   @rWipe
rT2     jmn    *rW2,    rTimer ; when timer expires,
rEnd    djn.a <rTweak, {rT2    ; go to DAT clear mode

;---------
; P-space
;---------

storage equ (WID*234%(CORESIZE/16-20))+1

think   ldp.a  #0,      mtab
       ldp.ba  2,      table
       mod.ba *mtab,   table
       stp.b  *table, #storage
table   jmp }0,     724 ; =  80*9 + 4 = 65*11 +  9 = 72*10 + 4
       jmp paper,  130 ; =  14*9 + 4 = 11*11 +  9 = 13*10 + 0
       dat reconB, 666 ; =  74*9 + 0 = 60*11 +  6 = 66*10 + 6
       dat paper,  835 ; =  92*9 + 7 = 75*11 + 10 = 83*10 + 5
       dat reconA, 448 ; =  49*9 + 7 = 40*11 +  8 = 44*10 + 8
       dat paper,  857 ; =  95*9 + 2 = 77*11 + 10 = 85*10 + 7
       dat reconB, 776 ; =  86*9 + 2 = 70*11 +  6 = 77*10 + 6
       dat paper,  362 ; =  40*9 + 2 = 32*11 + 10 = 36*10 + 2
       dat reconA, 778 ; =  86*9 + 4 = 70*11 +  8 = 77*10 + 8
       dat paper,  801 ; =  89*9 + 0 = 72*11 +  9 = 80*10 + 1
       dat paper,  923 ; = 102*9 + 5 = 83*11 + 10 = 92*10 + 3
mtab    dat 0,  9
       dat 0, 11
       dat 0, 10
       DAT.F $-52, $778   ; mirror - used by Recon 2

;---------------
; paper + stone
;---------------

pStone  spl #2 * 2862, {2 * 2862
       mov pAmmo, *2
       add.f pStone, 1    ; <- hit to start core clear
       mov 4655, 4655 + 2862
pSrcS   jmp -3, pStone
       dat 0,0
pAmmo   dat }1, >1

; This replicator fills the core with code that can't be run
; by other replicators.

pNext   spl   4200,  {pThis
       mov  }pThis, }pNext
       mov   pDat,  >5200
pThis   mov pNext+6, }pNext
       jmz.f pNext, *pThis
pDat    dat  <2667,  <5334

placeS equ 5300     ; stone boot location
placeP equ (placeS + 223)   ; paper boot location

paper   mov >pSrcS, >pDestS
       spl  2, >3988
       spl  1, >4191
pSrcP   spl  1,  pNext+6
       mov >pSrcS,  >pDestS
       mov <pSrcP,  {pDestP
pDestS  spl @pDestP,  paper+placeS  ; the stone needs 6+6 processes
       spl @pDestP, >pDestS        ; to work properly
pDestP  djn  paper+placeP+6, #paper+placeS  ; the paper needs 6


n equ 5
for ((MAXLENGTH-CURLINE)-31)/n
   spl #n*356,>n*653
   spl }3653+n,@3566-n
   spl >253*n,3656+n
   spl #35*n, *n*355
   spl <256+n,>64*n-5*n
rof

       PIN     1123

ENEMYP          equ     (WID*1%(CORESIZE/16-20))+1
WINP            equ     (WID*2%(CORESIZE/16-20))+1
LOSEP           equ     (WID*3%(CORESIZE/16-20))+1
HS1             equ     60
HS2             equ     180
HWARRIOR        equ     think

enemy   ldp     #ENEMYP, #0
       jmn     HWARRIOR, $enemy

res     ldp.ab     #0, res
       sne.ab     #-1, res
       jmp     search

shake   jmz     lost, res
won     stp     #0, #LOSEP
       stp     #1, #WINP
       stp     #WID, #HS1
loser   ldp     #LOSEP, #0              ; and then check it
       ldp     #HS2, 2
       jmz     foe, 1
       seq     #WID, #0
       jmp     die
       jmz     foe, $loser
wait    jmp     0                       ; wait


lost    stp     #0, #WINP
       stp     #1, #LOSEP
       stp     #WID, #HS2
winner  ldp     #WINP, #0               ; and then check it
       ldp     #HS1, 2
       jmz     foe, 1
       seq     #WID, #0
       jmp     wait, <3056
       jmz     foe, $winner
die     dat     $0, $0                  ; lose again


foe     stp     #1, #ENEMYP
       jmp     HWARRIOR


search  jmz.f   search, {hcount

hcount   sne.i   #-100, {hcount           ; die if needed
       jmp     $0, {hcount
END

