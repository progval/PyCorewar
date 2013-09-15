;redcode-x
;name RedRace B (10/15/00) h1_4
;author Dave Hillis
; <dbhillis@erols.com>
;strat -   Created using RedRace.c.
;strat -   An evolving population playing KOTH.
;strat -   Configured for the big hill.
;assert CORESIZE == 55440
mov.ab {   134, @  3409
spl.i  $     0, $     0
spl.i  {     6, @     0
cmp.i  }    -6, }    15
nop.i  }    -4, >    -5
spl.i  #    -5, >     8
mov.i  @     4, <     2
mov.i  @     3, <     1
dat.i  >    -2, {   -12
jmp.f  #   -10, *     8
add.i  }    -6, }   -13
mov.i  }     7, }   -15
djn.a  $   -16, <     2
jmp.i  }    -5, $     4
spl.a  $    -6, @   -16
add.i  }   -13, $   -14
jmp.ab }    -9, $    -5
mov.ba $    -8, *   -11
add.b  *   -21, # -2020
end   0
