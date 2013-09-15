;redcode-lp
;name From Beyond the Core
;author John Metcalf
;strategy 6 line 0.5c scanner
;assert CORESIZE==8000 && MAXPROCESSES==8

     step  equ 1671 ; familiar constants!
     time  equ 2230

jBmb:djn.f #1,       1
sPtr:add   #step,    #2-step*time
scan:jmz.f sPtr,     @sPtr
     slt   sPtr,     #5
     mov   >bPtr,    @sPtr
bPtr:djn   sPtr,     #jBmb
     end   scan
