;redcode-x verbose
;assert CORESIZE == 800
;name redrace (8/13/01)
;author Dave Hillis
; <dbhillis@erols.com>
;strat -   Created using RedRace.c.
;strat -   An evolving population playing KOTH.
;strat -   Configured for the Tiny hill.
;strat -  fills core w/ alternating SPLs and MOV's
;strat -  then switches to core clear.
mov.a  >   337, }     7
spl.ab #     6, @    12
mov.i  @     4, {   -11
mov.i  #     1, {   -12
jmn.ba $    -2, *    -1
spl.x  <  -351, >     6
seq.a  >     2, }    -5
jmp.a  @     7, >   -15
sne.a  #    -2, {    12
sub.a  }    -6, }   -13
spl.x  <  -350, >     0
spl.f  *    -7, @    -9
spl.ab #     1, $     1
mov.i  @    -5, {   -36
jmp.x  {  -362, <    -2
end   0
