;redcode verbose
;name Charon v7.0
;author J.Cisek & S.Strack
;strategy creation date 4/11/92
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
;strategy Charon is the >original< spl/jmp bombing cmp scanner.
;strategy  It scans using an off-axis CMP-scan, bombs with the spl/jmp
;strategy   combination (thus slowing the enemy down), and eventually
;strategy   clears the core with dats.
;assert 1

STEP    equ 68
DIST    equ 34
FIRST   equ (target-(STEP*93))

scan    add incr, target
target  cmp FIRST-DIST, FIRST
        slt #incr-target+DIST+1, target
        djn scan, <FIRST+189

        mov jump, @target
        mov split, <target
        add switch, target
jump    jmz @-1, 0
split   spl 0
switch  mov @0-DIST, <1-DIST
incr    dat #0-STEP, #0-STEP

        end target

