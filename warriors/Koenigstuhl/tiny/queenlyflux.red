;redcode-94x
;name Queenly Flux
;author John Metcalf
;strategy p-space stone/paper
;strategy for IRC Mini Tour #02
;assert CORESIZE==800

       ORG      START
       SPL.B  #   108, <  -108     
       MOV.I  <  -216, {   216     
       ADD.X  $    -2, $     0     
       DJN.F  $    -2, <  -338     
START  NOP.F  <    -2, }     8     
       NOP.F  }     8, }    10     
       NOP.F  {    11, <    11     
       MOV.I  >    11, <   100     
       LDP.B  }  -246, $  -246     
       LDP.AB $  -247, @  -247     
       STP.A  @  -248, <  -247     
       JMN.B  $   -11, @  -248     
       SPL.B  $     0, {  -318     
       SPL.B  $     0, >  -341     
       MOV.I  {     2, <     2     
       DJN.F  @     0, <   -60     
       SPL.B  @     4, {    64     
       MOV.I  }     0, >     0     
       MOV.I  {    -2, {     0     
       DJN.F  $  -355, {   355     
       END

