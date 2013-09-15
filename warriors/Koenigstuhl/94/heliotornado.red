;redcode
;name Commander Heliotornado
;author Michal Janeczek
;strategy Crazyshot, G2, Shapeshifter, SMC -> brainwashing CLP
;strategy Origami Harquebus, Willow -> brainwashing core-clear
;strategy Hazy Lazy, myBlur -> tiny dat core-clears
;strategy Olivia -> double dat clear
;strategy others -> anti-imp paper / SSD clear (switch on two losses)
;assert (6293 % PSPACESIZE) == 293

       org    start
       pin    115

; -=> SSD Clear <=-

sGate  dat    2697          , 0

       dat    0             , 0
aHLclr mov    4             , <5
       jmp    -1            , <4

sWipe  dat    14            , 1
clear  spl    #14           , 100
       mov    @sWipe        , }sGate
       mov    @sWipe        , }sGate
       djn.f  -2            , >clear

; -=> Paper <=-

mDst1  equ    2359
mDst2  equ    3201
mDst3  equ    2899
mHit1  equ    1529
mHit2  equ    7273

pRes   dat    0             , 22
paper  spl    1             , 17
       mov.i  -1            , #21
       mov.i  -1            , #17
       mov.i  -1            , #1

       spl    @0            , >mDst1
       mov    }-1           , >-1
mSlk2  spl    @0            , >mDst2
       mov    }-1           , >-1
       mov    mBomb         , >mHit1
       mov    mBomb         , >mHit2
       mov    {mSlk2        , <1
       djn    @0            , <mDst3
mBomb  dat    <2667         , <5334

; -=> Anti-HL <=-

aHL    mov    aHLclr        , aHLclr-5620
       mov    aHLclr+1      , aHLclr+1-5620
       mov    #-9           , aHLclr+4-5620
       mov    #-191         , aHLclr+5-5620
       jmp    aHLclr-5620

; -=> Anti-MB <=-

aMB    mov    aMBclr        , aMBclr-7710
       mov    aMBclr+1      , aMBclr+1-7710
       mov    #10           , aMBclr-3-7710
       mov    #98           , aMBclr-4-7710
       jmp    aMBclr-7710

aMBclr mov    -3            , >-4
       jmp    -1            , >-5

; -=> Switcher <=-

pLoc   equ    415

start  ldp.a  }0            , pRes
       ldp.a  #pLoc         , pTab
       mod.ba *pRes         , pTab
       stp    *pTab         , #pLoc    ;  S  L  W  T  3
pTab   jmp    }0            , 1344     ;  0  2  1  0
       spl    #clp          , 4642     ;  1  0  1  1
       spl    #clp          , 1598     ;  2 14  0  2
       spl    #aHSA         , 3216     ;  3  4  3  3
       spl    #aHSA         , 1159     ;  4 15  3  4
       spl    #aHL          , 3218     ;  5  6  5  5
       spl    #aHL          , 5802     ;  6 16  5  6
       spl    #aMB          , 3220     ;  7  8  7  7
       spl    #aMB          , 2591     ;  8 17  7  8
       spl    #d2           , 3222     ;  9 10  9  9
       spl    #d2           , 451      ; 10 11  9 10
       spl    #d2           , 4022     ; 11 18 10 11
       spl    #paper        , 6795     ; 12 19 12 12 12
       spl    #clear        , 6796     ; 13 20 13 13
       spl    #clp          , 2093     ; 14  3  2 14
       spl    #aHSA         , 225      ; 15  5  4 15
       spl    #aHL          , 6211     ; 16  7  6 16
       spl    #aMB          , 2915     ; 17 11  8 17
dGate  jmp    #d2           , 606      ; 18 12 11 18
       dat    paper         , 7390     ; 19 20 12 19 12
       dat    clear         , 965      ; 20 19 13 20

; -=> Double dat clear <=-

d2     mov.x  #16           , dGate
       spl    dSpl          , {dGate

       spl    #1            , {dGate
       mov    dWipe         , >dGate
       mov    dWipe         , >dGate
       djn.f  -1            , {dGate
       dat    0             , 0
       dat    <5334         , <2667
dWipe  dat    <5334         , <2667
dSpl   spl    #1            , {dGate
       mov    dWipe         , >dGate
       mov    dWipe         , >dGate
       djn.f  -1            , {dGate

; -=> CLP <=-

cDecoy equ    (cCopy-191)
cDist  equ    6293
cFence equ    50
cPtr   equ    (cCopy+153)

clp    mov    {cCopy        , {cBoot
       mov    {cCopy        , {cBoot
       mov    {cCopy        , {cBoot
       djn    clp           , #4

       nop    >cDecoy       , >cCheck+191-cFence
       mov    {cDecoy+1     , {cDecoy+3
       mov    {cDecoy+4     , <cDecoy+6
       mov    <cDecoy+7     , <cDecoy+9
cBoot  djn.f  cCopy+191+12  , <cDecoy+11

cCopy  stp    #12           , #cDist
       mov.x  *cCheck       , @cCheck
       mov    cCopy         , }cPtr
       mov    cBomb2        , }cPtr
       mov    cBomb3        , }cPtr
cCheck sne.x  -cFence       , cFence
       jmp    -4
       mov    }cCopy        , @cCopy
       jmn.f  -1            , >cCopy
       jmp    cCopy+1+cDist , {cCheck+cDist-cFence
cBomb2 stp    #12           , #34
cBomb3 mod    3             , 3

; -=> Anti-HSA <=-

       dat    0             , 0
       dat    0             , 0
aHSA   mov    3             , >2
       mov    2             , >1
       jmp    -2            , 4
       stp    #2            , #3

