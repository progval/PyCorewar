;redcode
;name return of the living dead
;author nandor sieben
;<ASMQK@ASUVM.INRE.ASU.EDU>
;strategy  more better living deads
;assert 1
start   MOV     dead , 1031     ; copy a living dead
        MOV   living , <start
        MOV   return , <start
s2      MOV     dead , 2029
        MOV   living , <s2
        MOV   return , <s2
s3      MOV     dead , 3029
        MOV   living , <s3
        MOV   return , <s3
s4      MOV     dead , 4027
        MOV   living , <s4
        MOV   return , <s4
s5      MOV     dead , 5027
        MOV   living , <s5
        MOV   return , <s5
s6      MOV     dead , 6025
        MOV   living , <s6
        MOV   return , <s6
s7      MOV     dead , 7025
        MOV   living , <s7
        MOV   return , <s7
        SPL     @start          ; start them
        SPL     @s2
        SPL     @s3
        SPL     @s4
        SPL     @s5
        SPL     @s6
        SPL     @s7
        JMP     return

ptr     DAT     #0
return  SPL     0    , <ptr
living  MOV     ptr  , <ptr
dead    JMP     return , <ptr
        END     start
