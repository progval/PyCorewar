;redcode-94x
;name Snufkin
;author John Metcalf
;strategy TinyQ^4 -> Paper
;strategy more scans than Moominpapa with a smaller paper
;assert CORESIZE==800

     qa equ 736
     qb equ 551
     qf equ qta

   ; scan 9 locations

     seq   qf-2*(qa-1)*(qb-1),qf+(qa-1)*(qb-1)
     djn.f qta,               qta
     sne   qf-2*(qa-1)*(qb),  qf+(qa-1)*(qb)
     seq   qf-2*(qa)*(qb),    }qta
     jmp   qta,               {qta
     sne   qf-2*(qa+1)*(qb),  qf+(qa+1)*(qb)
     jmz.f pgo,               <qta

qta: mul.x #qa,      #qb    ; decode
     sne   >-127,    @qta
     mul.f #-2,      qta

qlo: mov   <355,     >qta   ; attack
     mov   }qlo,     {qta
     mov   {qta,     >qta
     djn   qlo,      #13

     s1 equ 60
     s2 equ 444

pgo: spl   1,        {-226
     spl   1,        >-297
pap1:spl   @0,       {s1
     mov   }pap1,    >pap1
     mov   {pap1,    {pap2
pap2:djn.f s2+1,     {355
     end

