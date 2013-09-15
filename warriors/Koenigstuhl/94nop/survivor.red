;redcode-94
;name The Survivor
;author Philip Kendall
;strategy Paper-launched imp
;assert CORESIZE==8000

for 0

BDECWT round 4: opponent John K Lewis

Sorry, no real time to code a warrior this week; this is just Die Hard
without the bombing. Credit to Paul Kline...

Well, the theory here is just to let those two highly offensive stones blast
each other (and hopefully whatever JKL puts up) out of existence, and just
sit around, don't ever die, and pick up lots of points. The only problem I
can see here is that I can't find anything which consistently scores higher
than Die Hard in this environment, so if JKL comes up with one as well, it
will most probably be a tie :-(

rof

space   equ     (-40*127)
istep   equ     2667

start   spl.a   1
        mov.i   -1,0
        spl.a   1

diehard spl.a   @0,space
        mov.i   }diehard,>diehard
        spl.a   #0
        spl.a   imp+(2*istep)
        spl.a   imp+istep
imp     mov.i   #istep,*0

        end     start
