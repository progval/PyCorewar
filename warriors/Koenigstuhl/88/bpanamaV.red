;redcode verbose
;name B-Panama V
;author Steven Morrell
;strategy  Let's see if we can pick on some imps...
;strategy  Version 5- complete overhaul of stone and paper.
;assert 1

stone     spl 0,<-50
          spl 0,<-51
          mov <3359,-3359
          add 2,-1
          djn -2,<-54
          dat <3359,<-3359

boot      mov stone+5,-200+5
          mov stone+4,<boot
          mov stone+3,<boot
          mov stone+2,<boot
          mov stone+1,<boot
          spl boot-200
          mov stone,<boot

a         spl 1
          mov 1,0
          spl 1
          mov #6,0
          mov <-1,<1
          spl @0,-3365
          mov 2,<-1
          jmz -4,-4
          dat <2667,<5334

          for MAXLENGTH-CURLINE-1
          dat <last,<2667
          rof

last      dat <last, <2667

end boot
