;redcode-94x
;name Easter Egg
;author John Metcalf
;strategy TinyQ^4 -> Paper
;assert CORESIZE==800

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

     apri1 equ 70
     foo1 equ 524

pgo: spl   2,        {-100
     spl   1,        {-150
     spl   1,        {-200
pap1:spl   apri1,    0
     mov   >pap1,    }pap1
     mov   bomb,     }pap1
     mov   bomb,     {pap2
     mov   <pap1,    {pap2
pap2:jmz   foo1,     *0
bomb:dat   >1,       >1

     end

