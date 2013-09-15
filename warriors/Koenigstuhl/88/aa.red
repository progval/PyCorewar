;redcode
;name aa
;author nandor sieben
;strategy cmp-scanner vampire
;strategy the perfect weapon against a paper anti-vamp like Passport
;assert 1
shift   equ    37
begin   add    offset    ,   start
start   cmp    begin-shift  , begin
        slt    #17 , start
        djn    begin , offset-2
        mov    bomb , @start
        sub    start , @start
        add    next , start
        jmn    start , #3500
        jmp 0 , <-20
offset  mov    -2*37 , <-2*37
trap    mov    bomb2 , <1
        spl    -1 , -37
        jmp    -2
next    dat    #-37 , <-37
bomb    jmp    trap-start-shift , -1
bomb2   end    begin
