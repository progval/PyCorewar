;redcode-94x
;assert CORESIZE == 800
;name Imp .X-ing
;author Dave Hillis
;strat -   Created using RedRace.c.
;strat -   An evolved warrior that should do well against one-shots,
;strat -   but gets creamed by papers and scanners.
;strat -   It starts with a fast attack that's a bit like a D-clear
;strat -   bombing with imps (sort of). The mov.x on line 2 really
;strat -   does want to be a .x instead of a .i. And the lines which
;strat -   look like random garbage actually serve a purpose.
;strat -   For the curious, look at it with the pmars debugger:
;strat -   run it by itself, run it against a warrior with one process,
;strat -   run it against a warrior with a lot of processes.
; born on 1038
spl.ba #  -372, <  -135
mov.i  #    -4, {     4
mov.x  {     3, {     3
djn.x  $    -1, {     3
spl.ab >   191, >     5
mov.i  $  -245, {  -120
spl.f  <    -2, <    -6
spl.f  >   -47, *  -280
spl.i  @    69, }   234
spl.i  #    69, {   249
spl.i  <   218, }     3
spl.f  >  -273, >   -63
mov.i  $   304, }  -228
spl.i  <   -45, $   -64
spl.x  >   -50, $   103
spl.f  >  -160, *  -271
spl.f  }  -273, >  -238
spl.f  >  -255, #  -218
mov.i  >  -163, >  -252
mov.i  >  -163, >  -242
end   0
