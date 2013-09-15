;redcode
;name The 8 Kings
;author Christian Schmidt
;strategy KOFACOTO Round 2:
;strategy 8 stones for 8 processes
;strategy the launcher is strongly based
;strategy on return of the living dead
;strategy the stone is Moore's version
;strategy of no ties allowed.
;assert 1


start   MOV     dead , 1032
        MOV   living , <start
        MOV   return , <start
        SPL     @start

s2      MOV     dead , 3032
        MOV   living , <s2
        MOV   return , <s2
        SPL     @s2

s3      MOV     dead , 5032
        MOV   living , <s3
        MOV   return , <s3
        SPL     @s3

s4      MOV     dead , 7032
        MOV   living , <s4
        MOV   return , <s4
        SPL     @s4

s5      MOV     dead , 2016
        MOV   living , <s5
        MOV   return , <s5
        SPL     @s5

s6      MOV     dead , 4016
        MOV   living , <s6
        MOV   return , <s6
        SPL     @s6

s7      MOV     dead , 6016
        MOV   living , <s7
        MOV   return , <s7
        SPL     @s7

return  mov      <21 , 1+2234
living  sub        1 , -1
dead    jmp   return , <-2234

        END     start
