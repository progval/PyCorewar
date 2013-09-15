;redcode 
;name Paratroops v1.2
;author W. Mintardjo
;assert 1

init    EQU (incr+98)
dist    EQU 47

step    DAT #98, #98
incr    ADD step, scan
scan    CMP init, init+dist
        SLT #last+dist, scan
        JMP incr
        MOV step, <scan
        DJN -1, #dist+3

launch  ADD #1600, ptr1
        MOV s4, @ptr1
        MOV s3, <ptr1
        MOV s2, <ptr1
ptr1    SPL @ptr1, s2+500
        MOV s1, <ptr1
        DJN launch, #5

s1      dat <-4,<-5
s2      spl 0,<-3
s3      mov -2,<-4
s4      jmp -1,<-5

last    END scan
