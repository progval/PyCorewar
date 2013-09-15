;redcode-x2
;name HoT
;author Christian Schmidt
;strategy KOFACOTO Round 3
;strategy So, the black warrior is for shure
;strategy a pspacer with at least a paper and a stone
;strategy starting with the paper. Brainwash them to
;strategy the stone with a brainwashing paper and get
;strategy the wins (242 of 500 on the testhill) ;-)
;assert 1

pstep1  EQU     (2200*7)
pstep2  EQU     (3740*7)
pstep3  EQU     (3044*7)

ibt     spl     1,0
        spl     1,>-2000
        spl     1,>-1000

        spl     @0,     <pstep1
        mov     }-1,    >-1
        spl     @0,     <pstep2
        mov     }-1,    >-1
        spl     @0,     <pstep3
        mov     }-1,    >-1
        spl    0,       <1
        stp.ab #5       ,#0 