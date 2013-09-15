;redcode-94x
;name Pergament
;author Christian Schmidt
;strategy silk/imps
;assert 1

pStep1 equ 44
pStep2 equ (pStep1+267)

start  spl  1,    <-100
       mov  -1,   0
       mov  -1,   0

       mov   {pap1,  {pBoo
pBoo:  spl   pEnd+400,{2093

pap1:  spl   @pEnd,  <pStep1
       mov.i }pap1,  >pap1
pap2:  spl   @0,  <pStep2
       mov.i }pap2,  >pap2
       mov.i #1, 267
pEnd:  dat   0,      0

end start

