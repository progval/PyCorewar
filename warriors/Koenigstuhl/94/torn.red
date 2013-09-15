;redcode-b verbose
;name Torn
;author M. J. Pihlaja
;strategy .6c bomber -> core clear
;strategy
;strategy
;assert CORESIZE == 8000
 
DECOY   equ     1
 
 
 
DATALEN         equ     38
 
;;; front decoy
 
        for     DECOY
 
_dl _dc for     ((MAXLENGTH-DATALEN)/2)/11-1
        stp     #_dl    ,       #1
        spl     #1      ,       $1
        spl     #1      ,       @1
        stp     #_dl    ,       #2
        spl     #1      ,       <1
        spl     #1      ,       >1
        spl     #1      ,       {1
        spl     #1      ,       }1
        spl.x   #_dl    ,       #1
        spl.x   #1      ,       $1
        stp     #1      ,       @1
        rof
        spl     #0      ,       #0
 
        rof     ; DECOY
 
 
 
 
;;; boot
 
; distances
BOOTDIST        equ     3251            ; rel. to boot
CLDIST          equ     (-35-7-1)       ; rel. to bomber
INCRDIST        equ     84              ; rel. to bomber
MVDIST          equ     100             ; rel. to bomber
 
; destinations
bdst            equ     (boot+BOOTDIST)
cldst           equ     (bdst+CLDIST)
indst           equ     (bdst+INCRDIST)
mvdst           equ     (bdst+MVDIST)
 
 
boot:
pbdst   mov.i   <pbsrc  ,       bdst+6
        for     7-1
        mov.i   <pbsrc  ,       <pbdst
        rof
 
        for     7
        mov.i   <pclsrc ,       {pcldst
        rof
 
        mov.i   mbmb    ,       }pmvdst
        mov.i   incr    ,       >pindst
 
        ; jump to bomber and kill boot pointers
pbsrc   spl     @pbdst  ,       bomber+7
        mov.i   incr    ,       pbdst
        mov.i   incr    ,       pcldst
        mov.i   incr    ,       pmvdst
pclsrc pcldst
        dat.f   #cldst+7,       #clr+7
pmvdst pindst
        dat.f   #mvdst  ,       #indst
 
 
 
 
 
 
;;; clear
 
; the booting distance must be chosen so that
; the clear will overwrite the decoy before
; our djn stream gets to it.
clr:
gate    dat     -100    ,       100
        dat     <-10    ,       <2667           ; anti imp bit
        dat     -4000   ,       clptr-gate+2
clear   spl     #-3000  ,       clptr-gate+2    ; hit by spl
        mov     @clptr  ,       >gate
        mov     @clptr  ,       >gate
clptr   djn.b   clear+1 ,       {clear
 
 
 
 
 
 
;;; bomber
; distance from the bomber to clptr is 35 words
 

N       equ     7
step    equ     (1295/N)
djnoff  equ     -2205

; step=185=1295/N, N=7, incr: N*step,N*step  is 1295,1295

; mov.i @(2*step+bombs+offset),*(step+bombs+offset)
;  offset, cycles, left,
;   95, 2231, 77769
;   180, 2043  77957
;   325, 2199, 77801
;   385, 2539, 77461
;   530, 2694, 77306
;   675, 2854, 77146
;   680, 3064, 76939
;   685, 4241, 75759
;   700, 2324, 77676
;   735, 3188, 76812
;   1520, 4303, 75696
;   2005, 3719, 76281
;   2525, 3998, 76002
;

offset  equ     385
 

bomber:
sbmb    spl     #-2*step+5*10,  step+1          ; hit by spl
        sub.f   bomber+INCRDIST,@bmbs
stone   mov.i   @(2*step+offset+sbmb),*(step+offset+sbmb)
        mov.i   bomber+MVDIST,  *stone
bmbs    mov.i   sbmb    ,       @stone
        djn.f   sbmb+1  ,       {djnoff         ; hit by spl
        jmp     bomber+CLDIST+3,<-2064
 
incr    dat     {N*step ,       <N*step
 
mbmb    mov.i   @0      ,       >-step
 

 
;;; tail decoy
 
        for     DECOY
 
        for     (MAXLENGTH-CURLINE)/11
        spl     #_dl    ,       #1
        spl     #1      ,       $1
        spl     #1      ,       @1
        spl     #1      ,       *1
        spl     #_dl    ,       <1
        spl     #1      ,       >1
	spl     #1      ,       {1
        spl     #_dl	,       }1
        spl.x   #1      ,       #1
        spl.x   #1      ,       $1
        spl.x   #1      ,       @1
        rof
 
 
        for     MAXLENGTH-CURLINE-1
        spl     #1      ,       _dl
        rof
        spl     #0      ,       #0
 
        rof     ; DECOY
 
        end     boot
