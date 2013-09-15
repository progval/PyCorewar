;redcode
;name Creampuff II
;author P. Kline
;strategy 12-line, spl-jmp bombing cmp-scanner
;strategy no decoy, partial gate, and using imp-killing step
;assert 1

half    equ 59
full    equ (half+half)

attack  add reset,@scanptr               ; found something -> attack at a-pointer
        mov bjmp,@scan                   ; jmp half of the bomb
scanptr mov bspl,<scan                   ; spl half "  "  "
next    add incr,scan                    ; increment scanning pointers
scan    cmp half+full,full+full          ; compare locations
        slt #incr-attack+half+1,@scanptr ; don't bomb self
        djn next,<-20                    ; djn-stream, countdown
        jmz attack,0                     ; loop until overrun by djn-stream
bspl    spl 0,<2667                      ;      (mine or yours)
reset   mov 0-half,<1-half               ; core-clear
bjmp    jmp -1,<1-half+2667              ; 
incr    dat #full,#full                  ; scanning increment
        end scan                         ; start right off scanning :-)
