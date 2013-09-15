;redcode
;name Echo
;author Corey Lynn Nelson
;assert 1
SRC     DAT             #0
ECHO    MOV     GAIT,   GAIT+30 
E1      MOV     PTR,    <PTR
        CMP     GAIT+30,GAIT+31         ;Check for incoming
        JMP     E1                      ;If none, loop back
        MOV     #10,    SRC             ;Else, run away.
        MOV     #40,    GAIT
S1      MOV     @SRC,   <GAIT
        DJN     S1,     SRC
GAIT    JMP     @GAIT
PTR     DAT             #ECHO
        END     ECHO
