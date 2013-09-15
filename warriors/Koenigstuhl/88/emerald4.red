;redcode
;name Emerald 4
;author Paul Kline
;contact pdk@admin.drake.edu
;group A
;strategy stone with djn stream + anti-vamp + clear/imp-gate
;strategy fixed a bug in Emerald 3 (gate? what gate?)
;strategy (boy - does that make a difference!)
;assert 1
spacing  equ 3044
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
hide0n   dat #inc-17+1594+351+33-69-512-128-467
hide0    jmp -1,<7848
hide1    spl 0,<-5
hide2    mov -61+88,<-20-800+100-28+512+128
hide3    sub @hide2,<hide2
hide4    dat <-6,#0
hide     dat #inc-17+1594+351+33-69-512-128
start    mov hide4,inc-17+1643+350-153+6-512-128+88
         mov hide3,<hide
         mov hide2,<hide
         mov hide1,<hide
         mov hide0,@hide0n
         mov <copyf,<copyt
         mov @copyf,<copyt2
         mov <copyf,<copyt
         mov @copyf,<copyt2
         mov <copyf,<copyt
         mov @copyf,<copyt2
         mov <copyf,<copyt
         mov @copyf,<copyt2
         mov <copyf,<copyt
         mov @copyf,<copyt2
         spl @copyt
         spl @copyt
         spl @hide
         mov #0,start
         mov #0,-7
         mov #0,-7
         mov #0,-7
         mov #0,-7
         mov #0,-7
         mov #0,hide
         dat #0
emerald  spl 0
stone    mov <stone-spacing+2,stone+spacing+2
         add inc,stone
cnt      djn stone,<inc-129
inc      dat #0-spacing,#spacing
copyf    dat #0
copyt    dat #copyf+1020
copyt2   dat #copyf+1020+12
         end start
