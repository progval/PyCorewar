;redcode-94m
;name test Sp
;author P.Kline
;assert CORESIZE == 8000
;strategy kill paper-imps on the multiwarrior hill
;strategy - spiral and forward spl/dat wipes in one loop
;strategy - two 8-process 3-point imps

swGate    dat    swWipe  ,100
swPtr     dat    swWipe  ,swTail
swDat     dat    #swDat-swGate ,swLoop-swGate+1
          dat    #swDat-swGate ,swEnd-swGate
swWipe    spl    #swDat-swPtr  ,swEnd-swGate  ; spiral and forward wipers
          mov    *swGate ,>swGate
          add.ab #381    ,swPtr
          mov    *swGate ,@swPtr
          mov    *swGate ,>swGate
swLoop    djn.f  -4      ,>swGate
          dat    1000,1000
swEnd     dat    1000,1000
      for 18
          dat    1000,1000
      rof
impSpc    equ    776
Imps      dat    imp1-(Imps*2667),imp1-(Imps*2667)+impSpc
      for 7
          dat    imp1-(Imps*2667),imp1-(Imps*2667)+impSpc
      rof
slImps    mov    imp1,imp1+impSpc
          spl    1
          spl    swWipe
          spl    1
          spl    1
          spl    *Imps,}0
          spl    @Imps,}0
          jmp    swWipe
imp1      mov.i  #0,2667
      for 20
          dat    1000,1000
      rof
swTail    dat    0,0
         end   slImps

