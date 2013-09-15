;redcode
;name Beholder's Eye v1.1
;author W. Mintardjo
;strategy Modified B-Scanners Live in Vain (Matt Hastings) with IMPs immunity
;assert 1

step    EQU 2234
init    EQU -2

main    ADD #step, 3
        JMZ -1, @2
        MOV jump, @1
        MOV snow, <init
        JMN -4, -4
snow    SPL 0, <0
        MOV 2, <-6
jump    JMP -1, 0
        DAT <-92 ,<-2

        END main
