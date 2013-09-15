;redcode-b verbose
;assert CORESIZE == 8000
;name redrace_h2_2
;author Dave Hillis <dbhillis@erols.com>
;strat -	Created using RedRace.c.
;strat -	An evolving population playing KOTH.
;strat -	Configured for the Beginner hill.
spl.ba #     2, }     3
spl.b  #    -1, #    -1
spl.ba #    -2, }    -2
spl.b  #    -3, <    -3
mov.i  *    -4, <    -4
mov.i  *    -5, <    -5
mov.i  *    -6, <    -6
mov.i  *    -5, <    -7
end   0
