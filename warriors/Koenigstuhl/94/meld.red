;redcode-b verbose
;name meld
;author M. J. Pihlaja
;strategy P-warrior
;strategy
;strategy switching Clisson, SevenEleven, a stone, and some
;strategy stone/imp resistance based on P-clear.
;strategy
;assert CORESIZE==8000
 
;***** HSA/SevenEleven
;*****
;
;
 
tPtr    equ     (tWipe-4)
 
tWipe     mov    tSpl     ,<tPtr         ; positive wipe of opponent from x-2
          mov    >tPtr    ,>tPtr
          jmn.f  tWipe    ,>tPtr         ; first check at x
 
tScan     sub.x  #-11     ,tPtr          ; increment and look
          sne.f  *tPtr    ,@tPtr
          sub.x  *pScan   ,@tScan        ; increment and look
          jmn.f  tSelf    ,@tPtr
          jmz.f  tScan    ,*tPtr
pScan     mov.x  @tScan   ,@tScan        ; swap pointers for attack
tSelf     slt.b  @tScan   ,#tEnd+4-tPtr  ; self-check
          djn    tWipe    ,@tScan        ;   go to attack x-1
          djn    *pScan   ,#17           ; after 17 self-scans
          jmp    *pScan   ,}tWipe        ;   switch to dat-wiping
 
datzero dat    0,0
 
tSpl      spl    #0,{0
          dat    0,{0
tEnd    equ     (tSpl+2)
 
; place tPtr and start him running
tPtrIns dat     100     ,       4100-4        ; widely-spaced pointers
HSA     mov     tPtrIns ,       tPtr
        jmp     tScan+1
 
;***** Clisson UltraLite
;*****
;
; slower scanning and no 'internal silent carpet check'
;
; Gem of the Ocean seems to have a completely different version of Clisson
; with a smaller killer
;
 
q1        spl    #0,<-10                 ; this is the bomber-killer
          mov    qb,<qp                  ; when overrun by djn.b or djn.f
          mov    qb,<qp                  ; it keeps on ticking :-)
          jmp    -2,<qp
          dat    <-11,-9
qb        dat    <-11,-9
          dat    0,-2000
qp        dat    0,-11
 
Clisson
ptr     jmz.f   #-100   ,       {0
        sub.a   #5      ,       ptr
        mov     datzero ,       }ptr            ; dat-bomb a place for killer
        djn     -1      ,       #9
        mov     <launch2,       {ptr            ; then put killer there
        djn     -1      ,       #8
launch2 jmp     *qp+1   ,       q1+8
 
;***** P^2b
;*****
; The switching sequence is:
; hsa -> __meld -> Clisson -> stone
;
; with stone starting, hsa defaulting on 0 brainwash
;
;
 
PSTATE  equ     1
STATES  equ     (statesend-state)
 
think   ldp.a   #0      ,       in
load    ldp.a   #PSTATE ,       state
        add.ba  *state  ,       in
in      add.ba  0       ,       state
        mod.a   #STATES ,       state
store   stp.a   state   ,       load
        mov.i   #0      ,       -1
state
        jmp     }0      ,       TW1
        spl     #_hsa   ,       TW2
        spl     #_hsa   ,       TW3
        spl     #_mld   ,       TW1
        spl     #_mld   ,       TW2
        spl     #_mld   ,       TW3
        spl     #_cli   ,       TW1
        spl     #_cli   ,       TW2
        spl     #_cli   ,       TW3
        spl     #_stn   ,       TW1
init    spl     #_stn   ,       TW2
        spl     #_stn   ,       TW3
statesend

        spl     #0      ,       init-state

; transition templates
TW1     equ     (tw1-in)
TW2     equ     (tw2-in)
TW3     equ     (tw3-in)

tw1     spl     #0      ,1	; loss
        spl     #0      ,0	; win
        spl     #0      ,0	; tie
tw2     spl     #0      ,1
        spl     #0      ,-1
        spl     #0      ,-1
tw3     spl     #0      ,3
        spl     #0      ,-2
        spl     #0      ,-2

_cli    equ     Clisson
_hsa    equ     HSA
_stn    equ     Stone_boot
_mld    equ     __meld_boot

;***** Stone
;*****
;
; Alladin-like stone picked up from CW 65
;
 
Stone_boot
        mov     Stone+2 ,       <stndst
        mov     Stone+1 ,       <stndst
        mov     Stone   ,       <stndst
stndst  jmp     @0      ,       3920+3

sStep   equ     3174
Stone   mov     {1545   ,       1-sStep
        sub.x   #sStep  ,       -1
        jmp.b   -2      ,       }-2
 
;***** __meld
;*****
;
; provide stone/imp resistance, based on P-clear by P. Kline
;

; these are relative to __meld_boot
_PDIST  equ     ((5300/__mld_STEP)*__mld_STEP)
_SDIST  equ     ((-2700/__mld_STEP)*__mld_STEP)

__meld_boot
bootpair mov.i  <psrc   ,       <ppair
        mov.i   <psrc   ,       <ppair
        mov.i   <psrc   ,       <ppair
        mov.i   <psrc   ,       <ppair
        mov.i   <psrc   ,       <ppair
        djn     bootpair,       #2
        mov.i   gateins ,       __meld_boot+_PDIST+(paGate-Pair)
bootscan mov.i  {pscan  ,       <pscan
        mov.i   {pscan  ,       <pscan
        mov.i   {pscan  ,       <pscan
        mov.i   {pscan  ,       <pscan
        spl     @pscan  ,       >ppair
psrc    jmp     @ppair  ,       Pair+10
pscan   mul.x   #scan+4 ,       #__meld_boot+_SDIST+4
ppair   div.f   #0      ,       #__meld_boot+_PDIST+10

__mld_STEP      equ     13

; relative to paGate in core
__mld_FIRST     equ     (-_PDIST+scan+8-__meld_boot)
paGate		equ     (Pair-5)

gateins dat     #0      ,       #__mld_FIRST

; the clears
Pair
sclr1   spl     #0      ,       >Pair-paGate+10
        mov     dclr    ,       >paGate
        mov     dclr    ,       >paGate
        djn.f   -2      ,       >paGate
sclr2   spl     #0      ,       >Pair-paGate+10
        mov     dclr    ,       >paGate
        mov     dclr    ,       >paGate
        djn.f   -2      ,       >paGate
        dat     >5335   ,       >Pair-paGate+11
dclr    dat     >5335   ,       >Pair-paGate+11

; the scanner
scPair  equ     (scan+_PDIST-_SDIST)
scan    add     #__mld_STEP*2667-2,paGate-Pair+scPair
        jmz.f   -1      ,       @paGate-Pair+scPair
        spl     scPair  ,       <paGate-Pair+scPair
        jmp     scPair+4,       <paGate-Pair+scPair
 
        end     think

