;redcode-94
;name Microvenator
;author Michal Janeczek
;strategy p^3 -> paper / scanner / stone
;assert CORESIZE == 8000 && 333 % PSPACESIZE

      org    start

; -=> Stone <=-

sStep equ    3174

sLoop mov    {61        , 1+sStep
      add.x  #sStep     , *1
      jmp    sLoop      , }sLoop

; -=> Paper <=-

cDst1 equ    2359
cDst2 equ    3201
cDst3 equ    2899
cHit1 equ    1529
cHit2 equ    7273

pRes  dat    0          , 12
paper spl    *1         , 13
      spl    *1         , 11
      spl    1          , }0
      spl    1          , >1234

      spl    @0         , >cDst1
      mov    }-1        , >-1
cSlk2 spl    @0         , >cDst2
      mov    }-1        , >-1
      mov    cBomb      , >cHit1
      mov    cBomb      , >cHit2
      mov    {cSlk2     , <1
      djn    @0         , <cDst3
cBomb dat    <2667      , <5334

      dat    0          , 0
      dat    0          , 0
      dat    0          , 0
      dat    0          , 0

; -=> Switcher <=-

pLoc  equ    333
pDist equ    7424

start ldp.a  }0         , pRes
      ldp.a  #pLoc      , pTab
      mod.ba *pRes      , pTab
      stp    *pTab      , #pLoc    ; S  L  W  T
pTab  jmp    }0         , 651      ; 0  3  1  2
      spl    #paper     , 924      ; 1  0  1  0
      spl    #paper     , 1599     ; 2  3  0  4
      spl    #paper     , 871      ; 3  7  0  2
      spl    #scan      , 1214     ; 4  2  5  4
      spl    #scan      , 1072     ; 5  4  6  5
      spl    #scan      , 149      ; 6  5  6  6
      spl    #stone     , 1503     ; 7  3  8  7
      spl    #stone     , 1075     ; 8  7  9  8
      jmp    #stone     , 152      ; 9  8  9  9

; -=> Scanner/stone boot <=-

scan  mov    #eAtk-pSrc , pSrc
stone mov    >pSrc      , >pDest
      mov    >pSrc      , >pDest
      mov    >pSrc      , >pDest
pSrc  jmn.a  -3         , @sLoop
pDest djn.f  *pDist+2   , #pDist

; -=> Scanner <=-

eStep equ    6007

eAtk  mul.x  {eScan     , }eScan+1
ePtr  slt.ba #11        , #eStep
      mov.b  @eScan     , eAtk
eWipe mov    eSpl       , >eAtk
      add    #eStep     , ePtr
eScan jmz.f  -1         , @ePtr
      jmn    eAtk       , ePtr
      jmp    eWipe      , }eWipe
eSpl  spl    #0         , }0
