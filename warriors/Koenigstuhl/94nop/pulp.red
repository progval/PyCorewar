;redcode-94 test
;name Pulp
;author Ian Oversby
;strategy Paper without QScan
;assert 1

dest1   equ     1400    ; For Pulp v0.2
dest2   equ     5460
dest3   equ     725
pos1    equ     930     
pos2    equ     3359
pos3    equ     1009    ; clear old copies

org paper

;;------------------------------------------------------------

paper   SPL.B   1,      <-300
        MOV.I   -1,     0
        MOV.I   -1,     0
        SPL.B   1,      {-300

silk    SPL.B   @0,     >dest1
        MOV.I   }-1,    >-1
        MOV.I   bomb,   >pos1
silk2   SPL.B   @0,     >dest2
        MOV.I   }-1,    >-1
        MOV.I   bomb,   >pos2   ; linear bombing
        MOV.I   bomb,   }pos3   ; anti-vamp
        MOV.I   {silk2, <silk3
silk3   JMP.B   @0,     >dest3
bomb    DAT.F   <2667,  <5334

;;------------------------------------------------------------

end
