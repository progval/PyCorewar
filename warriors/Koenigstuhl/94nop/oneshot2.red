;redcode-b 
;author P._V._K.
;assert 1
;name one-shot 2
;strat one-shot/bomber

cptr    dat.f   sb,     0
db      dat.f   sb+1,   12
inc     dat.f   >2377,   >-237
start   add.f   inc,    1
        mov.i   <-1,     {0
        jmz.f   -2,     {-1
        mov.ab  -2,     cptr
sb      spl     #1,     12
        mov.i   *cptr,  >cptr
        djn.b   -1,     <-20
        end     start
