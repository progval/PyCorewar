;redcode-x verbose
;assert CORESIZE == 55440
;name RedRace B (10/15/00) h1_2
;author Dave Hillis
; <dbhillis@erols.com>
;strat -   Created using RedRace.c.
;strat -   An evolving population playing KOTH.
;strat -   Configured for the big hill.
mov.i  < 13686, < 18225
nop.b  @    -9, {    14
spl.a  $     0, #    -4
spl.i  #    -3, <     1
mul.f  <    -4, *    -7
spl.i  #    -6, #    -6
mov.i  *    -3, <     0
spl.x  <    -3, $   -24
djn.x  {    -3, {     7
jmn.i  >   -18, <     2
cmp.ab @    -2, @   -15
mod.f  <   -14, }   -11
seq.i  <    -8, *     0
cmp.ab @   -13, @     3
cmp.ab @     1, @     2
mov.a  > 25537, #    -7
add.i  $     3, <     5
spl.ba <     0, <     0
end   0
