;redcode
;name Charon v8.0
;author Cisek,Strack,Kline
;strategy cmp-scanner, using spl-jmp bomb and imp-killing step
;strategy (extensive history deleted <- PK)
;assert 1

STEP    equ 164                          ;scan constants:
DIST    equ 82                           ;small, so can be reused in core clear
DJNOFF  equ decr-DIST
FIRST   equ DJNOFF+794                   ;optimal offset to DJN train

attack  add switch,@compptr              ;switch A- and B-fields
        mov jump,@comp
compptr mov split,<comp
scan    add incr,@compptr
comp    cmp FIRST-DIST,FIRST
        slt #incr-attack+DIST+1,@compptr ;don't hit self
decr    djn scan,<DJNOFF                 ;countdown to clear
        jmz attack,0                     ;enter clear when this is decremented
split   spl 0,<2667                      ;clear core
switch  mov @0-DIST,<1-DIST
jump    jmp -1,<2667
incr    dat #STEP,#STEP

        end comp

