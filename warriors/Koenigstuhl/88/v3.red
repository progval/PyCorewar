;redcode
;NAME      V3
;AUTHOR    Aleksey A. Baulin
;(skull@nedra.yaroslavl.su)
;STANDARD  CWS'88
;assert CORESIZE==8000

STEP     equ    (0-236)
STEP2    equ    (2*STEP)
DISTANCE equ    (788)

barrier  spl    0,              -1000
         spl    0
         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0

         dat    #0,             #0

         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0

         dat    #0,             #0

         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0

bomb1    dat    #0-DISTANCE,    #DISTANCE-2+1

         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0

         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0

t        mov    bomb1,          <m1+STEP2-DISTANCE+1
m1       add    #STEP2+1,       t
m2       mov    bomb2,          <t
         djn    t,              <barrier

         jmp    t,              <barrier

         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0

         dat    #0,             #0

         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0

         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0

         dat    #0,             #0

         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0
         dat    #0,             #0

bomb2    spl    0,              DISTANCE+1

         dat    #0,             #1

         end    m2
