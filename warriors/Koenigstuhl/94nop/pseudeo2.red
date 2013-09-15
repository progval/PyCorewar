;redcode-b
;name       Pseudo-Warrior 2.0
;author     Matt Lewinski
;strategy   .66c bomber!
;assert     CORESIZE==8000

org     movr

modulo  equ     5
step    equ     2365
start   equ     99
dist    equ     4000

point   dat.f   $100        , $100              ;
        dat.f   $0          , $0                ;*
movr    mov.x   $start      , $start+dist       ;
addr    add.f   $offset     , $movr             ;
        djn.b   $movr       , #8000/(modulo*2)  ;
        jmp.b   $offset     , }0                ;
        dat.f   $0          , $0                ;*
offset  spl.b   #step       , #step             ;
        mov.i   $clear      , >point            ;
bottom  djn.f   $-1         , >point            ;
clear   dat.f   <1          , #clear-point+2    ;

for 100-CURLINE
        dat.f   $0          , $0
rof

