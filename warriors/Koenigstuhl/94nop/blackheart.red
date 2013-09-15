;redcode-94
;name Blackheart
;author Ben Ford
;strategy silk/imps
;assert (CORESIZE==8000)

; ----- paper -----
pimp equ (2667)
plen equ (   8)
pend equ (pap1+plen)
pgo0 equ (4868+pend) ;  240 4868
pgo1 equ (1100)      ; 1880 1100
pgo2 equ (1373)      ; 2050 1373

boot  spl     $   1,  {   0
qtb2  spl     $   1,  >   1
      spl     $   1,  $   1
      mov     <   1,  {   1
pap0  spl      pgo0,   pend

pap1  spl      pgo1,  $   0
      mov     >pap1,  }pap1
pap2  spl      pgo2,  $   0
      mov     >pap2,  }pap2
pap3  spl     @   0,  <pimp+1
      mov     }pap3,  >pap3
      mov.i   #pgo1*2,}-pgo1
      mov.i   #pgo2,   pimp

end boot

