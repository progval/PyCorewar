;redcode-tiny
;name Workshop of the Corelord
;author John Metcalf
;strategy enter friend, watch time's
;strategy greatest Coresmiths at work
;assert CORESIZE==800

istep   equ     267
pstepa  equ     448
pstepb  equ     234

top     mov     <g2,            {g2
g2      spl     silka+6+istep,  imp+1

silka   spl     @0,             <pstepa
        mov     }silka,         >silka
silkb   spl     pstepb,         0
        mov     >silkb,         }silkb
        spl     imp+istep,      >400
imp     mov.i   #1,             istep

        for     6
        dat     0,              0
        rof

start   spl     2,              {imp-100
        spl     1,              {imp-istep-100
        spl     1,              {imp+istep-100

        spl     top,            {imp-120
        mov     <g1,            {g1
g1      djn     silka+6-istep,  #imp+1

        end     start
