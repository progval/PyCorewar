;redcode-nano
;name listen to the rain
;author John Metcalf
;strategy paper
;assert CORESIZE==80

     step  equ -35
pap: spl   #0,      }step
     mov   }pap,    >pap
sto: mov   {34,     {20
     mov   {-22,    {-11
     djn.f pap+step,{23
     end
