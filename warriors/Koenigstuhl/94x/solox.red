;redcode-94x
;name Solo X
;author Roy van Rijn
;assert 1

tPtr      dat    300,22594
tGate     dat    0,0

          dat    0,0

tWipe     mov    tSpl     ,<tPtr
          mov    >tPtr    ,>tPtr
          jmn.f  tWipe    ,>tPtr

tScan     sub.x  #-24     ,tPtr
          sne    *tPtr    ,@tPtr
          sub.x  *pScan   ,@tScan
          jmn.f  tSelf    ,@tPtr
          jmz.f  tScan    ,*tPtr
pScan     mov.x  @tScan   ,@tScan
tSelf     slt.b  @tScan   ,#tEnd+4-tPtr
          djn    tWipe    ,@tScan
          djn    *pScan   ,#14
tSpl      spl    #0       ,{0
tClr      mov    tEnd     ,>tGate
          djn.f  -1       ,{tGate
tEnd      dat    >1       ,2-tGate
end tScan

