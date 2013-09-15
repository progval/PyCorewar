;redcode-94x
;name Moominpapa
;author John Metcalf
;strategy TinyQ^4 -> Paper
;assert CORESIZE==800

     qa equ 480
     qb equ 561
     qf equ qta

   ; scan 7 locations

     sne   qf-2*(qa-1)*(qb),qf+(qa-1)*(qb)
     seq   qf-2*(qa)*(qb),  }qta
     jmp   qta,             {qta
     sne   qf-2*(qa+1)*(qb),qf+(qa+1)*(qb)
     jmz.f pgo,             <qta

qta: mul.x #qa,      #qb    ; decode
     sne   >80,      @qta
     mul.f #-2,      qta

qlo: mov   <410,     >qta   ; attack
     mov   }qlo,     {qta
     mov   {qta,     >qta
     djn   qlo,      #13

     s1 equ (5*12)
     s2 equ (5*101)

pgo: spl   2,        {-37
     spl   *2,       {-59
     spl   *1,       {-131
pap1:spl   @0,       {s1
     mov   }pap1,    >pap1
     mov.i #s1-s2-7, }0
     mov   {pap1,    {pap2
pap2:djn.f s2+1,     {-(s2+5)
     end
