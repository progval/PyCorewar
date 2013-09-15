;redcode-94 
;name Miss Careless
;author Derek Ross
;strategy 75% bomb/scan once through core.
;strategy Then SPL carpet followed by SPL/DAT coreclear ...
;strategy Tuned against scanners then tweaked.
;strategy Written in '88 code.
;strategy Submitted to KotH: 30 August 95
;assert 1

gap1    equ 39
gap2    equ 36
gap1st  equ 200
multipl equ ((CORESIZE-gap1st)-((CORESIZE-gap1st)%gap1))
first   equ (check+multipl)
        
begin   dat #-1, #-(gap2*1/3)
kill    dat #0, #stun-check
        spl 0, begin-check
stun    spl 0, begin-check
loop    mov @bomb, <check
bomb    djn loop, <stun
shift   dat #-gap1, #-gap1

check   cmp <(first-(gap2*2/3)), <first
        jmp stun
start   add shift, check
        mov begin, @check
        djn check, <500
        jmp stun

        end start
