;redcode-94
;name Chameleon
;author M R Bremer
;strategy pspace is back, eh?
;strategy switch bomber <--> scanner
;assert 1

;pspace
_RES equ     #0
_STR equ     #111    ;Not that obviously

;juliet
ptr EQU -1333

;wild card
dist EQU 66
spread EQU dist*2     

org res

stun    spl #spread, spread
top     add stun, scan
scan    cmp dist+top, top
        slt.ab #20, scan
        djn.f top, <5100
        mov jump, @scan
        mov stun, <scan
        mov stun, <scan
        sub.f half, scan
test    jmn.b scan, top
        add.a #382, clear
        mov @-1, {clear
jump    jmp -2, 0
half    dat <0-dist,<0-dist-2
clear   spl #2, #3
for 30
        dat 0, 0
rof
res     ldp.ab  _RES,   #0
str     ldp.a   _STR,   str1    ;load strategy in use
        seq.ab  #1,     res     ;check result
lost    add.a   #1,     str1    ;lost change 
        mod.a   #2,     str1    ;secure result
win     stp.ab  str1,   _STR
str1    jmp     @0,     top
        dat     0,      juliet
for 10
        dat 0, 0
rof
gate2   dat <-445, <-446
s       spl #445, <-445
        spl #0, <-446
        mov {445-1, -445+2
        add -3, -1
        djn.f -2, <-2667-500
        mov 33, <-20
go      dat #0, #ptr
juliet  mov {-1, <-1
        mov {-2, <-2
        mov {-3, <-3
        mov {-4, <-4
        mov {-5, <-5
        mov {-6, <-6
        mov gate2, ptr+24 
        mov gate2, ptr+24
        spl @go, <-4000
        jmp boot, <-4013
for 10
        dat 1, 1
rof

imp_sz  equ     2667

boot    spl     1      ,#0
        spl     1      ,#0
        spl     <0     ,#vector+1
        djn.a   @vector,#0

imp     mov.i   #0,imp_sz

        jmp     imp+imp_sz*7,imp+imp_sz*6   
        jmp     imp+imp_sz*5,imp+imp_sz*4   
        jmp     imp+imp_sz*3,imp+imp_sz*2   
vector  jmp     imp+imp_sz  ,imp
