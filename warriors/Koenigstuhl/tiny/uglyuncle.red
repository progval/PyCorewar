;redcode-94x
;name Ugly Uncle
;author Christian Schmidt
;strategy Q^4 -> paper
;assert 1

     qa equ 240
     qb equ 421
     qf equ qta

     sne   qf-2*(qa-1)*(qb),qf+(qa-1)*(qb)
     seq   qf-2*(qa)*(qb),  }qta
     jmp   qta,             {qta
     jmz.f pgo,             <qta

qta: mul.x #qa,      #qb
     sne   >-242,    @qta
     mul.f #-2,      qta

qlo: mov   <-285,    }qta
     mov   }qlo,     <qta
     djn   qlo,      #17

pgo  spl     2,      <736
     spl     2,      <638
     spl     1,      <522

s1   spl     @0,     <66
     mov     }-1,    >-1
     mov     }-2,    >-2
s2   spl     @0,     <539
     mov     }-1,    >-1
     mov.i   }322,   <436
     djn.f   -2,     <495

     end     
