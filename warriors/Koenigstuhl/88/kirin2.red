;redcode
;name kirin2
;author Eiji Kako
;assert 1
A       DAT     #1024
B       DAT     #9003
H1      SPL     0
H2      JMP     -1
xORG    MOV     #1024,A
        MOV     H2,<B
        MOV     H1,<B
        ADD     #826,B
        DJN     -3,A
        JMP     PROG2
        SPL     0
        JMP     -1
PROG2   MOV     #-20,C
        MOV     C,<C
        DJN     -1,<C
        JMP     xORG
        JMP     0
C       DAT     #-20

end     xORG
