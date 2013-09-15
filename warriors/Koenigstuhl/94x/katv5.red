;redcode-94x
;name KAT v5
;author Dave Hillis
;strategy - p-switch idea from John Metcalf
;strategy - borrows from Katafutr by Michal Janeczek
;strategy - Switch between paper with imps, incendiary bomber,
;strategy - Paul Kline's FireHouse, denial by David Moore,
;strategy - and 55HSB by Robert Macrae.
;strategy - Oh, and I signed my name at the top.
;denial as w3 instead of lithium x 8
;assert CORESIZE==55440

        org    think
first equ w0
; -- scanner

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

; -- paper/imp copy

eBackup stp    #-1              , #PSTATE-5
        spl    1                , {3785
        mov.i  {0               , #0
        mov.i  {0               , #0
        mov.i  {0               , #0
        spl    1                , {9623

        spl    @0               , {16211
        mov    }-1              , >-1
        spl    @0               , {21445
        mov    }-1              , >-1
        spl    #0               , 0
        add.f  #35873           , 1
        jmp    -35873           , {12087
        mov.i  #35873           , *0

;        for    86
;        dat    0                , 0
;        rof

; -- bomber

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

PSTATE  equ    1100; not really

w0 equ eStart
w1 equ tStart
w2 equ vStart
;w3 is lithium x8
;w4 is 55HSB by Robert Macrae

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
table   jmp    }0,  # 1698 ;  0: action   2 :   8   4   3
        spl #  w4,  #  288 ;  1: action   4 :   2   8   3
        spl #  w5,  #  306 ;  2: action   5 :   7  12   6
        spl #  w0,  # 1860 ;  3: action   0 :   1  12   0
        spl #  w2,  # 2595 ;  4: action   2 :   8   5   0
        spl #  w2,  #  719 ;  5: action   2 :   4   5  14
        spl #  w1,  #  847 ;  6: action   1 :   2   7   7
        spl #  w1,  # 1267 ;  7: action   1 :   6   7   7
        spl #  w4,  # 1353 ;  8: action   4 :   1   9   3
        spl #  w4,  # 1269 ;  9: action   4 :   8   9   9
        spl #  w0,  # 1567 ; 10: action   3 :   7  13   7
        spl #  w5,  # 1481 ; 11: action   5 :  12  11  11
        spl #  w5,  # 1887 ; 12: action   5 :   2  11  12
        spl #  w5,  # 1597 ; 13: action   5 :  11   1   7
        spl #  w2,  # 2539 ; 14: action   2 :   4   5   4


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

; -- paper/imp based on Black Box by JKW

eImp    equ    35873

eStart  spl    eBackup          , {5465
        stp    #-1              , #PSTATE+5
        spl    1                , {9753
        mov.i  {0               , #0
        mov.i  {0               , #0
        mov.i  {0               , #0
        spl    1                , {4366

        spl    @0               , {16211
        mov    }-1              , >-1
        spl    @0               , {21445
        mov    }-1              , >-1
        spl    #0               , 0
        add.f  #eImp            , 1
        jmp    -eImp            , {12087
        mov.i  #eImp            , *0

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
	end

