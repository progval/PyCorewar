;redcode
;name Smite White
;author P.Kline
;assert 1 
ptr     dat #0
start   jmz 0,<ptr
bktrk   sub #3044,ptr
        jmn bktrk,@ptr
        add #2+3044,ptr
        mov ptr,<ptr
        jmp -1
        end start
