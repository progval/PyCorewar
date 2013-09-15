;redcode-94
;name Crystal v0.3
;author Ian Oversby
;strategy v0.1  100% Imp-gate Core-Clear SPL/DAT/DAT... with DJN.B
;strategy v0.2  Changed to DJN.F and SPL/SPL/DAT/DAT...
;strategy v0.3  Removed bugs (I hope)
;assert 1
;Planar: stun, clear, gate

org start

gat     DAT.F   #3,     #7
        DAT.F   #1,     #6
        DAT.F   #2,     #7
start   SPL.B   #3,     #7
loop    MOV.I   *gat,   >gat    ; anti-imping dirty core-clear
        DJN.F   loop,   >gat    ; SPL/SPL/DAT/DAT... and DJN.F
