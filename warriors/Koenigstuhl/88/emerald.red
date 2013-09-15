;redcode
;name Emerald
;author P.Kline
;strategy stone with djn stream
;strategy attempting a gate
;assert 1
spacing  equ 2365
hide1    spl 0,<-6
hide2    mov 49,<-20
hide3    dat <-7,<-8
hide     dat #inc+1037-130+1020
start    mov hide3,inc+1037+48-130+1020
         mov hide2,<hide       ; create the one-dwarf->gate code
         mov hide1,<hide
         mov inc+0,inc+1020    ; move stone far away from decoy
hideb    mov inc+1,inc+1020+1
         mov inc+2,inc+1020+2
         mov inc+3,inc+1020+3
         mov inc+4,inc+1020+4
         spl @hide
         spl @hideb
         mov #0,-7             ; don't leave any pointers to stone
         mov #0,-7
         mov #0,-7
         mov #0,-7
         mov #0,-7
inc      dat #0-spacing,#spacing
emerald  spl 0
stone    mov <cnt-spacing-2,cnt+spacing
         add inc,stone
cnt      djn stone,<inc-129
         end start
