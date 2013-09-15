;name archangel
;author John K. Lewis
;stategy Unlikely bedfellows, RotLD TNG & P-clear
;assert 1

        _RES    equ 0           ;here pmars loads results

res     ldp.ab  _RES , #0      ;load result last match
        sne.ab  #1   , res
        jmp PCLEAR
        jmn.b  ZIZZOR, res

DIE    SPL.B  $     1, > -2002
       SPL.B  $     1, > -2001
       SPL.B  $     1, > -2000
       MOV.I  <     1, {     1
       SPL.B  $  3869, $     9
       SPL.B  @     0, $  2924
       MOV.I  }    -1, >    -1
       SPL.B  #     0, }    56
       MOV.I  $    55, }  2979
       ADD.A  #   119, $  2978
       SPL.B  $ -2664, }  2977
       SPL.B  $  2668, }  2976
       MOV.I  #  2667, *     0

PCLEAR MOV.AB # -3950, $  1295
       MOV.AB # -3950, $ -2704
       SPL.B  $     1, $     0
       SPL.B  $     1, $     0
       MOV.I  $    -1, $     0
       MOV.I  <     2, {     2
       MOV.I  <     2, {     2
       SPL.B  $  1302, $     9
       JMP.B  $ -2697, $     8
       SPL.B  #     0, < -2674
       MOV.I  $     4, {    -8
       MOV.I  $     3, >    -9
       DJN.F  $    -1, >   -10
       DAT.F  $     0, $     0
       DAT.F  $     0, $    15

ZIZZOR ADD.AB #     8, #    59
       JMZ.F  $    -1, @    -1
       MOV.I  $     2, >    -2
       JMZ.B  $    -2, $   res
       SPL.B  #     7, $    10
       MOV.I  *    -5, >    -5
       DJN.F  $    -1, <   -16
       DAT.F  < -2666, <  2667
       SPL.B  #     4, $    10


