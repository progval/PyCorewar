;redcode
;name FireHouse
;author P.Kline
;strategy multiple spl-carpeting, spiral-hunting scanners
;assert (CORESIZE==55440) || (CORESIZE==8000)

      for (CORESIZE==55440)
vCore     equ    55440
vCopies   equ    6
      rof

      for (CORESIZE==8000)
vCore     equ    8000
vCopies   equ    4
      rof
      
vSpace    equ    (vCore/vCopies)
vStep     equ    13

vPtr      jmp    vScan    ,vIncr+3
          dat    0        ,0
          dat    0        ,0
       
vAttack   mov.ba vPtr     ,vPtr
          mov    #vPtr-vSpiral  ,vSpiral
          add.b  vPtr     ,vSpiral
vSpiral   mov.x  @0       ,@0            ; extract spiral increment
          mov.b  @vSpiral ,vSpiral
          
vWipe     mov    vSpl     ,<vPtr         ; positive wipe
          mov    >vPtr    ,>vPtr
          jmn.f  vWipe    ,>vPtr
          
          add.ba vSpiral  ,vPtr          ; try spiral search
          jmz.f  vMod     ,*vPtr
          mov.ab vPtr     ,vPtr
          slt    vPtr     ,#vEnd-vPtr
          jmn.f  vWipe    ,@vPtr
vMod      mod    #vSpace-10,vPtr
          
vNext     add    #vStep   ,vPtr          ; f-scan
vScan     jmz.f  vNext    ,@vPtr
          mod    #vSpace-10,vPtr         ; confine search space
vSelf     slt    vPtr     ,#vEnd+5-vPtr
vGate     jmz.f  vAttack  ,vPtr+1 
          djn    vNext    ,#9            ; count self-scans
        
          spl    #0       ,#0
vSpl      spl    #0       ,#0
          mov    vClr     ,<-2           ; reverse-wipe to overcome self-stuns
          mov    vClr     ,>vGate        ; forward-wipe to win
          mov    vClr     ,>vGate  
          djn.f  -2       ,>vGate
vClr      dat    0        ,2-vGate
          dat    0,0
          dat    0,0
vEnd      dat    0,0
      for 30
          dat    0,0
      rof
vStart    mov    <vBoot   ,{vBoot
     for (vClr-vPtr)
          mov    <vBoot   ,{vBoot
     rof
vBoot     spl    vClr+1+vSpace ,vClr+1   ; boot all but one copy
          add    vIncr    ,vBoot
          djn    vStart   ,#vCopies-1
          jmp    vScan    ,100
vIncr     dat    vSpace+(vClr+1-vPtr),vClr+1-vPtr

          end    vStart
