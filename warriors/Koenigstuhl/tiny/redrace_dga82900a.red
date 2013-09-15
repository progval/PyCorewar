;redcode-x verbose
;assert CORESIZE == 800
;name RedRace Distributed GA (8/29/00 A)
;author Dave Hillis
; <dbhillis@erols.com>
;strat -   Created using RedRace.c.
;strat -   An evolving population playing KOTH.
;strat -   Configured for the tiny (Baby) hill.
;from top of local hill
mov.i  $   101, <     2
nop.i  >   -90, <   -23
spl.i  #  -363, }    18
mov.i  @    -1, }    -2
djn.i  $    -1, }    -3
cmp.a  }  -267, *    -1
mov.i  @   101, }     2
mov.i  >   216, $    71
dat.i  >   -81, $    70
mov.i  @  -212, {    -7
djn.i  $   320, {   395
nop.a  @    10, >   -10
sne.i  {   -12, >   -11
dat.i  >  -380, $    70
mov.i  @   -12, <   -15
seq.i  @  -260, *    -1
sub.i  @  -329, *   -14
end   1
