;redcode
;name Spitfire 3
;author Stefan Strack
;strategy Charon v8.x-based CMP scanner that stuns with an incendiary bomb
;strategy Submitted: @date@
;assert 1

STEP    equ 28                           ;scan constants:
DIST    equ 14                           ;small, so can be reused in core clear
FIRST   equ (DJNOFF+794)                 ;optimal offset to DJN train
DJNOFF  equ (decr-DIST)
CLEN    equ 7

spit    mov -1,<-1                       ;second line of bomb
attack  add switch,@compptr              ;switch A- and B-fields
        mov jump,@comp                   ;bomb with:  spl 0,7
        mov spit,<comp                   ;            mov -1,<-1
compptr mov split,<comp                  ;            jmp -2,<2667
scan    sub incr,@compptr                ;scan loop:  advance pointer
comp    cmp FIRST-DIST,FIRST             ;            compare A and B
        slt #incr-attack+DIST+1,@compptr ;            don't hit self
decr    djn scan,<DJNOFF                 ;            countdown to clear
        jmz attack,0                     ;enter clear when this is decremented
split   spl 0,CLEN                       ;core clear: first line of bomb
switch  mov @0-DIST,<2-DIST              ;            doubles as CMP distance
jump    jmp split,<2667                  ;            third line of bomb
incr    dat <-STEP,<-STEP                ;scan increment

        end comp
