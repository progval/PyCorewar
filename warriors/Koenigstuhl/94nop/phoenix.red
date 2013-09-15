;Address jippo@clinet.fi
;redcode-94 verbose
;name Phoenix 1.1
;author J.Pohjalainen
;strategy v1.0: some kind of a replicator, but now same code
;strategy       executed once (so, maybe it is not true paper)
;strategy v1.1: some more code and different constants
;assert CORESIZE==8000
 
PSTEP   equ     3520
NSTEP   equ     1520
ESTEP   equ      830
 
warrior
        spl     1,          <-98
        mov.i   -1,         0
        mov.i   -1,         0
        mov.i   -1,         0
 
phoenix spl     @phoenix,   PSTEP
        mov.i   }phoenix,   >phoenix
nest    spl     @nest,      NSTEP
        mov.i   }nest,      >nest
egg     spl     @egg,       ESTEP
        mov.i   }egg,       >egg
        mov.i   ash,        {3999
        mov.i   ash,        }4001
ash     dat.f   <2667,      <2*2667
        dat.f   <2667,      <2*2667
        dat.f   <2667,      <2*2667
        dat.f   <2667,      <2*2667
        dat.f   <2667,      <2*2667
 
end warrior                                   
