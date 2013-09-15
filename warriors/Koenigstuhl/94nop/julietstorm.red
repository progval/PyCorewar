;redcode-94
;name juliet storm
;author M R Bremer
;strategy bomber--yippee 
;assert 1

ptr     EQU -1333

gate    dat <-445, <-446
s       spl #445, <-445
        spl #0, <-446
        mov {445-1, -445+2
        add -3, -1
        djn.f -2, <-2667-500
        mov 33, <-20
go      dat #0, #ptr
start   mov {-1, <-1            ;boot the bomber into core
        mov {-2, <-2
        mov {-3, <-3
        mov {-4, <-4
        mov {-5, <-5
        mov {-6, <-6
        mov gate, ptr+24 
        mov gate, ptr+24
        spl @go, <-4000
        jmp boot, <-4013
for 73
        dat #0, #0
rof

imp_sz  equ     2667

boot    spl     1      ,#0              ;vector launched imp ala T. Hsu
        spl     1      ,#0
        spl     <0     ,#vector+1
        djn.a   @vector,#0

imp     mov.i   #0,imp_sz

        jmp     imp+imp_sz*7,imp+imp_sz*6   
        jmp     imp+imp_sz*5,imp+imp_sz*4   
        jmp     imp+imp_sz*3,imp+imp_sz*2   
vector  jmp     imp+imp_sz  ,imp

        end     start
