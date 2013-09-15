;redcode-nano
;name Bombus Pratorum
;author S.Fernandes
;strategy spl mov mov mov djn
;assert CORESIZE==80

       ORG      START
START  SPL.B  #   -22, }    11
       MOV.I  >   -44, {   -11
       MOV.I  {    -2, >    -2
       MOV.I  >    -3, {    -3
       DJN.F  $    -3, {    -4
       END

