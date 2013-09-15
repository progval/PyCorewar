       ORG      START
       DAT.F  $   100, $ -3904     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       MOV.I  $    12, <    -7     
       MOV.I  >    -8, >    -8     
       JMN.F  $    -2, >    -9     
START  SUB.X  #   -14, $   -10     
       SNE.X  *   -11, >   -11     
       SUB.X  *     3, @    -2     
       JMN.F  $     3, <   -13     
       JMZ.F  $    -4, *   -14     
       MOV.X  @    -5, @    -5     
       SLT.B  @    -6, #    26     
       DJN.B  $   -10, @    -7     
       DJN.B  *    -3, #    10     
       SPL.B  #     0, }     0     
       MOV.I  $     2, >    -4     
       DJN.F  $    -1, {    -5     
       DAT.F  >     1, $     8     

