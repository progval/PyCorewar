;redcode-94 test
;name Ron Post
;author Steve Gunnell
;assert 1

STEP1   equ  6573
STEP2   equ  772
STEP3   equ  425

;;;;;;;;;;;;;;;;;;;;
;                  ;
;    paper         ;
;                  ;
;;;;;;;;;;;;;;;;;;;;

paper  spl    1,         <paper
       spl    1,         <paper
       spl    1,         <paper
tpap   spl    @0        ,STEP1
       mov    }-1,       >-1
hpap   spl    @0        ,STEP2
       mov    }-1,       >-1
       mov.i  #1         ,}1
       mov.i  #3509   ,}1372
       mov.i  {hpap      ,<xpap
xpap   jmz.a  @0        ,STEP3
       dat    #1         ,#1
for    MAXLENGTH-CURLINE
       spl    #1         ,#1
rof

end paper

