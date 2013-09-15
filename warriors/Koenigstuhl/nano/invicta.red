;redcode-94
;name invicta
;author John Lewis
;strategy Jump Jump Jump
;assert 1

; I love the idea of the four liner.  I have lots of code
; that works under these conditions.  I'll just have to
; plow through them to find the best one.  This one is
; the best so far.

dist equ 21

spl             #0,#dist+3
mov     }-1,>-1
mov     -3, <-35
djn             dist, <19
