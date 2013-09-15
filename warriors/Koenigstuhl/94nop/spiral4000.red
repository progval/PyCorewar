;redcode-94m
;name Spiral 4000
;author P.Kline
;strategy two 1143-spirals mirroring each other at distance 4000
;strategy cannot be spiral wiped
;assert CORESIZE==8000

impnum    equ     1143

launch    spl     1
          spl     1
          mov     imp,<imp+4000+2
          spl     1
          spl     1
          spl     1
          
s1        spl     *v1,}0
          jmp     @v1,}0
v1        dat     imp-(v1/2)*impnum     ,imp-(v1/2)*impnum-1
v2        dat     imp+4000-(v2/2)*impnum,imp+4000-(v2/2)*impnum-1
      for 15
          dat     imp-(v1/2)*impnum     ,imp-(v1/2)*impnum-1
          dat     imp+4000-(v2/2)*impnum,imp+4000-(v2/2)*impnum-1
      rof
imp       mov.i   #impnum+4000,*0
          end     launch
