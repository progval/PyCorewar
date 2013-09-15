;redcode
;name villam
;author nandor sieben
;assert 1
start  add #7 ,2
       mov bomb , @1
       mov bomb , @94
       djn start , #1699     ;12000/7-15
       spl 0
       mov 0,1
bomb   dat #0,#3997
       end start
