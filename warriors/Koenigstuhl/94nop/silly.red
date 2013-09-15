;redcode
;name Silly
;author James Ojaste
;assert 1
dat1    dat >-5000, >-5000
trg     dat >-5000, >3
start   mov dat1, >trg
        jmp start, >-5000
        end start
