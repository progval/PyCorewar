;redcode
;name Eclipse
;author P.Kline
;strategy bscan, ringkiller, clear
;strategy demo-only version
;assert 1
hold     dat #0
ptr      dat #stun
next     add #2234,ptr
scan     jmz next,@ptr      ; scan for non-zero
         slt #14,ptr        ; check for me
         jmp next,hold
inc      mov @ptr,hold      ; save whatever is pointed to
stun     mov bomb,@ptr      ; drop a stunner
         add hold,ptr       ; bump pointer up the trail
         cmp #-1,hold       ; don't follow djn streams
         jmn stun,@ptr      ; follow the trail
         djn next,#4        ; check for enough
bomb     spl 0
         mov 2,<-1
         jmp -1
         end next
