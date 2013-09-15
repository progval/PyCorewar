;redcode-94
;name Assassin v1.0
;author Michael Constant
;strategy  B-scanner !?
;assert 1

adder   add     #12,    scan
scan    jmz     adder,  which
        mov     #12,    count
        mov     @which, >scan
count   djn     -1,     #0
        jmp     scan,   0

        for     92
        dat     0, 0
        rof

which   dat     0,      #split
split   spl     -1,     #-22
