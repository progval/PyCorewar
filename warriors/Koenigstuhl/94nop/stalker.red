;redcode-94nop
;name Stalker
;author P.Kline
;assert CORESIZE == 8000
;strategy .66c scanner with Zoom's speed trick and djn-stream

vStep     equ    (2608)
vGate     equ    (vPtr-3)

vPtr      mov    }vFlag   ,>6000        ; } resets 5-line scan to 4-line
          mov    vIncr    ,>vPtr
vNext     add    vIncr    ,vScan        ; standard 3-line .66c scan
vScan     sne    vStep    ,vStep+8      ;
vFlag     djn.f  vNext    ,<vScan+1215  ; djn-stream - back at last!

vSet      mov.ab vScan    ,vPtr         ; set pointer to begin carpet
          jmn    {vFlag   ,vPtr         ; { turns 3-line scan into 4-line
vIncr     spl    #vStep   ,#vStep
          mov    vClr     ,>vGate       ; dclear to finish
          djn.f  -1       ,>vGate
vClr      dat    >5335    ,2-vGate
          end    vScan
          
