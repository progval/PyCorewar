;redcode-nano
;name Moonshade
;author John Metcalf
;strategy paper
;assert CORESIZE==80

     spl   *1,       >52
     spl   *1,       >6

pap: spl   @0,       <58
loop:mov   }pap,     >pap
     djn.f loop,     {16
