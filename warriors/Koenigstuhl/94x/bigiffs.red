;redcode-94x
;name Big I.F.F.S.
; (identification friend or foe)
;author Dave Hillis
;strategy - Experimenting with P^3 tables
;strategy - using other people's components

; But this version includes a sleeper. If it gets the
; signal, it goes into a doze while the spy master
; gathers and reports back information about the -F 
; number on the hill.

; p-switch idea from John Metcalf
; borrows from Katafutr by Michal Janeczek
; Paul Kline's FireHouse,
; 55HSB by Robert Macrae.
; handshake from Bigboy by Robert Macrae.
; denial by david Moore

;assert CORESIZE==55440

PIN 5339
_SLEEP  equ #555
S_CODE  equ #200

activate ldp     _SLEEP,  #0
         seq.ab S_CODE,  activate
         jmp    first, activate    ; If enemy identified, p^3 table
doze     jmp    #0, #0

;here is the handshake from Bigboy by Robert Macrae.
_RESULT equ #0          
_ROUNDS equ #42236       
_BOOT   equ #42237
_FRIEND equ #42240
_ENEMY  equ #42242
_LOSE   equ #42256
_WIN    equ _LOSE+1                                                      
           
_SANE   equ #12245
_TEST   equ #12260
notmad  equ #13276

first
enemy   ldp     _ENEMY,  #0
        jmn     think, enemy    ; If enemy identified, p^3 table
friend  ldp     _FRIEND, #0
        jmz     hands, friend  ; Handshake if status U/K
        jmp     fixgame, >-8000; or else allot win as appropriate

hands   ldp     _RESULT, #0  
        sne.b   hands, #-1
         jmp    startup, >-7600; Initialise _SANE on first round
sane    ldp     _SANE, #0 
        seq.b   sane, notmad
         jmp    asylum, >-7800 ; Rebuild P-space if brainwashed.

rounds  ldp     _ROUNDS, #0
        add.ba  -1, 1
        stp     #1, _ROUNDS     ; increment round counter,
        sne.b   hands, #2
         jmp    think, >-8200    ; and fight until someone wins.
        
        add.b   hands, wflag    ; Store a Flag for winner and loser 
wflag   stp     #1, _LOSE       
        sub.ba  hands, rflag    ; Won->1, Lost->2
rflag   ldp     _WIN, #0        ; Read the other flag 
        jmz.b   asylum, rflag   ; If zero I must have an enemy.

        stp     #1, _FRIEND     ; Whoopee!
        stp     #1, _TEST       ; Flag the fact that I'm
        stp     #0, _WIN        ;  identifying future winner
        stp     #0, _LOSE       ; clean up
        dat     #0, #0          ; Yes, Anders, I like it too :-)
                                ; First mover loses, sadly.
fixgame ldp     _TEST, #0

sane2   ldp     _SANE, #0      ; Throw in a paranoid sanity check
        seq.b   sane2, notmad
         jmp    asylum         
        
        jmz     winlose, fixgame ; If I've finished testing, do it.
round2  ldp     _ROUNDS, #0  
        mod.ab  #2, round2
        stp     #0, _TEST        ; Don't need to test again.
        jmn.b   winlose, round2  ; Choose which block...
        
losewin ldp     _RESULT, #0
        jmz.b   0, losewin       ; Wrong winner last round. 
        dat     #0, #0           

winlose ldp     _RESULT, #0
        jmn.b   0, winlose       ; Winner keeps on winning! 
        dat     #0, #0           ; Addicted? Me?

asylum  stp     #1, _ENEMY     ; If I've been washed, somebody
startup stp     notmad, _SANE  ; _is_ out to get me! 
        jmp     think, >-7600   ; jump to p^3 table
; -- scanner from katafutr

vSpace  equ    18480
vStep   equ    13

vPtr    dat    vScan            , tBoot+3
        dat    0                , 0
        dat    0                , 0

