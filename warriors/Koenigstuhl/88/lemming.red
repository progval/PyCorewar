;redcode
;name Lemming
;author Scott Nelson
;strategy replicator
;strategy TCWN, Spring 1988
;assert 1
START   MOV     #-100,  D
        SPL     1
S       MOV     #6,     0
        MOV     <S,     <D
        MOV     <S,     <D
        MOV     <S,     <D
        SPL     S
D       JMP     @0
        END
