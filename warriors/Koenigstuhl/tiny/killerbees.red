;redcode-94x
;name Killer Bees
;author David Moore
;assert CORESIZE==800 && MAXLENGTH==20
;MAXCYCLES==8000 && MAXPROCESSES==800
;strategy paper

d1 equ 400
d2 equ 305 ; d2 and d3 were suggested by a computer optimizer
d3 equ 350

start  mov >159, 369 ; there's always a chance...
       mov }253, 608
       mov >557, 293
       mov }652, 767

paper  spl   1, >59
       mov.i 1, #0
       spl   1, {457

       mov <1, {1
       spl d1+6, 7

       spl @0, <d2
       mov }-1, >-1
       mov   3, >-2
       mov {-3, {1
       jmz.a d3, *0
       dat 1, 1

end start
