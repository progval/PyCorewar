;redcode-94 
;name Tim Tack
;author P.Kline
;assert CORESIZE == 8000
;strategy one-shot + scanner/dodger (depending)

wStep     equ    17
wDecoy    equ    (tWipe-2-(10*12*13)-3)
tGate     equ    (tSpl-13)

tPtr      dat    #250 ,#4501
          dat    0,0
          dat    0,0
          dat    0,0
tWipe     mov    tSpl     ,<tPtr
          mov    >tPtr    ,>tPtr
          jmn.f  tWipe    ,>tPtr
          mov    *tWipe   ,<tPtr
          
tScan     sub.f  #-13     ,tPtr
          jmn.f  tSelf    ,@tPtr
          jmz.f  tScan    ,*tPtr
pScan     mov.x  @tScan   ,@tScan
tSelf     slt.b  @tScan   ,#tEnd+4-tPtr
;;break
          djn    tWipe    ,@tScan
          djn    *pScan   ,#13
          jmp    *pScan   ,}tWipe
          dat    0,0
tSpl      spl    #0,{0
          dat    0,{0
          dat    0,0
tEnd      dat 0,0
      for 46
          dat 0,0
      rof
wIncr     dat    wStep   ,wStep-1
          dat 0,0
wStart    mov    <wDecoy+1,{wDecoy+3
          mov    <wDecoy+4,{wDecoy+6
          mov    {wDecoy+7,<wDecoy+9

wNext     add    wIncr   ,*tOff
wScan     sne    {tPtr   ,<tPtr
          add.x  wIncr   ,*tOff
          jmn.f  wTest   ,@tPtr
          jmz.f  wNext   ,*tPtr
tOff      mov.x  tPtr    ,*tOff
;;break
wTest     sne    @tPtr   ,<tPtr
          jmp    wNext

          jmn.f  tSelf   ,>tPtr
          mov    wIncr   ,>tPtr
          jmn.f  tSelf   ,@tPtr

cStart    mov    <btClisson,<tPtr
          djn    -1      ,#4
btClisson jmp    @tPtr   ,q1+4
          
q1        spl    #0  ,<q1-5
          mov    qb  ,>q1-5
qj        jmp    -1  ,{q1-5
qb        dat    {5335,11

          
          end    wStart
