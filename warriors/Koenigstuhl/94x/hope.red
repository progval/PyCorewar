;redcode-x2
;name Hope
;author John Metcalf
;strategy No test-time available to see what beats
;strategy Black Box, so just attempt to tie...
;assert (CORESIZE == 55440) && (MAXPROCESSES == 10000)

     spl   @1,     >-1500 ; all untested
     spl   1,      >-2000
     spl   1,      <-2500
     spl   @0,     >31078
     mov   }-1,    >-1
     mov   }-2,    >-2
pap1:spl   @0,     >21042
     mov   }pap1,  >pap1
     mov   bomb,   <6804
     mov   {pap1,  {pap2
pap2:djn.f *29108, <12988
bomb:dat   <27220, <13610
     end

