;redcode-b verbose
;name Fire-master
;strat trying low profile recoding of 1 shot bomber
;author P._V._K.
;assert 1

sc      dat.f   sb,     0
db      dat.f   sb+1,   >11

start   add.ab  #2376,  sc
        jmz.f   -1,     @sc
sb      spl     #1,     >11
        mov.i   *sc,    >sc
        djn.b   -1,     <-20


        end     start
