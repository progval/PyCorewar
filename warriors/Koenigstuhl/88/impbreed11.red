;redcode
;name ImpBreed 1.1
;author Jonathan Roy
;strategy A glorified imp. Breeds a special type of ImpLance.
;strategy 1.1: Although sucessful on the -x hill, it died horribly on
;strategy      the normal hill. This tries to breed SuperImps instead
;strategy      of ImpLances.
;assert CORESIZE==8000
start SPL 2
      JMP -1
      MOV 2,4002
      SPL 4001
      MOV 0,4001
      END

