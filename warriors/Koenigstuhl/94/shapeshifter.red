;redcode-94
;name Shapeshifter
;author Michal Janeczek
;strategy P^3 switcher -> dodger/stone/scanner
;assert (CORESIZE==8000)&&(PSPACESIZE>0)

         org    pGo

;   --------------
; ----  Dodger  ----
;   --------------

iGate    equ    (iClr-5)

iScan    jmz.f  #0         , }iPtr
         nop    }iPtr      , }iPtr
iCopy    mov    <iPtr      , {iPtr
         djn    iCopy      , #4
iPtr     djn.f  iWipe+6    , #iWipe+1
         spl    #0         , {iGate
iClr     mov    iWipe      , >iGate
         djn.f  iClr       , >iGate
iWipe    dat    <2667      , iWipe+4-iGate
         dat    0          , 0
         dat    0          , 0
         dat    0          , 0
         dat    0          , 0

;   --------------
; ----  Stone   ----
;   --------------

cStep    equ    3039
cTime    equ    3360
cDjn     equ    2852

         spl    #0         , 0
cLoop    mov    cBomb      , @cPtr
cHit     add    #2*cStep   , cPtr
cPtr     mov    cBomb      , }cHit-cStep*cTime
         djn.f  cLoop      , <cDjn
         dat    0          , 0
         dat    0          , 0
         dat    0          , 0
cBomb    dat    cStep      , >1
         dat    0          , 0
         dat    0          , 0
         dat    0          , 0
         dat    0          , 0

;   --------------
; ---- Scanner  ----
;   --------------

eStep1   equ    7
eStep2   equ    9
eSelf    equ    13
ePtr     equ    (eInc-eStep1-1)

         dat    4100       , 20
eSpl     spl    #1         , }1
eWipe    mov    eSpl       , <ePtr
         mov    >ePtr      , >ePtr
         jmn.f  eWipe      , >ePtr
eInc     sub.x  #-eStep2-2 , ePtr
         sne    {ePtr      , <ePtr
         jmz.f  eInc       , <ePtr
         sne    eSpl-1     , >ePtr
         mov.x  @eInc      , @eInc
         slt.b  @eInc      , #eEnd+3-ePtr
         djn.f  eWipe      , @eInc
         djn    eInc       , #eSelf
eEnd     jmp    eInc       , {eWipe

;   --------------
; ---- Switcher ----
;   --------------

pLoc     equ    293

pDodger  equ    0
pStone   equ    (cBomb+4)-(iWipe+4)
pScanner equ    eEnd-(iWipe+4)

pGo      ldp.a  #0         , #pTab        ; 21 on win
         ldp.a  #pLoc      , pTab         ; 20 on loss
         mod.ba *pGo       , pTab         ; 19 on tie
         stp.b  *pTab      , #pLoc
         add.x  *pTab      , pPtr

         mov    @pPtr      , *pPtr
         mov    <pPtr      , {pPtr
         mov    <pPtr      , {pPtr
         mov    <pPtr      , {pPtr
         mov    <pPtr      , {pPtr
         mov    <pPtr      , {pPtr
         mov    <pPtr      , {pPtr
         mov    <pPtr      , {pPtr
         mov    <pPtr      , {pPtr
         mov    <pPtr      , {pPtr
         mov    <pPtr      , {pPtr
         mov    <pPtr      , {pPtr
         mov    <pPtr      , {pPtr
pPtr     spl    *4020      , iWipe+4
         add.f  #3-eStep1  , pPtr
         mov    >pPtr      , }pPtr
                                          ;  S  L  W  T
pTab     dat    pDodger    , 4180         ;  0  1  0  0
         spl    #pDodger   , 4580         ;  1  2  0  1
         spl    #pDodger   , 4980         ;  2  3  0  2
         spl    #pDodger   , 5380         ;  3  4  0  3
         spl    #pStone    , 4184         ;  4  5  4  4
         spl    #pStone    , 4584         ;  5  6  4  5
         spl    #pStone    , 4585         ;  6  7  5  6
         spl    #pScanner  , 4187         ;  7  8  7  7
         spl    #pStone    , 5784         ;  8  9  4  8
         spl    #pStone    , 6184         ;  9 10  4  9
         spl    #pStone    , 6185         ; 10 11  5 10
         spl    #pScanner  , 11           ; 11 11 11 11

         end

