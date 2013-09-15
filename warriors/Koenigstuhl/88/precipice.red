;redcode
;name Precipice
;author Matt Hastings
;assert 1
start   mov lbomber, -4056
        mov lbomber+1, -4056
        mov lbomber+2, -4055
        mov lbomber+3, -4055
        spl -4060, 25
        mov trp, start-3999
        mov trp2, start-3998
arb     mov dbomber,   1151
        mov dbomber+1, 1151
        mov dbomber+2, 1151
        mov dbomber+3, 1151
        mov dbomber+4, 1152
        spl 1147
        spl 1146  
        spl 1145
        spl 1144
        spl 1143
        spl 1142, 3
        jmp 1141, 17
lbomber mov 3, <4
        jmp -1, 0
        dat #0, #-8
        dat #0, #-29
dbomber jmp 3791, 7055
        mov @1, <-1
        add 3, -2
        jmp -2, <2787
        dat #948, #-947
trp     spl 0, 0
trp2    jmp -1, 0
;lots of decoys
