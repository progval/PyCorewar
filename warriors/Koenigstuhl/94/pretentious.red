;redcode-b quiet
;name Pretentious v0.2
;author Ian Oversby
;strategy v0.1  Scanner -> Paper
;strategy v0.2  (Hopefully) improved scanner
;assert 1
 
res     LDP.AB  #0,     #0
str     LDP.A   #111,   str1    ; load strategy in use
        LDP.A   #157,   str2    ; have we lost before?
        SNE.AB  #0,     res     ; check result
        JMP.B   lost
win     STP.AB  #0,     #157
        JMP.B   sel
lost    JMN.A   change, str2    ; two losses in a row
        STP.AB  #1,     #157
        JMP.B   sel
change  STP.AB  #0,     #157
        ADD.A   #1,     str1    ; lost change
sel     MOD.A   #2,     str1    ; secure result
        STP.AB  str1,   #111
str1    JMP.B   @0,     auntie
        DAT.F   0,      pboot
str2    DAT.F   0,      0
 
pboot   MOV.I   pstart+10, <pptr
        MOV.I   pstart+9, <pptr
        MOV.I   pstart+8, <pptr
        MOV.I   pstart+7, <pptr
        MOV.I   pstart+6, <pptr
        MOV.I   pstart+5, <pptr
        MOV.I   pstart+4, <pptr
        MOV.I   pstart+3, <pptr
        MOV.I   pstart+2, <pptr
        MOV.I   pstart+1, <pptr
        MOV.I   pstart, <pptr
        SPL.B   @pptr
        MOV.I   bomb,   pptr
pptr    DAT.F   #0,     #3462
 
pstart  SPL 1, <-300
        SPL 1, <-400
        SPL 1, <-500
paper   SPL 4173, #0
        MOV >-1, }-1
        MOV bomb, }2421    ; anti-vamp
        MOV bomb, {3517    ; more anti-vamp
        MOV <paper, {last  ; another copy
last    JMP 5127, <-30     ; escape?
bomb    DAT >1, }1
        DAT >1, }1 

auntie  MOV.I   loop+14, <ptr
        MOV.I   loop+13, <ptr
        MOV.I   loop+12, <ptr
        MOV.I   loop+11, <ptr
        MOV.I   loop+10, <ptr
        MOV.I   loop+9, <ptr
        MOV.I   loop+8, <ptr
        MOV.I   loop+7, <ptr
        MOV.I   loop+6, <ptr
        MOV.I   loop+5, <ptr
        MOV.I   loop+4, <ptr
        MOV.I   loop+3, <ptr
        MOV.I   loop+2, <ptr
        MOV.I   loop+1, <ptr
        MOV.I   loop,  <ptr
        SPL.B   @ptr
        MOV.AB  #5000,  ptr
ptr     DAT.F   #0,     2152
 
loop    ADD.F   cons,   scan
scan    CMP.I   -1,     11
        SLT.A   #30,    scan
fin     DJN.B   loop,   <-100
        MOV.I   b1,     }scan
count   DJN.B   -1,     #13
        SUB.A   #13,    scan
        MOV.AB  #13,    count
        JMZ.F   loop,   loop-5
cptr    SPL.B   #b1,    #b2+1
b1      SPL.B   #4,     #b2+2
        MOV.I   *cptr,  >cptr
        JMP.B   -1,     <-10
b2      DAT.F   #4,     #5
cons    DAT.F   #3359,  #3359

        END

