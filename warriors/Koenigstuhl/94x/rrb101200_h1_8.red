;redcode-x verbose
;assert CORESIZE == 55440
;name RedRace B (10/12/00) h1_8
;author Dave Hillis
; <dbhillis@erols.com>
;strat -   Created using RedRace.c.
;strat -   An evolving population playing KOTH.
;strat -   Configured for the big hill.
mul.f  { 24134, @ 19409
spl.i  $     0, >     0
spl.i  {     6, $     0
cmp.i  }    -5, } 11278
cmp.i  }    -6, } 11277
spl.i  #    -1, >     4
mov.i  @     4, <     2
mov.i  @     4, <     1
dat.i  >    -8, {   -10
jmp.f  #   -10, *-26641
add.i  }     6, }   -11
add.i  }     5, }   -13
djn.a  $   -15, <    -7
jmp.i  }    -5, $   -13
jmp.i  }    -6, $   -14
mov.i  $    -6, *    -9
add.b  *   -18, # 21980
end   0
