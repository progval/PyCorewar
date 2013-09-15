;redcode-94x
;name Tiny Uninvited
;author John Metcalf
;strategy stone
;assert CORESIZE==800

uStp equ 507 ; 287 ; 553
uTim equ 121 ; 111 ; 108

     spl   #0,       #0
uLp: mov   uBmb,     @uPtr
uHit:sub.x #uStp*2,  @uLp
uPtr:mov   {475,     }uHit+2*uStp*uTim
     djn.f @uHit,    }uPtr
uBmb:dat   <uStp,    >1

