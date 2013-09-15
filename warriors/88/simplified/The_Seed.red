;redcode
;name The Seed
;author Roy van Rijn
;assert 1

START  CMP    $   805, $   644     
       JMP    $    27, <   966     
       CMP    $  1769, $  1608     
       JMP    $    24, <  1288     
       CMP    $  1445, $  1284     
       DJN    $    22, #    -4     
       CMP    $  3212, $  3373     
       DJN    $    19, #    -4     
       CMP    $  3051, $  2890     
       JMP    $    17, <  1932     
       CMP    $  2083, $  1922     
       JMP    $    15, <    16     
       CMP    $  2725, $  2564     
       JMP    $    13, <    -8     
       CMP    $  3528, $  3689     
       JMP    $    10, <    11     
       CMP    $ -2228, $ -2067     
       DJN    $     8, #    -8     
       CMP    $ -2868, $ -2707     
       JMP    $     6, <   -12     
       CMP    $  3844, $ -3995     
       JMP    $     4, <     6     
       CMP    $ -3514, $ -3353     
       JMP    $     2, <   -18     
       JMZ    $    11, $ -3194     
       ADD    @    -8, $     7     
       ADD    @   -19, @    -1     
       ADD    @   -22, @    -2     
       CMP    @     4, <  3001     
       CMP    @     0, $     0     
       ADD    #   161, $     2     
       MOV    $     4, @     1     
       MOV    <  2345, <   612     
       SUB    #     9, @    -2     
       DJN    $    -3, #     6     
       MOV    $    23, $    46     
       MOV    $    23, $    46     
       MOV    $    23, $    46     
       MOV    $    23, $    46     
       MOV    $    23, $    46     
       MOV    $    23, $    48     
       SPL    $    40, <  1882     
       SPL    $    39, <   590     
       SPL    $    38, <   815     
       SPL    $    37, < -2980     
       SPL    $     1, <  3020     
       MOV    $    -1, $     0     
       MOV    $    -1, $     0     
       MOV    $    -1, $     0     
       MOV    #     9, $     9     
       MOV    <    -1, <     1     
       SPL    @     0, $  -266     
       MOV    $     5, <    -1     
       MOV    $     4, <    -2     
       MOV    $     2, <    -3     
       JMZ    $    -6, $    -6     
       MOV    $     0, <     1     
       DAT    <  2667, < -2666     
       SPL    $     0, <  1761     
       MOV    $     6, <  -123     
       MOV    $     5, @    -1     
       ADD    #  -107, $    -2     
       DJN    $    -3, <  1840     
       DAT    <     1, #    17     
       END      START

