;redcode
;name          EBOLA strain 2.1
;version       2.1
;date          02/04/01
;author        DC Malboeuf
;strategy      stun + clear
;strategy      Stun every 8th address of the core
;strategy      after each pass through memory launch a core clear
;assert        CORESIZE==8000

step      equ 8
scan      equ 32

reset     mov a1,b1                  ;reset after
clear
          mov a2,b2
          jmp begin
a1        mov -5, -20
a2        dat $0,$0

gun       spl 0                      ;stun
ptr       dat #scan, #scan
begin     mov gun,@ptr
          add #step,ptr
          jmn begin, ptr

          mov #scan, ptr               ;clear
b1        mov ptr, -20
          sub #1, b1
          jmz b1, b2
          jmp reset
b2        dat $0, $0

end

