;redcode
;name repimp
;author nandor sieben
;strategy paper with imprings
;assert 1
start
spl 1,<440
spl 1,<460
spl 1,<3500
ind    mov #16,0
       mov <-1,<2
       mov <-2,<1
       spl @0,-2340
       mov circ-1,<1020
       add #-101 , -2
       spl circ
       jmz ind,ind
       mov 0,-1
       dat #0
circ   mov -1 , <-1000
       mov imp , imp-2667
       spl imp-2667
       spl imp+2667
imp    mov 0 , 2667
       end start
