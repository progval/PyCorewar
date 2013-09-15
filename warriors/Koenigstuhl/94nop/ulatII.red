;redcode-94m
;name U-Lat II
;author Zul Nadzri
;assert 1
;strategy  splits 'n bombs

ULAT    spl     1,>4123
        spl     1,>4345
        mov     -1,0
        spl     ULAT2,>4567

        spl     @0,}2345
        mov     }-1,>-1
        spl     @0,}3456
        mov     }-1,>-1
        mov     {-123,{-234
        mov     {-3,<1
        jmp     @0,>3901

        for     MAXLENGTH-CURLINE-7
                dat 0,0
        rof

ULAT2   spl     @0,}3456
        mov     }-1,>-1
        mov     }234,}345
        spl     3,<5100
        spl     2668,<5345
        mov     0,2667
        jmp     -2667,<5567

        end     ULAT
