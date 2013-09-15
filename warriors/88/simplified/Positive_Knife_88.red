;redcode
;name Positive Knife '88
;author Ken Espiritu
;assert 1

       SPL    $     0, < -3490     
       SPL    $ -2508, $   695     
       ADD    #  2667, $    -1     
       DJN    @    -2, < -3493     
       MOV    $     0, $  2667     
       SPL    $     0, <  -983     
       MOV    $  1339, $  1339     
       ADD    #  1339, $    -1     
       DJN    $    -2, <  -986     
       DAT    <  2667, <     0     
       DAT    <   -46, <    46     
       DAT    #     0, #  2400     
       DAT    #     0, #  1000     
       DAT    #     0, #   400     
START  CMP    $   300, $   200     
       JMP    $    33, <   203     
       CMP    $  1298, $  1198     
       JMP    $    30, <  1201     
       CMP    $  2696, $  2596     
       DJN    $    28, #    -7     
       CMP    $  1694, $  1594     
       JMP    $    25, <  1597     
       CMP    $  3092, $  2992     
       JMP    $    23, <    -4     
       CMP    $  2290, $  2190     
       DJN    $    21, #   -12     
       CMP    $   688, $   588     
       JMP    $    19, <    20     
       CMP    $  1886, $  1786     
       JMP    $    16, <  1789     
       CMP    $  3284, $  3184     
       JMP    $    14, <   -12     
       CMP    $  2482, $  2382     
       JMP    $    12, <    -8     
       CMP    $  2080, $  1980     
       DJN    $    10, #   -21     
       CMP    $   878, $   778     
       JMP    <    10, <   781     
       CMP    $  1476, $  1376     
       JMP    <     8, <   -14     
       CMP    $  1074, $   974     
       JMP    <     6, <    -6     
       CMP    $  3472, $  3372     
       SLT    <    -8, <   -24     
       JMZ    $    10, $  1880     
       ADD    @   -10, @   -20     
       ADD    @   -21, $     5     
       ADD    @   -28, @    -1     
       JMN    $     2, @     3     
       ADD    #   100, $     2     
       MOV    $   -40, @     1     
       MOV    $   -41, <   163     
       SUB    #     7, @    -2     
       DJN    $    -3, #     9     
       MOV    <     2, $  2167     
       MOV    <     2, $ -1303     
       SPL    $     1, $   -46     
       SPL    $     1, $   -52     
       MOV    <    -2, <     2     
       MOV    <    -2, <     2     
       SPL    @     0, $   825     
       JMP    @     0, $  3331     
       END      START

