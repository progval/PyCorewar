;redcode verbose
;name Prime-Imp v1.0
;author Joshua Houk
;strategy    Moves forward in a scattershot fashion, then backtracks to
;strategy    one cell after the previous start point and repeats.
;strategy    Hopefully, this will provide some sort of defense.
;strategy    Revision of imp.
;assert      1

start  mov 0 , 1
mov  0 , 2
mov  0 , 2
mov  0 , 4
mov  0 , -9
jmp start
