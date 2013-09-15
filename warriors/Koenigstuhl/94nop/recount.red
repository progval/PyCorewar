;redcode-94
;name Recount
;kill Recount
;author P.Kline
;assert CORESIZE == 8000
;strategy semi-intel scanner/bomber, dclear, sometimes an imp
;strategy reacts differently against scanners and bomber/imps
;strategy uses imp safeguard against nPaper
 
rStep     equ     1010
rGate     equ     (rWipe-15)
 
rClr      dat     <5335     ,rBomb+10-rGate
          dat     0         ,0
          dat     0         ,0
raid      add     #rStep*2  ,rMove
          mov     rBomb     ,@rMove
rMove     jmz.f   raid      ,*rBomb
          sub     #rStep    ,@raid
          djn     raid      ,#12
 
rWipe     spl     #0        ,0
          mov     rClr      ,>rGate
          djn.f   -1        ,>rGate
rBomb     mov.i   #rStep    ,1
 
          end     raid+1

