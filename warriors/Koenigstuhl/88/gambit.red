;redcode verbose
;name Gambit
;author J.Cisek
;strategy creation date 6/11/92
;strategy  6/15/92 much smaller (10 instead of 17)
;strategy  6/17/92 a little bigger (size 12), faster bomber
;strategy Cmp scan the core for a target.  Place small bomber at target and
;strategy  jump there gambling everything...
;strategy This works well against pattern bombers.  The warrior's small
;strategy  size (and a couple of neat tricks) make it a decent opponent
;strategy  against other scanners (that don't mutagenize B-fields :)
;strategy It does dismally against multiplying warriors (Enjoy, Note Paper)
;assert 1

STEP    equ 6477                        ;step optimized for size 10 enemy
DIST    equ 60                          ;good vs. mod 3,4,5 bombers
START   equ search                      ;where to end the search
LENGTH  equ inc-search+2+DIST           ;don't bomb self

search  add inc, target                 ;scan for target
target  cmp START, START+DIST
funky   slt #LENGTH, target             ;don't hit self
        jmp search

hit     mov killer+2, @target
        mov killer+1, <target           ;place killer
        mov killer, <target
        jmp @target                     ;start it

killer  spl 0
        mov @2, <-1
        jmp -1, <-2

inc     dat #STEP, #STEP                ;the step value

        end search
