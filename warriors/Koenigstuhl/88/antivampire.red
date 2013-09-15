;redcode
;name Anti-Vampire
;assert 1
p2w     equ p2av-100
        spl 1
        mov -1,0          ; create 9 processes
        mov -1,0
        mov -1,0
        
p2      mov #9,0
        mov <p2,<p2n      ; make a new copy and start it
p2n     spl @0,1889
        add <p2w,p2av     ; add 9 consecutive locations to p2av
        mov #p2w-1,p2av   ; reset p2av to point to p2w
p2av    mov #0,p2w        ; mov the a-operand to p2w
        mov 2,<p2w        ; start bombing from where p2w points
        jmp -1,<p2w-1     ; keep bombing (and partial gate)
        dat <-2667,<-5334

