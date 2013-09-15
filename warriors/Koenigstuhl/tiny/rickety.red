;redcode-94x
;name rickety old redcode
;author Simon Wainwright
;strategy anti-oneshot, build a decoy and wait for it to be attacked,
;strategy retaliate with a reverse clear placed behind enemy lines!
;assert CORESIZE==800

decoy equ ( wait-62 )

wait      mov           @ps,              {seek
ps        sne       decoy+3,              {seek
          djn.f        wait,              {seek

copy      mov         <seek,              {seek
          djn          copy,                 #4

seek      djn.f       decoy,           #clear+1

          spl            #1,                  1
clearloop mov         clear,          <clearpos
clearpos  djn.f   clearloop,               {-10
clear     dat         >-160,                {-4

          end        wait+2
