;redcode-b quiet
;name juliet and paper
;author M R Bremer, B. Bezzi
;strategy p-warrior for C.W. n.5 hint
;strategy switches juliet storm and Paper01
;assert CORESIZE == 8000

_STR    equ     17

ptr     EQU     -1333
dest0   equ     2200
dest1   equ     3740
dest2   equ     -1278   
range   equ     933

        RES     equ 0           ;here pmars loads results
        STR     equ 1           ;here I store my strategy 

imp_sz  equ     2667

org     start

gate    dat <-445, <-446
s       spl #445, <-445
        spl #0, <-446
        mov {445-1, -445+2
        add -3, -1
        djn.f -2, <-2667-500
        mov 32, <-20
go      dat     #0,     #ptr
juliet  mov     {-1,    <-1
        mov     {-2,    <-2
        mov     {-3,    <-3
        mov     {-4,    <-4
        mov     {-5,    <-5
        mov     {-6,    <-6
        mov     gate,   ptr+24 
        mov     gate,   ptr+24
        spl     @go,    <4000
        jmp     boot,   <4013
start

res     ldp.ab  RES,    #0      ;load result last match
str     ldp.a   STR,    str1    ;load strategy in use
        sne.ab  #0,     res     ;check result, win or tie OK
lost    add.a   #1,     str1    ;lost change
        mod.a   #2,     str1    ;secure jump     
win     stp.ab  str1,   _STR    ;save strategy
str1    jmp     @0,     juliet
        dat     0,      paper



paper
        spl     1,      <300    ;\.
        spl     1,      <400    ;-> generate 8 consecutive processes
        spl     1,      <500  	;/.

silk    spl     @0,     {dest0
        mov.i   }-1,    >-1 
silk1   spl     @0,     <dest1  ;split to new copy
        mov.i   }-1,    >-1     ;copy self to new location
        mov.i   bomba,  }range
        mov     {silk1, <silk2
silk2   jmp     @0,     >dest2
bomba   dat     <2667,  <1

for MAXLENGTH-CURLINE-9
        dat     0,0
rof

boot    spl     1      ,#0
        spl     1      ,#0
        spl     <0     ,#vector+1
        djn.a   @vector,#0

imp     mov.i   #0,imp_sz

        jmp     imp+imp_sz*7,imp+imp_sz*6   
        jmp     imp+imp_sz*5,imp+imp_sz*4   
        jmp     imp+imp_sz*3,imp+imp_sz*2   
vector  jmp     imp+imp_sz  ,imp

        end
