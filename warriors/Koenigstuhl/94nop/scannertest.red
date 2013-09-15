;redcode-94nop
;name scanner test
;author P.Kline
;assert CORESIZE==8000

aStep     equ    (2667+4)

aPtr
aWipe     mov    aJmp     ,1000     ; drop spl-jmp bomb
          mov    aSpl     ,<aPtr
          add    #2668-aStep ,aPtr  ; reset for 2667 increment

aNext     add    #aStep   ,aPtr     ; f-scan
aScan     jmz.f  aNext    ,@aPtr
          slt.ab #aEnd+3-aPtr,aPtr  ; check for self
aCount    djn    aNext    ,#15      ; count self-scans
          jmn    aWipe    ,aCount   ;
aSpl      spl    #0       ,#0       ; dat-wipe to finish
          mov    aEnd     ,<-1
aJmp      djn    -1       ,0

aEnd      dat    0,0
          end    aScan
