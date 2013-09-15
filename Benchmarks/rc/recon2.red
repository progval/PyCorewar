       ORG      START
       DAT.F  $    19, $    19     
       SPL.B  #  1443, #  1443     
       MOV.I  $    -1, >    -4     
       MOV.I  *    -1, >    -5     
       DJN.A  $    -2, $     7     
       SUB.F  $    -4, @     3     
START  SNE.I  $ -2887, $ -2893     
       SUB.F  $    -6, $    -1     
       SEQ.I  *    -2, @    -2     
       SLT.A  #    20, $    -3     
       DJN.B  $    -5, # -3200     
       SUB.BA #     0, #    -7     
       MOV.AB @    -4, @   -10     
       JMN.B  *   -10, $    -3     
       DJN.A  <    -2, {    -1     

