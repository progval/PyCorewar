;redcode
;Name Shears
;Author Matt Hastings
;assert 1
        mov grave, @3
        mov prog, <2
        add #156, 1
        jmn -3, #0+155
prog    spl 0, 0
        mov @5, <-1
grave   jmp -1, 0
