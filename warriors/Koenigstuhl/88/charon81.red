;redcode
;name Charon v8.1
;author Cisek,Strack,Kline
;assert CORESIZE==8000
;strategy creation date 4/22/92
;strategy  v2.0  4/22/92 total code overhaul
;strategy   mod 3 cmp scan with optimal step, new deadly trap (SPL 0, JMP -1)
;strategy  v3.0  5/3/92 integrated with Stefan Strack's Echo (much smaller)
;strategy  v4.0  5/8/92 [pretty much a failure]
;strategy  v5.0  5/12/92 same as 3.0, new clear core routine
;strategy  v6.0  6/11/92 finally moved off axis (v5.0 was getting slaughtered
;strategy                by programs copied across the axis)
;strategy  v7.0  7/6/92 2 instructions smaller, different constants,
;strategy               linear decrement triggers clear core.
;strategy               [no longer hits itself to start clear core]
;strategy  v8.0 12/22/92 now forward-scans for an extended time
;strategy                using step-size that kills slow-moving imps
;strategy                also protecting 3 lines against decrement
;strategy  v8.1  1/25/93 new step-constants
;strategy Charon is the >original< spl/jmp bombing cmp scanner.
;strategy  It scans using an off-axis CMP-scan, bombs with the spl/jmp
;strategy   combination (thus slowing the enemy down), and eventually
;strategy   clears the core with dats.
;strategy Submitted: @date@

STEP    equ 68                           ;scan constants:
DIST    equ 34                           ;small, so can be reused in core clear
DJNOFF  equ (decr-DIST)
FIRST   equ (DJNOFF+149)                 ;optimal offset to DJN train

attack  add switch,@compptr              ;switch A- and B-fields
        mov jump,@comp
compptr mov split,<comp
scan    add incr,@compptr
comp    cmp FIRST-DIST,FIRST             ;start executing here
        slt #incr-attack+DIST+1,@compptr ;don't hit self
decr    djn scan,<DJNOFF                 ;countdown to clear
        jmz attack,0                     ;enter clear when this is decremented
split   spl 0,<2667                      ;clear core
switch  mov @0-DIST,<1-DIST              
jump    jmp -1,<2667
incr    dat #STEP,#STEP

        end comp
