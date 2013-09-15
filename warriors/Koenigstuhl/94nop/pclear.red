;redcode-94
;name P-clear
;author P.Kline
;assert CORESIZE == 8000
;strategy pair of forward dat-wipers based on Guenzel's d-clear
;strategy outnumber stones and forward-wipe imps

paGate    equ    Pair-7

slPair    mov    #-3950,paGate+1300-7  ; initialize wipe pointers
          mov    #-3950,paGate+5302-7
          spl    1                     ; use multiple processes
          spl    1
          mov    -1,0
          mov    <paBoot1,{paBoot1     ; boot 'em up
          mov    <paBoot2,{paBoot2
paBoot1   spl    Pair+1300,Pair+7
paBoot2   jmp    Pair+5302,Pair+7

Pair      spl    #0     ,<paGate-2667
          mov    paBomb ,{paGate       ; slow backward clear for redundancy
          mov    paBomb ,>paGate       ; fast forward clear
          djn.f  -1     ,>paGate
          dat    0,0
paBomb    dat    0,15

          end    slPair

