;redcode-94 test
;name SnowDust
;author P.Kline
;assert CORESIZE == 8000
;strategy 1. 80% coarse scan for startup code
;strategy 2. bomb all known boot distances
;strategy 3. dclear to kill any remaining imps and spl's
;strategy 4. not unlike netting fish in a barrel :)

pStep     equ    56
                                         ; all known boot distances
          dat    pScan+3346,pScan+5328   ; impish
          dat    pScan+2417,pScan+5704   ; sandstorm
          dat    pScan+4083,pScan+4330   ; probe   / torch
          dat    pScan+2534,pScan+91     ; gigolo  / tornado
          dat    pScan+3370,pScan+5279   ; gigolo
          dat    pScan-26  ,pScan+2521   ; 976     /  cia
          dat    pScan+8   ,pScan+1      ; 976
pTable    dat    pScan+2244,pScan+6792   ; blue candle

pKill     mov    200,2                   ; effective bomb given known locations

pNext     add    pIncr    ,@pSptr        ; coarse scan for boot code
pScan     seq    100+pStep,100
          sne.a  #2667    ,@pScan        ; ignore imps
pSptr     add    pIncr    ,pScan
          seq    *pScan   ,@pScan
          sne    {pScan   ,<pScan        ; ignore single dats
pCnt      djn    pNext    ,#7850/(4*pStep)
          
          mov    pKill    ,*pScan
          ;-break
          sub    #pStep+16 ,@pSptr       ; backtrack to 1st instruction
          add    #8       ,@pSptr
          jmz.f  -1       ,@pScan
          jmn.f  #0       ,<pScan
          spl    pZap2
          
pZap1     add.ba @pSptr   ,@1            ; zap known boot distances
          mov    pKill    ,*pTable
          jmn.f  pZap1   ,<-1
          jmp    pIncr
          
pZap2     add.b  @pSptr   ,@1            ; zap known boot distances
          mov    pKill    ,@pTable
          jmn.f  pZap2   ,<-1
          jmp    pIncr
      for 61
          dat    0        ,0
      rof
pGate     dat    0        ,-101
          dat    0        ,0
          dat    0        ,0
pIncr     spl    #2*pStep ,#2*pStep      ; wipe core for remaining processes
          mov    pClr     ,>pGate
          mov    pClr     ,>pGate
          djn.f  -1       ,>pGate
pClr      dat    <5335    ,2-pGate
          end    pScan
