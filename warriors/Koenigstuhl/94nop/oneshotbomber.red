;redcode-94x
;name 1 shot bomber
;author P._V._K.
;assert 1


        dat.f   1,1
sc      dat.f   sb,     0
db      dat.f   sb+1,   >11

start   add.ab  #2376,  1
        jmz.f   -1,     <sc
        mov.b   -1,     sc
sb      spl     #1,     >11
        mov.i   *sc,    >sc
        djn.b   -1,     <-20
        dat.f   0,      2

        end     start
