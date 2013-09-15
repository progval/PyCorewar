;redcode-94x
;name tiny Blowrag
;author Metcalf/Schmidt
;strategy silk and imps
;assert CORESIZE==800

istep   equ     267
pstep   equ     75  ; 78 
pbomb   equ     57  ; 481

top     mov     <g2,            {g2
g2      spl     silk+5+istep,   imp+1

silk    spl     @0,             <pstep
        mov     }silk,          >silk
        mov.i   #1,             <1
        spl     -2,             <pbomb
imp     mov.i   #istep,         *0

        for     7
        dat     0,              0
        rof

start   spl     2,              {silk-55
        spl     2,              {silk-istep-55
        spl     1,              {silk+istep-55

        spl     top,            {silk-150
        mov     <g1,            {g1
g1      djn     silk+5-istep,   #imp+1

        end     start

