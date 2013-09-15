;redcode
;name I.M.P.
;author Christian Schmidt
;strategy Imp
;assert 1

       ORG      START
       MOV.I  #    70, $     1
       SPL.B  *    -1, <    -9
       ADD.A  #    70, $    -2
START  MOV.I  $    -3, *    -3
       DJN.F  $    -3, <   -10
       END
