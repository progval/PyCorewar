;redcode
;assert CORESIZE == 8000
;name redrace_x1_14 (imp)
;author Dave Hillis <dbhillis@erols.com>
;strat -	Created using RedRace.c.
;strat -	An evolving population playing KOTH.
;strat -	Configured for the Beginner hill.
mov.i  #     0, >     0
spl.ba >    -1, @     3
spl.ba $    -2, *    -2
spl.b  *    -3, #    -3
end   2