;redcode-b verbose
;assert CORESIZE == 8000
;name redrace_h1_1
;author Dave Hillis <dbhillis@erols.com>
;strat -	Created using RedRace.c.
;strat -	An evolving population playing KOTH.
;strat -	Configured for the Beginner hill.
mov.i  $     5, $     5
spl.i  #    -1, {     1
mov.i  }    -2, }    -2
djn.i  $    -1, }    -3
djn.ba $     1, $     1
mov.i  }    -5, }    -5
mov.i  }    -6, }    -6
end   0
