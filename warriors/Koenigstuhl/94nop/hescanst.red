;redcode-94
;name HeScans T
;author P.Kline
;assert CORESIZE == 8000

tPtr      dat    100 ,4100-4             ; widely-spaced pointers
          dat    0,0
          dat    0,0
          dat    0,0
          dat    0,0
tWipe     mov    tSpl     ,<tPtr         ; positive wipe of opponent
          mov    >tPtr    ,>tPtr
          jmn.f  tWipe    ,>tPtr
          mov    *tWipe   ,<tPtr
          
tScan     sub.x  #-12     ,tPtr          ; increment and look
          sne    *tPtr    ,@tPtr
          sub.f  *pScan   ,@tScan        ; increment and look
          jmn.f  tSelf    ,@tPtr
          jmz.f  tScan    ,*tPtr
pScan     mov.x  @tScan   ,@tScan        ; swap pointers for attack
tSelf     slt.b  @tScan   ,#tSpl+4-tPtr  ; self-check
          djn    tWipe    ,@tScan        ;   go to attack
          djn    *pScan   ,#15           ; after 13 self-scans
          jmp    *pScan   ,}tWipe        ;   switch to dat-wiping
tSpl      spl    #0,{0
          dat    0,{0
          
          end    tScan+1

