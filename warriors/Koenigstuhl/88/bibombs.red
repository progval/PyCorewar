;redcode
;name BiBombS

;strategy CWGuide Example
;assert 1

A       DAT     #0
B       MOV     A, <A
C       JMP     B
Start   MOV     A, (Start+2048)
        MOV     B, (Start+2049)
        MOV     C, (Start+2050)
        MOV     A, (Start+6144)
        MOV     B, (Start+6145)
        MOV     C, (Start+6146)
        SPL     (Start+2049)
        SPL     (Start+6145)
        END     Start
