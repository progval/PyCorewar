;redcode
;name C.L.R.
;author Christian Schmidt
;strategy clear
;assert 1

       ORG      START
       ADD.A  #     2, $     3
       SPL.B  #     0, $     0
       MOV.I  $     2, >    -6
START  DJN.F  $    -3, >    -7
       DAT.F  <     1, $    10
       END
