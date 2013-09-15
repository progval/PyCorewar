;redcode
;name      Hydra
;author    Stephen Linhart
;strategy  14 regenerative dat bombers
;strategy  2 regenerative spl bomber
;strategy  sync at start
;strategy  safer start
;assert 1
 
          dat    #0,    #0
          dat    #0,    #0
          dat    #0,    #0
          dat    #0,    #0
          dat    #0,    #0
 
d         mov    -1,   <-3
 
a         spl     0,   <-2
b         mov    -3,   <-3
c         djn    -2,   <-4
 
start     spl    40,  <600
          spl    20, <1100
          spl    10, <1600
          spl     5, <2100
          mov     c,    <3
          mov     b,    <2
          mov     a,    <1
          jmp    @0, #7500
          mov     c,    <3
          mov     b,    <2
          mov     a,    <1
          jmp    @0, #7000
          spl     5, <2600
          mov     c,    <3
          mov     b,    <2
          mov     a,    <1
          jmp    @0,  #-50
          mov     c,    <3
          mov     b,    <2
          mov     a,    <1
          jmp    @0, #6500
          spl    10, <3100
          spl     5, <3600
          mov     c,    <3
          mov     b,    <2
          mov     a,    <1
          jmp    @0, #6000
          mov     c,    <3
          mov     b,    <2
          mov     a,    <1
          jmp    @0, #5500
          spl     5, <4100
          mov     c,    <3
          mov     b,    <2
          mov     a,    <1
          jmp    @0, #5000
          mov     c,    <3
          mov     b,    <2
          mov     a,    <1
          jmp    @0, #4500
          spl    20, <4600
          spl    10, <5100
          spl     5, <5600
          mov     c,    <3
          mov     b,    <2
          mov     a,    <1
          jmp    @0, #4000
          mov     c,    <3
          mov     b,    <2
          mov     a,    <1
          jmp    @0, #3500
          spl     5, <6100
          mov     c,    <3
          mov     b,    <2
          mov     a,    <1
          jmp    @0, #3000
          mov     c,    <3
          mov     b,    <2
          mov     a,    <1
          jmp    @0, #2500
          spl    10, <6600
          spl     5, <7100
          mov     c,    <3
          mov     b,    <2
          mov     a,    <1
          jmp    @0, #2000
          mov     c,    <3
          mov     d,    <2
          mov     a,    <1
          jmp    @0, #1600
          spl     5, <7600
          mov     c,    <3
          mov     d,    <2
          mov     a,    <1
          jmp    @0, #1100
          mov     c,    <3
          mov     b,    <2
          mov     a,    <1
          jmp    @0,  #500
 
          dat    #0,    #0
          dat    #0,    #0
          dat    #0,    #0
          dat    #0,    #0
          dat    #0,    #0
          dat    #0,    #0
          dat    #0,    #0
          dat    #0,    #0
          dat    #0,    #0
          dat    #0,    #0
          dat    #0,    #0
          dat    #0,    #0
 
          end start
