;redcode-x verbose
;name RedRace B (10/15/00) h1_8
;author Dave Hillis
; <dbhillis@erols.com>
;strat -   Created using RedRace.c.
;strat -   An evolving population playing KOTH.
;strat -   Configured for the big hill.
;assert CORESIZE == 55440
spl.i  $     0, $     0
cmp.i  }    -5, }  3278
cmp.i  }    -4, }  3279
spl.i  {     5, $     0
spl.ba #    -1, >     7
mov.i  @     3, <     2
mov.i  @     4, <     1
dat.i  *    -8, {    -9
add.i  }     3, }   -10
seq.b  @    -2, @  2495
djn.a  $   -15, <    -7
jmp.i  }    -4, $   -16
seq.i  }    -1, >    -9
mov.i  @    -6, *    -6
end   0
