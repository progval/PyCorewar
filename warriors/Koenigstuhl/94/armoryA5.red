;redcode-94
;name Armory - A5
;author Wilkinson
;strategy use pspace to go to battle
;strategy v 5 - well, I'm still losing to Brain Wash... I may still
;strategy have a pcode bug. :/
;strategy Major changes.  Hoping for more wins, and less ties...
;assert 1

i       equ imp+100
NUM_STR equ #3
_RESULT equ #0
_LOSS   equ #222
_STR    equ #333
BOUND   equ #800
CDIST   equ 12
IVAL    equ 42
FIRST   equ scan+OFFSET+IVAL
OFFSET  equ (2*IVAL)
DJNOFF  equ -431
BOMBLEN equ CDIST+2
GATE    equ tie-4000
stinc   equ 190
d       equ 2667
S       equ stone+2537
T       equ gate+5500
step    equ 52
count   equ 665

res:  ldp _RESULT,  #0      ;load last result into B-field
loss: ldp   _LOSS,  #0
      jmz goloss,   res          ;a zero indicates a loss in the last round

      djn tie,res

win:     add    #-1,    loss
         stp.b  loss,   _LOSS
tie:
go:      ldp    _STR,   #0

         slt    BOUND-100, loss   ;check for illegal _LOSS record
         stp    BOUND,     _LOSS

         mod.ab NUM_STR,   go      ; in case _STR ever gets screwed up
         mov.ba go,      case
gojmp:   jmp    case               ;after this gojmp, we jump again from case

goloss:  add    #1,     loss
         slt    loss,   BOUND+2;if we've lost more than we won, then switch
         jmp    switch

         slt    BOUND-100, loss   ;check for illegal _LOSS record

         jmp    switch
         stp.b  loss,   _LOSS
         jmp    go

switch:  ldp    _STR,   #0
         add    #1,     -1
         slt    -2,     NUM_STR
         mov    #0,     switch
         stp    BOUND,  _LOSS
         stp.b  switch, _STR
         add.ba switch, case

case:    
         jmp    @0,     tornado    ;3
         jmp    @0,     sboot      ;3
         jmp    @0,     stonespir  ;3

;***Cannonade
stone:   mov   <1+5+(stinc*800),1
         spl   -1,    <2
         add    3,    stone
         djn   -2,    <5141+1
         dat    0,    0
         mov   stinc, <-stinc

           dat stone,   S
stonespir: mov }-1,     >-1    
           djn -1,      #6
           spl S+1

spir:      mov.i  imp,   i
           spl.a  1,     <GATE-200 
           mov.i -1,     0          ;2
           spl.a  1,     <GATE-300  ;3
           spl.a  1,     <GATE-400  ;6
           spl    2                 ;12
           jmp.a @imp-1, {0
           jmp.a *imp-1, {0

           dat   #i+2*d+7, #i+1*d+7
           dat   #i+7,     #i+2*d+6
           dat   #i+1*d+6, #i+6
           dat   #i+2*d+5, #i+1*d+5
           dat   #i+5,     #i+2*d+4
           dat   #i+1*d+4, #i+4
           dat   #i+2*d+3, #i+1*d+3
           dat   #i+3,     #i+2*d+2
           dat   #i+1*d+2, #i+2
           dat   #i+2*d+1, #i+1*d+1
           dat   #i+1,     #i+2*d
           dat   #i+1*d,   #i
imp:       mov.i #1,    2667

sboot:   mov.a  #cgate-2-tboot, tboot
         mov.a  #T+18-goboot, goboot
         jmp    2

tboot:   dat    gate,   T
tornado: mov    }tboot, >tboot
         djn    -1,     #8
         add.ab #10,    tboot  
         mov    }tboot, >tboot
         djn    -1,     #4 
goboot:  jmp    T+1,    {0

;***Tornado
gate    dat     #step,       #-step           ;step equ 52
start   mov     bombd+10,    *tstone
        mov     bombd+10,    @tstone
tstone  mov     *(2*step)+1, *(3*step)+1
        add     incr+10,     tstone
jump    djn.b   start,       #count          ;count equ 665
        spl     #step,       #0
clr     mov     gate,        }gate-5 ;jump ;gate-3

; 10 "dat 0, 0"'s need to be inserted here

incr    dat     3*step, 3*step
bombd   dat     #52   , #1         ;hit dat
dat 0, 0
dat 0, 0

;***Scissors
         dat    #cgate-10, clear-cgate+8+10    ; just in case clr is decremented
cgate    dat    #4000,    3000
wipe4    dat    #4000,    clear-cgate+8+10
wipe3    dat    #4000,    clear-cgate+8+10
         spl    #6000,    clear-cgate+8+10   ; redundant wipers
wipe2    spl    #6000,    clear-cgate+8+10   ; redundant wipers
wipe1    spl    #3050,    clear-cgate+8+10

; 10 "dat 0, 0"'s need to be here
clear    spl    #0, >-20
         mov    @2, >cgate-10
         mov    @1, >cgate-10
         djn.b  -2, {wipe1-10
end
