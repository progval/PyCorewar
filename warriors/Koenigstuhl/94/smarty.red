;redcode-94
;name Smarty
;author Ilmari Karonen
;strategy The "no ties" round, eh? Hey, let's try paper!
;strategy ..P-switched of course, I'm not _that_ crazy.
;strategy  Test scores don't look promising, but I should
;strategy  be studying anyway, so..
;strategy (CCPaper / Tsunami)
;planar pspace, boot, paper, clear, scan, stun
;assert CORESIZE == 8000

;>Well, since no-one should submit imps, I can crush all those
;>stones - as well as dodgers from last round - with ccpaper.
;>Tsunami works as a backup in case the paper starts tying.
;>Worst expected case: self fight (<33% wins)
;>Worst possible case: heavy imps (~100% ties)

;>Not much original code this time.. Not much debugging either
;> - it seems to work, and that's about it.

; * pswitcher constants *
pflag   equ     285

; * ccpaper constants *
len EQU 9
fcp EQU 3039
scp EQU 2365
tcp EQU 777

; * tsunami constants *
gate1   equ     (gate-3)
final   equ     (cptr+1)
first   equ     106
half    equ     15
step    equ     (half*2)
tval    equ     14 + (180 * 15)

        org     think

; *** CC Paper by Franz ***

frog    spl     @0,     <fcp-len
        mov     }-1,    >-1
        spl     @0,     <scp
        mov     }-1,    >-1
        spl     @0,     <tcp
        mov     }-1,    >-1
        mov     2,      <-1
        jmp     -1,     <-10
        dat     <2667,  <2667*2

        DAT.F   $0,     $0
        DAT.F   $0,     $0      ; Scanned
        DAT.F   $0,     $0

; *** switch-on-loss/tie p-brain ***
; 5 cycles on win, 6 on loss/tie

think   ldp.ab  #pflag, switch
pmod    ldp.a   2, 2            ; just to save one instruction..
        mod.f   pmod, @think
switch  sne.a   >0, 0
        stp.ba  switch, think
        djn.b   strat2, @think

; *** CC Paper boot ***

strat1  spl 1,<-3000  ;letz get 9 processes together
        mov -1,0
        mov -1,0
        mov -1,0
        spl     @frog,  >-1000 ;lets boot the silk way
        mov     }-1,    >frog
                
        DAT.F   $0,     $0
        DAT.F   $0,     $0      ; Scanned
        DAT.F   $0,     $0

; *** Tsunami by Ian Oversby ***

strat2  MOV.I   {pos,   <tptr
for 9
        MOV.I   {pos,   <tptr
rof
        SPL.B   *tptr,  <-200

tptr    DIV.F   #tval-7,#tval

        DAT.F   $0,     $0
        DAT.F   $0,     $0      ; Scanned
        DAT.F   $0,     $0

gate    DAT.F   -25,    final-gate1+3
        SPL.B   #-20,   #20
bomb    SPL.B   #first+half, #first
sloop   SUB.F   cons,   @scan
scan    SNE.I   *bomb,  @bomb
        JMZ.B   sloop,  #0      ; From Torch
cons    SPL.B   #-step, >-step
cloop   MOV.I   @cptr,  >gate1
        MOV.I   @cptr,  >gate1
cptr    DJN.B   cloop,  {bomb

datz
pos     end