vAttack mov.ba vPtr             , vPtr
        mov    #vPtr-vSpiral    , vSpiral
        add.b  vPtr             , vSpiral
vSpiral mov.x  @0               , @0      ; extract spiral increment
        mov.b  @vSpiral         , vSpiral

vWipe   mov    vSpl             , <vPtr   ; positive wipe
        mov    >vPtr            , >vPtr
        jmn.f  vWipe            , >vPtr

        add.ba vSpiral          , vPtr    ; try spiral search
        jmz.f  vMod             , *vPtr
        mov.ab vPtr             , vPtr
        slt    vPtr             , #vClr+3-vPtr
        jmn.f  vWipe            , @vPtr
vMod    mod    #vSpace-10       , vPtr

vNext   add    #vStep           , vPtr    ; f-scan
vScan   jmz.f  vNext            , @vPtr
        mod    #vSpace-10       , vPtr    ; confine search space
vSelf   slt    vPtr             , #vClr+8-vPtr
vGate   jmz.f  vAttack          , vPtr+1
        djn    vNext            , #9      ; count self-scans

        spl    #0               , #0
vSpl    spl    #0               , #0
        mov    vClr             , <-2   ; reverse-wipe to 
                                        ;overcome self-stuns
        mov    vClr             , >vGate  ; forward-wipe to win
        mov    vClr             , >vGate
        djn.f  -2               , >vGate
vClr    dat    0                , 2-vGate

        for    10
        dat    0                , 0
        rof

; 
for 4
dat 0, 0
rof
; -- bomber from katafutr

tStep   equ    16134
tTime   equ    9241
tGate   equ    (tWipex-3)
tCheck  equ    (tHit+23)
tDist   equ    9362

tWipex   dat    1                , tClear+5-tGate
tSplx    spl    #tStep+1         , tClear+5-tGate
        mov.i  }tCheck          , #0
tPtrx    mov    tHit-tTime*tStep , *tHit-(tTime-2)*tStep
        add    tInc             , tPtrx
        mov    tSplx             , *tPtrx
        mov    }tCheck          , @tPtrx
tHit    jmn.a  tPtrx             , {tCheck
tInc    spl    #3*tStep         , <3*tStep
tClear  mov    *tWipex           , >tGate
        mov    *tWipex           , >tGate
        djn.f  tClear           , }tSplx
tMov    mov    -tStep           , }-tStep

; -- brain

PSTATE  equ    2031

;w0 and w3 not used
w1 equ tStart
w2 equ vStart
;w5 is denial
;w4 is 55HSB

for 1 
think  
        ldp.a  #0               , in
        ldp.a  #PSTATE          , table
        mod.ba *in              , table
        stp.b  *table           , #PSTATE
rof
for 0
think  
        nop  #0               , in
        nop  #PSTATE          , table
        nop *in              , table
        nop  *table           , #PSTATE
 rof                                         ; S L W T
;table  jmp first
table   jmp    }0,  #  136 ;  0: action   2 :   6  10   1
        spl #  w2,  #  994 ;  1: action   2 :   6   0   4
        spl #  w4,  #  240 ;  2: action   4 :   6   2   0
        spl #  w5,  # 1955 ;  3: action   5 :   5   9   5
        spl #  w5,  #  917 ;  4: action   5 :   7   7   2
        spl #  w1,  #  125 ;  5: action   1 :   8  13   5
        spl #  w4,  # 1906 ;  6: action   4 :   8   2   1
        spl #  w5,  # 1451 ;  7: action   5 :   8   9  11
        spl #  w1,  # 2343 ;  8: action   1 :   3   5   3
        spl #  w5,  # 1437 ;  9: action   5 :   7   9  12
        spl #  w2,  #  990 ; 10: action   2 :   2  10   0
        spl #  w5,  # 1608 ; 11: action   5 :   9  12   3
        spl #  w5,  #  779 ; 12: action   5 :  12   9  14
        spl #  w1,  #  411 ; 13: action   1 :   8   5   6
        spl #  w5,  #  922 ; 14: action   5 :  12  12   7

