;redcode-nano
;name nano nano mork calling orson
;author Simon Wainwright
;strategy stone with clear
;assert CORESIZE==80

          stonestep     equ                  44

stoneinc  spl   #-stonestep,         <stonestep
stoneloop mov   <-stonestep,        stonestep+2
          add      stoneinc,          stoneloop
          mov             2,<stoneinc+stonestep
          djn.f   stoneloop,        <stoneinc-8
          end
