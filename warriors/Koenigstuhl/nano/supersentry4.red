;redcode-nano
;name SuperSentryIV
;author J.J. 'Imrahil' Wingert
; Surprising 2nd place on the nanohill of SAL (14.11.05)
; Thanks to S.Fernandes who gave me good advice during the creation
;strategy Scans for any value not 0,0 and bombs it
;assert (CORESIZE==80) && (MAXPROCESSES==80)
;       (MAXCYCLES==800) && (MAXLENGTH==5)
;assert (MINDISTANCE==5)

           org    scanner
somewhere  equ    40
scanstep   equ    -5
scanstart  equ    -7
nextscan   add    #scanstep,scanner
scanner    jmz.f  nextscan, scanstart
           mov    bomb,>scanner
           jmp    scanner, <somewhere
bomb       mov.i  #0,-1
           end

