;redcode-94
;name Nerx-A19
;author Arek Paterek
;strategy paper + imp rings
;assert 1

        mov     #9,     0
        mov     <-1,    <cel
        jmn     -1,     -2
cel     spl     @0,     3355
        mov     ring,   ring+2667
        mov     ring,   ring+2*2667-1
        spl     ring+2*2667-1
        spl     ring+2667
ring	mov 	0,	2667

