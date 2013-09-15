;redcode-94x verbose
;name Big Phoenix 1.0
;author J.Pohjalainen
;strategy v1.0: some kind of a replicator, but now same code
;strategy       executed once (so, maybe it is not true paper)
;strategy       Big Hill version
;assert CORESIZE==55440
 
STEP1   equ     21440
STEP2   equ     10300
STEP3   equ      3550
 
warrior
        spl     1,          <-197
        spl     1,          <-198
        spl     1,          <-199
 
phoe1   spl     @phoe1,     STEP1
        mov.i   }phoe1,     >phoe1
phoe2   spl     @phoe2,     STEP2
        mov.i   }phoe2,     >phoe2
phoe3   spl     @phoe3,     STEP3
        mov.i   }phoe3,     >phoe3
        mov.i   egg,        }27721
egg     dat.f   <34117,     <35873
        dat.f   <34117,     <35873
        dat.f   <34117,     <35873
        dat.f   <34117,     <35873
        dat.f   <34117,     <35873
end warrior                                   

