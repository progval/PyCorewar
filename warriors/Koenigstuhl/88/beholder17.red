;redcode quiet
;name Beholder's Eye v1.7
;author W. Mintardjo
;strategy B-scanners live in vain with gate
;assert 1

step    EQU 1226
init    EQU -2

        ADD #step, @2
main    JMZ -1, @2
        MOV jump, @1
        MOV snow, <init+step
        JMN -4, @-4
snow    SPL 0, <0
        MOV 2, <-6
jump    JMP -1, 0
        DAT <-2 ,<-92

        END main

