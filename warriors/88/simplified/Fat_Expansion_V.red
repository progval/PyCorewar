;redcode
;name Fat Expansion (V)
;author Philip Thorne [RM/JM]
;assert 1

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
       SPL    $    25, $     0     
       MOV    $    16, $  -197     
       MOV    $    14, <    -1     
       MOV    $    12, <    -2     
       MOV    $    10, <    -3     
       MOV    $     8, $  -244     
       MOV    $    12, $  -246     
       SPL    $     1, $     0     
       MOV    $    -1, $     0     
       MOV    $    -1, $     0     
       MOV    $    -1, $     0     
       SPL    @   -10, $     0     
       JMP    @   -11, <  -211     
       JMP    $  2965, $ -2908     
       SPL    $     0, < -2690     
       MOV    $   -41, @   -41     
       ADD    $   -43, $   -42     
       JMP    $    -2, <   -35     
       DAT    #  2908, # -2908     
       MOV    $     4, <   -66     
       SPL    $    -1, $     0     
       SPL    $    -2, $     0     
       JMP    $    -3, $     0     
       DAT    #     0, #     0     
       MOV    $     0, $  1143     
       SPL    $     1, $     0     
       SPL    $     1, $     0     
       MOV    $    -1, $     0     
       SPL    $     1, $     0     
       SPL    $     2, $     0     
       JMP    @     0, $    -6     
       ADD    #  1143, $    -1     
       MOV    <  2663, $     0     
       MOV    $   -11, $  -212     
       MOV    $   -13, <    -1     
       MOV    $   -15, <    -2     
       MOV    $   -17, <    -3     
       END      START

