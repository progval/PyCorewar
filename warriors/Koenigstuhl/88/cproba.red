;redcode
;Name cproba
;Author nandor sieben
;assert 1
ret     add    offset    ,   start
start   cmp    ret-3039  , ret
        slt    #20 , start
        jmp    ret
        mov    bomb1 , @start
        mov    bomb , <start
back    add    next , start
        jmn    start , ret
bomb    spl    0, <ret-7
        mov    bomb2 , <ret-7
bomb1   jmp    -1
next    dat    <-3039 , < -3038
offset  dat    #-2*3039 , #-2*3039
bomb2   dat    <ret-bomb-8 , <-1000
        end    ret
