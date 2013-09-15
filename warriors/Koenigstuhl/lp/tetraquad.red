;redcode-lp
;name Tetraquad
;author David Moore
;strategy  Make copies
;assert CORESIZE==8000

; round 2 versus Robert McRae

; using only 8 processes

; I should add a brainwashing attack to this paper because I have
; no doubt that Robert will use a p-spacing warrior against me.
; But nobody wants to be predictable, so maybe he'll change his strategy.


dist equ 3003
psep equ -119

start  spl    boot,   0
       mov    #-18,   sptr + dist + psep - 2
       spl       1, < -1
       mov < clear, < sptr
sptr   spl     @ 0,   dist
       jmp  @ sptr, < 0

       mov    psep, < psep
       jmp      -1, < psep - 1
clear
boot   spl       1,   0

paper  mov    # 10, # 0
       mov < paper, < next
       mov < paper, < next
       mov < paper, < next
next   sub   #1075,   -3365
       mov < paper, < next
       mov < paper, < next
       spl  @ next, < -10
       jmz     @ 0,   paper

end start

