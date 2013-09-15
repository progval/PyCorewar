;redcode-b
;name Auntie v1.0
;author Ian Oversby
;strategy v0.1  Searching for a good scanner.
;strategy v1.0  Shorter.
;assert 1
 
        MOV.I   loop+14, <ptr
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

