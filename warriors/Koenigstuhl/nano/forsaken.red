;redcode-nano
;name forsaken
;author John Metcalf
;strategy paper
;assert CORESIZE==80

     step  equ -35
pap: spl   #0,       }step
     mov   }pap,     >pap
     mov   {pap+31,  {pap-4
     mov   {pap+39,  {pap+25
     djn.f pap+step, {pap-14
     end
