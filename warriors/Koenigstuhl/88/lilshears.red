;redcode
;name lil' shears
;author P.Kline
;strategy bscanning spl-jmp bomber with core-clear & gate
;assert 1
bbmb     mov bjmp,@bjmp
bnex     add #12,@2
         jmz bnex,@bbmb
         mov bspl,@bbmb
bjmp     jmp @-1,-1      ; this gets bombed with bspl to start core-clear
bspl     spl 0,<1        ; this gets decremented by above to <7872
         mov 1,-3
         dat <7871,<-1   ; this decrements the mov for the core-clear
         end bnex
