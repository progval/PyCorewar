;redcode-94nop
;name Piltdown (2003)
;author Philip Thorne
;strategy 20020824 First hill appreance [with QB]
;strategy 20030706 Piltdown 1-Shot Bomber + QS
;strategy          Cleaned-up for publiction.
;bench jun03=127.17#1000 w=151#100

for CORESIZE==8000
 ;assert (CORESIZE==8000)
 ;assert (MAXLENGTH==100) && (MINDISTANCE==100)
 ;assert (MAXCYCLES==80000)
 ;assert (MAXPROCESSES==8000)
rof
for CORESIZE==55440
 ;assert (CORESIZE==55440) 
 ;assert (MAXPROCESSES>=8)
 ;assert (MAXCYCLES==500000)
 ;assert (MAXLENGTH==200) && (MINDISTANCE==200)
rof

for CORESIZE==8000
 STEP   EQU     (1256)          ;mod-8
rof
for CORESIZE==55440
 STEP   EQU     (-24184)        ;mod-8
rof

MSIZ    EQU     (8)
MSPACE  EQU     for MSIZ
        EQU         dat 0, 0
        EQU     rof
MFILL   EQU     for MSIZ-(CURLINE%MSIZ)
        EQU         dat 0, 0
        EQU     rof

DROP    EQU     (lure-4000-STEP)
WATCH   EQU     (lure+STEP)

WACK    EQU     cptr

;assert ((STEP%(MSIZ)) == 0)
;assert ((CURLINE%MSIZ) == 0)

lure:   mov.b   #(2*STEP),      *(WATCH-(2*STEP))
vbmb:   djn.f    -(MSIZ),        <6     ;
        MFILL

;assert ((CURLINE%MSIZ) == 0)

        dat     0,              0
loop:   mov.i   @1,             }lure   ;A==lure
        mov.i   vbmb,           >lure
        add.f   inc,            @-1     ;B==lure
eloop:  jmz.b   loop,           DROP    ;misses WATCH overruns
        spl     clr,            DROP
prep:   sub.b   @-1,            WACK

        MFILL

;assert ((CURLINE%MSIZ) == 0)
        MSPACE;
        MSPACE;
        MSPACE;
;assert ((CURLINE%MSIZ) == 0)

;Basic clear is per Geist [nice S/D switch] with tweakings.
;Previous clear was Quiz-based. No real diff in results.

        dat     0,              0
        dat     0,              0
cptr:   dat     3333,           (WATCH-WACK-1)
        dat     0,              0
        dat     0,              0

        dat     0,              0
bptr:   dat     1,              (eclr-cptr+3)   ;B incr for dec prot.
dptr:   spl     #cptr+70,       (eclr-cptr+3)   ;

;assert ((CURLINE%MSIZ) == 0)

        dat     0,              0   ;vbmb lands here
clr:
inc:    spl     #(STEP-1),      }(-STEP-1)
        mov     *bptr,          >cptr
        mov     *bptr,          >cptr
eclr:   djn.f   -2,             }dptr

        MFILL

;assert ((CURLINE%MSIZ) == 0)

        MSPACE
;--

        dat     1,              qA
qTab1:  dat     1,              qB
        dat     0,0
        dat     0,0
bBoot:
start:  mov.a   #(DROP-WATCH),  WATCH
        mov.i   <3333,          start
        jmp     loop,           {0

        qX      equ     6612    ;Optimised to miss bombs (MSIZ)
        qA      equ     3762
        qB      equ     2253
        qC      equ     1965
        qD      equ     456
        qE      equ     6947
        qF      equ     1199

        qStep   equ     7       ;Weighted towards liklihood
        qTime   equ     16      ;of hitting late in warrior
        qOff    equ     32      ;body due to QS's.

qBomb   dat     {qOff           , qF

qGo     sne     qPtr+qX*qE      , qPtr+qX*qE+qE
        seq     <qTab2+1        , qPtr+qX*(qE-1)+(qE-1)
        jmp     qDec            , }qDec+2
        sne     qPtr+qX*qF      , qPtr+qX*qF+qD
        seq     <qBomb          , qPtr+qX*(qF-1)+qD
        jmp     qDec            , }qDec
        sne     qPtr+qX*qA      , qPtr+qX*qA+qD
        seq     <qTab1-1        , qPtr+qX*(qA-1)+qD
        djn.a   qDec            , {qDec
        sne     qPtr+qX*qB      , qPtr+qX*qB+qD
        seq     <qTab1          , qPtr+qX*(qB-1)+qD
        djn.a   qDec            , *0
        sne     qPtr+qX*qC      , qPtr+qX*qC+qC
        seq     <qTab2-1        , qPtr+qX*(qC-1)+(qC-1)
        jmp     qDec            , {qDec+2
        sne     qPtr+qX*qD      , qPtr+qX*qD+qD
        jmz.f   bBoot           , <qTab2

qDec    mul.b   *2,             qPtr
qSkip   sne     <qTab1,         @qPtr
        add.b   qTab2,          qPtr
qLoop   mov     qBomb,          @qPtr
qPtr    mov     qBomb,          }qX
        sub     #qStep,         @qSkip
        djn     qLoop,          #qTime
        djn.f   bBoot,          #0

        spl     1,              qC
qTab2:  spl     1,              qD
        spl     1,              qE

;--
    end qGo

