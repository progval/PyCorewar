;redcode
;name Paradox
;author Mike Nonemacher
;strategy Vampiric anti-imp paper + anti-vamp paper
;strategy + gate-crashing imp-spiral
;strategy You can always kill one...
;assert 1
;anti-imp paper, anti-vamp paper, and gate-crashing spiral
 
PC1    EQU    -2395    ;normal (anti-imp) paper's constant
PC2    EQU    1067    ;anti-vamp paper's constant
PC3    EQU    -2995
IMPC    EQU    232    ;offset of start of imp-spiral
IMPOFF    EQU    1    ;difference between 2667 & 2668 imps (-)
D1    EQU    2667
D2    EQU    2668
i1off    EQU    0    ;start as 4-3-2-1, coreclear changes it to
i2off    EQU    2667    ;2-1-4-3
i3off    EQU    5334
i4off    EQU    1
 
imp1    mov    0,    2667
imp2    mov    0,    2668
start    spl    p1
    spl    i2b
i2a    mov    imp2,    imp2+IMPC+i1off
    mov    imp2,    imp2+IMPC+i1off+1
    mov    imp2,    imp2+IMPC+i1off+2
    spl    1
    spl    1
    mov    -1,    0
    spl    2
    jmp    @0,    imp2+IMPC+i1off
    add    #D2,    -1
    dat    #0
i2b    spl    i2c
    mov    imp2,    imp2+IMPC+i2off
    mov    imp2,    imp2+IMPC+i2off+1
    spl    1
    spl    1
    mov    -1,    0
    spl    2
    jmp    @0,    imp2+IMPC+i2off
    add    #D2,    -1
    dat    #0
i2c    spl    i2d
    mov    imp2,    imp2+IMPC+i3off
    spl    1
    spl    1
    mov    -1,    0
    spl    2
    jmp    @0,    imp2+IMPC+i3off
    add    #D2,    -1
    dat    #0
i2d    spl    i1a
    spl    1
    spl    1
    mov    -1,    0
    spl    2
    jmp    @0,    imp2+IMPC+i4off
    add    #D2,    -1
    dat    #0
i1a    mov    imp1,    imp1+IMPC-IMPOFF
    spl    1
    spl    1
    mov    -1,    0
    spl    2
    jmp    @0,    imp1+IMPC-IMPOFF
    add    #D1,    -1
    dat    #0
p1    spl    1
    spl    1
    spl    1
    spl    p3
    spl    p2
    spl    1
    mov    #16,    16        ;Vampiric paper
p001    mov    <-1,    <1
    spl    @0,    #PC1
    mov    b1,    <-1
    mov    b2,    <-2
    mov    b3,    <-3
    jmz    @0,    -6
b1    dat    <2667,    <5334
b2    mov    0,    <1
b3    jmp    50,    <2667
    mov    b1,    <-60
    spl    -1,    <-60
    jmp    -2,    <-61
    jmp    -3,    <2667
    jmp    -4,    <2667
    jmp    -5,    <2667
spacer    dat    #0
    mov    #8,    8
p2    mov    <-1,    <1
    spl    @0,    #PC2
    mov    #8,    av-100
    sub    <av-100-8,    av-100
av    mov    3,    <-100
    mov    2,    <-101
    jmz    @0,    -7
    dat    #0
    mov    #8,    8
p3    mov    <-1,    <2
    jmn    5,    -2
    spl    @0,    #PC3
    mov    3,    <-1
    mov    2,    <-2
    jmz    @0,    -6
    dat    <2667,    <5334
END    start
