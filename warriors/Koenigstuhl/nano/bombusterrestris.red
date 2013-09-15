;redcode-nano
;name Bombus Terrestris
;author S.Fernandes
;strategy spl mov mov mov djn
;assert CORESIZE==80

START  SPL.B  #    29, }   -10
       MOV.I  >    18, }    -1
       MOV.I  #    11, }    -2
       MOV.I  }   -25, }    -3
       DJN.F  $    -3, }    -4
       END

