;redcode-imt2
;name R-clear
;author Ken Espiritu
;strategy clear
;strategy one pass 1.5c clear -> multiple clear streams/gate
;score:249.581253 age:7
;assert 1

       ORG      START
START  SPL.B  #     0, <     0     
       MOV.I  <    -1, <    -1     
       MOV.I  <    -2, <    -2     
       DJN.I  $    -3, <    -3     

