;redcode
;name Geeks Bearing Gifts 1.0
;author Ransom Smith
;strategy Releases Packets that generate SPL
;strategy carpets, then does a DAT coreclear.
;assert CORESIZE==8000


step    EQU     5
nd      EQU     1332
pstl    EQU     ick + 2

b1      SPL     #2,     3
b2      MOV     -1,     }-1
dt      DAT     #nd,    }-2
inc     ADD.ab  #step,  ick
start   MOV     b1,     >ick
        MOV     b2,     @ick
        DJN.a   inc,    dt
ick     NOP     }b2,    #pstl
        JMP     b1,     }b2

end start
