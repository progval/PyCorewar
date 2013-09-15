;redcode verbose
;name Prime-Imp v2.0
;author Joshua Houk
;strategy | Moves forward in a scattershot fashion, then backtracks to
;    one cell after the previous start point, then steamrolls
;    through the path to every address. This should prove to be
;    a more offensive version (and let's just see how many people
;    I can offend :).
;    Revision of imp, so obviously I can't take all credit.
;assert 1

start  mov 0 , 1
mov  0 , 2
mov  0 , 2
mov  0 , 4
mov  0 , -9
mov  0 , 1
mov  0 , 1
mov  0 , 1
mov  0 , 1
mov  0 , 1
mov  0 , 1
mov  0 , 1
mov  0 , 1
mov  0 , 1
mov  0 , 1
mov  0 , 1
mov  0 , -10
jmp start
