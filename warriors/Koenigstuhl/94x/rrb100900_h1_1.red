;redcode-x verbose
;assert CORESIZE == 55440
;name RedRace B (10/09/00) h1_1
;author Dave Hillis
; <dbhillis@erols.com>
;strat -   Created using RedRace.c.
;strat -   An evolving population playing KOTH.
;strat -   Configured for the big hill.
add.f  #  4343, {     5
spl.i  #     0, *     3
mov.i  # 26870, $ 26870
spl.f  @    -2, >    -4
mov.i  $    -2, {     4
djn.i  <    -2, <    -4
mul.a  *    -8, $    -1
add.x  < 15433, #     1
mov.i  <  3277, > 24674
mod.b  @    -8, >     9
add.i  >    -9, #    -6
jmn.x  }    -2, {   -10
cmp.ba < 16032, *    -6
jmp.b  @    -7, >   -22
mov.f  $     0, @   -26
mul.f  @   -11, #     0
mov.x  {     0, @   -13
add.i  >  8279, #     0
mov.i  * 24227, # 18372
end   0
