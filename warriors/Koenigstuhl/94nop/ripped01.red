;redcode-b quiet
;name Ripped v0.1
;author Ian Oversby
;strategy v0.1 Fast Bomber
;strategy Is this Tornado?
;strategy Apparently not :-(
;strategy The first one to bomb lots of places and still coreclear!
;strategy Boot, stone, stun, clear, gate (I think)
;assert 1

boot    equ     1800

org     gate1

i for 16
        SPL.B   #i,     #2*i
        SPL.B   #3*i,   #4*i
rof

i for 10
        SPL.B   #i,     #i+3
rof

gate1   MOV.I   }ptr,   >ptr    ;boot away
for 9
        MOV.I   }ptr,   >ptr
rof
        JMP.B   bombs+boot      ;start fighting
ptr     DAT.F   gate,   boot+gate


gate    DAT.F   -25,    last-gate1+3
bombs   SPL.B   #-95,   #95
bptr    MOV.I   -92,    *94
        MOV.I   last,   @bptr 
        MOV.I   gate,   *bptr
        ADD.F   bombs,  bptr
        DJN.F   bptr,   <-157
clr     MOV.I   @djmp,  >gate1
djmp    DJN.B   clr,    {bombs
last    SPL.B   #1634,   #0

end
