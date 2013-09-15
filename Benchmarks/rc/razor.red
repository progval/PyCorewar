       ORG      START
       DAT.F  $ -3900, $   150     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       SPL.B  #     1, }     1     
       MOV.I  $    -1, <    -5     
       MOV.I  >    -6, >    -6     
       JMN.F  $    -2, >    -7     
START  SUB.X  #   -11, $    -8     
       SNE.I  {    -9, <    -9     
       JMZ.F  $    -2, <   -10     
       SNE.I  $    -8, >   -11     
       MOV.X  @    -4, @    -4     
       SLT.B  @    -5, #    19     
       DJN.F  $    -9, @    -6     
       DJN.B  $    -7, #    13     
       JMP.B  $    -8, {   -11     

