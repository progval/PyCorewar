;redcode
;name Simple '88
;author Ian Oversby
;assert 1

       SPL    $     1, <  -500     
       SPL    $     1, <  -500     
       SPL    $     1, <  -500     
       SPL    $     1, <  -500     
       SPL    $     2, <  -500     
       JMP    @     0, $     3     
       ADD    #  2667, $    -1     
       DAT    #     0, #     0     
       MOV    $     0, $  2667     
START  MOV    <    12, <    11     
       MOV    <    11, <    10     
       MOV    <    10, <     9     
       MOV    <     9, <     8     
       MOV    <     8, <     7     
       MOV    <     7, <     6     
       SPL    @     5, <  -300     
       ADD    #   100, $     4     
       MOV    $    11, @     3     
       MOV    $   -11, $     2     
       JMP    $   -19, <  -300     
       DAT    #     0, #  1900     
       DAT    #     0, #     7     
       SPL    $     0, <   -95     
       SPL    $     0, #     0     
       MOV    <    94, $   -93     
       ADD    $     2, $    -1     
       DJN    $    -2, <   -99     
       MOV    $    95, <   -95     
       DAT    <   -96, <   -96     
       END      START

