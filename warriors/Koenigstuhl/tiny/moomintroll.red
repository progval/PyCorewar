;redcode-94x
;name Moomintroll
;author John Metcalf
;strategy Paper
;assert CORESIZE==800

     s1 equ 84  ; 460
     s2 equ 745 ; 190

     spl   2,          >171
     spl   *1,         >258
     spl   1,          <571

     mov   {pap1,      {boot
boot:spl   400+pap1+5, <658

pap1:spl   @0+5,       {s1
     mov   }pap1,      >pap1
     mov.i #s1+10,     }-s2
     mov   {pap1,      <pap2
pap2:djn.f @0,         >s2+1
     end

