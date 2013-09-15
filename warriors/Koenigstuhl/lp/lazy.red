;redcode
;name Lazy
;author Zul Nadzri
;assert CORESIZE==8000
;strategy Submission for round 5 of the tournament. 
;strategy No time to make new codes.

for    MAXPROCESSES==8
ptr     dat     #0
w2      mov     #12,     ptr
loop    mov     @ptr,    <dest
djn     loop,    ptr
spl     @dest,   0
add     #653,    dest
jmz     -5,      ptr
dest    dat     #0,      #833
        end      w2
rof


for     WARRIORS==2 && MAXPROCESSES>10 

scan    sub  incr,comp
comp    cmp  115,125
        slt  #21,comp
        djn  scan,<-308
        add  #2,comp                     ;extra : adjust to 88 code 
        mov #12,count
split   mov  bomb,<comp
count   djn  split,#0
        add #10,comp
        jmn  scan,scan
bomb    spl  0,0
        mov  incr,<count
incr    dat  <-42,<-42
        end  comp
rof



for     WARRIORS>2

ULAT    spl     1,>4123
       spl     1,>4345
       mov     -1,0
       spl     ULAT2,>4567

       spl     @0,}2345
       mov     }-1,>-1
       spl     @0,}3456
       mov     }-1,>-1
       mov     {-123,{-234
       mov     {-3,<1
       jmp     @0,>3901

ULAT2   spl     @0,}4456
        mov     }-1,>-1
        mov     }234,}345
        spl     3,<5100
        spl     2668,<5345
        mov     0,2667
        jmp     -2667,<5567
        end     ULAT
rof
