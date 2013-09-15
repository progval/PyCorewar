       ORG      START
       ADD.F  $    18, @     4     
START  SNE.F  $  3631, $  3260     
       ADD.F  $    16, $    -1     
       JMN.F  $     3, @    -2     
       JMZ.F  *     9, *    -3     
       MOV.X  @    -1, $    -4     
       MOV.B  @    -2, @     4     
       SLT.AB #    19, @     3     
       JMN.B  *     5, @    -4     
       MOV.I  $    10, >   -10     
       MOV.I  *    -1, >   -11     
       JMN.F  $    -2, @   -12     
       JMN.B  $   -12, @    -8     
       JMP.B  $   -13, }    -4     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  #  3629, #  3629     
       SPL.B  #     0, {     0     

