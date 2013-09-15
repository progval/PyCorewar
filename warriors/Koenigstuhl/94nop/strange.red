;redcode-94nop
;name Something Strange
;strategy (optimaxed by Fizmo)
;author John Metcalf
;strategy 
;assert 1
;optimax cds

       ORG      ptrD

       step     EQU 10*53
       hop      EQU 5   ; gap
       sbmb     EQU incB

cptr   MOV.B    ptrB,           #-3196    ; adjust the wipe pointer

scanB  MOV      sbmb,           >cptr     ; SPL wipe from the scan loop
       SUB      incB,           ptrB
ptrB   SNE      ptrD+hop-step,  ptrD
       DJN.F    scanB,          @ptrB

       JMN      cptr,           ptrB      ; scan until we detect our SNE

       gate     EQU ptrB

incB   SPL      #-step,         <-step    ; a typical d-clear
clear  MOV      dbmb,           >gate
       DJN.F    clear,          >gate
dbmb   DAT      <2667,          8


       FOR      61
       DAT      0,0
       ROF


       first    EQU (ptrB+step)

incD   DAT      step*2,         step*2
       DAT      0,              0

scanD  ADD      incD,           ptrD      ; .8c pre-scan
ptrD   SNE      first+step,     first
       ADD      incD,           ptrD
       SNE      *ptrD,          @ptrD
       DJN.F    scanD,          @ptrD

       ADD      ptrD,           ptrB      ; adjust pointer in main scan
       JMP      ptrB,           <ptrB+2-step
       END