in      spl    #w4          , 13       ; must have non-zero b-field in
        spl    #0               , 14       ;  the previous cell
        dat    0                , 15

vStart  mov    <vBoot           , {vBoot  ; boot only 2 copies
        mov    @vBoot           , {vBoot2
        mov    <vBoot           , {vBoot
        mov    @vBoot           , {vBoot2
        mov    <vBoot           , {vBoot
        mov    @vBoot           , {vBoot2
        djn    vStart           , #10
vBoot   spl    *vSpace+vClr+1   , vClr+1
vBoot2  spl    *2*vSpace+vClr+1 , 0
        jmp    vScan            , 0

tStart  mov    tMov             , tDist+tCheck+1
        spl    2                , {17843
        spl    1                , {18326
        spl    1                , {13965
        mov    {tStart          , <tBoot
        mov    {tStart          , <tBoot
tBoot   jmp    >tDist+tSplx+1    , tDist+tMov

; -- 

; ----------- denial ----------
w5 equ boot

hStep equ      859
hTime equ    23300
hDjn  equ    45001
hOff  equ        5
hDist equ    30133

hMain spl    #5               , <hMain+hDjn
hLoop mov    hBomb+hOff       , @hPtr
hHit  add    #hStep*2         , hPtr
hPtr  mov    hBomb+hOff       , }hHit-hStep*hTime
      djn.f  hMain            , <hMain+hDjn
hBomb dat    hStep            , >1

;for 85
;dat 0,0
;rof

i13 equ 34117
i19 equ 29179
iD1 equ 203
iD2 equ 804

iDist equ 30361

imp1  mov.i #5, i19
imp2  mov.i #i13, *0

impy  spl #i19, <i13
      add.f -1, 1
      spl impy+iD1-20*i19, impy+iD2-40*i13
iSrc  jmp @-1, 2

      dat 0,0

;for 85
;dat 0,0
;rof

boot  mov hBomb, away+hDist+(hBomb-hMain)+hOff
      mov imp1, away+iDist+iD1
      mov imp2, away+iDist+iD2
      spl 2
      spl 2
      spl 1
      mov {hMain, {away
      mov <iSrc, <away
      spl 1
      spl 1
away  spl hDist+5, iDist+5
      spl @away
      jmp *away

;----------------------------------------

; ----------- w4 -----------------------------
;from 55HSB
;by Robert Macrae
w4 equ tScan+1
tPtr      dat    300 ,27000              ; widely-spaced pointers
          dat    0,0
          dat    0,0
          dat    0,0
          dat    0,0
          
tWipe     mov    tSpl     ,<tPtr         ; positive wipe of opponent
          mov    >tPtr    ,@tPtr
          mov    >tPtr    ,>tPtr
          jmn.f  tWipe    ,>tPtr
          
tScan     sub.x  #-12     ,tPtr          ; increment and look
          sne    *tPtr    ,@tPtr
          sub.x  *pScan   ,@tScan        ; increment and look
          jmn.f  tSelf    ,@tPtr
          jmz.f  tScan    ,*tPtr
pScan     mov.x  @tScan   ,@tScan        ; swap pointers for attack
tSelf     slt.b  @tScan   ,#tEnd+4-tPtr  ; self-check
          djn    tWipe    ,@tScan        ;   go to attack
          djn    *pScan   ,#13           ; after 13 self-scans

bw        mov    bb,      <bPtr          ; Brainwash
          jmn.b  bw,      bPtr 

step13  equ 34117  ;  13pt 

spiral  mov    db,         }tPtr         ; Default to 13 pt
        add.a  #step13-2,  tPtr
        jmp    spiral,     }tPtr
bb      stp    >0,         #0
db      dat    tSpl-tPtr,  1

          dat    0, 0
tSpl      spl    0, 0
          dat    0, 0
bPtr      dat    0, #tPtr 
tEnd      dat    0, 0
; ----------------------------------

