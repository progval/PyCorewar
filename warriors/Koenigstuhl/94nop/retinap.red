;redcode-94
;name retinA (paper)
;author P.Kline
;assert CORESIZE == 8000
;strategy paper with retinA

space     equ     1501
start     spl     1
          mov     -1,0
          spl     1
          spl     @0,#space
          mov.i   }-1,>-1
          mov.i   {-2,<1
          spl     @0,>space*11
          spl     -4
retinA    mov.i   #-space*7,}space*4-7
          end    start
