;redcode-b
;name Pensive v0.3
;author Ian Oversby
;strategy v0.1  Anti-scanner
;strategy v0.2  Boeren bug fixes
;strategy v0.3  Changed back to original idea!
;assert 1
 
stun    SPL.B   #-95,   #95
loop    ADD.F   stun,   1
        MOV.I   <-49,   2
        MOV.I   stun,   >-50
        DJN.F   loop,   <-100
        MOV.I   1,      {loop

