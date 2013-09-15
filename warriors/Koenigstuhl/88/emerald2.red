;redcode
;name Emerald 2
;author P.Kline
;strategy stone with djn stream
;strategy attempting a gate
;strategy new anti-pittrap code
;assert 1
spacing  equ 2365
hide1    spl 0,<-6
hide2    mov 49,<-20
hide3    sub @hide2,<hide2     ; hide2 + hide3 kill pit-trappers
hide4    dat <-7,#0            ; hide4 + hide1 will eventually make an imp-gate
hide     dat #inc-17+1594+351
start    mov hide4,inc-17+1643+350
         mov hide3,@hide       ; put outrigger in a hole in the bombing pattern
         mov hide2,<hide
         mov hide1,<hide
         mov inc+0,inc+1020
hideb    mov inc+1,inc+1020+1  ; move stone away from decoy
         mov inc+2,inc+1020+2
         mov inc+3,inc+1020+3
         mov inc+4,inc+1020+4
         spl @hideb
         spl @hideb
         spl @hide
         mov #0,-7             ; erase pointers to stone
         mov #0,-7             ; (needs work, I know)
         mov #0,-7
         mov #0,-7
         mov #0,-7
inc      dat #0-spacing,#spacing
emerald  spl 0
stone    mov <cnt-spacing-2,cnt+spacing
         add inc,stone
cnt      djn stone,<inc-129
         end start
