;redcode
;name Xerox v0.1
;author bd
;assert 1
; bd
start:  mov *ptr,@ptr
cond:   jmz.b next, ptr
nop {ptr,<ptr ; hehe, tricky, huh?
jmp start
; relative to start, dat: dat,(dat)*2 +1
ptr:    dat #0,#5
next:   dat 0,0

