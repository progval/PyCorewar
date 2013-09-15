;redcode-94
;name banzai0.2
;author Calvin Loh
;assert 1
       ORG      START
       DAT.F  #   100, #   100     
START  MOV.I  $    -1, >    -1     
       MUL.AB #     3, @    -2     
       JMP.B  $    -2, >    -3 
