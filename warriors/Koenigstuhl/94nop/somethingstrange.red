;redcode-94nop
;name something strange
;author John Metcalf
;strategy tonight something strange stalks the core
;strategy .8c pre-scan -> .5c scan / .25c wipe -> d-clear
;assert CORESIZE == 8000

       ORG      ptrD

       step     EQU 230 ; (or 3470, 5110)
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


       FOR      72
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

