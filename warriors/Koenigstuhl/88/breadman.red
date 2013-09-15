;redcode
;name Breadman 1.0
;author Joshua Houk
;strategy : Hops and skips forward a few cells, then jumps back and cuts a
;strategy   swath through - clearing everything out. Then splits and
;strategy   repeats continuously, while simulaneously moving foward.
;strategy   Based on a modification of my previous two programs, and
;strategy   fares a *whole* lot better than the earlier generation
;strategy   Prime-imps.
;assert 1

gun  spl start
jmp gun
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
end gun
