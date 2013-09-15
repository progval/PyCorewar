;redcode-94
;name Maya v2.0
;author Christoph C. Birk
;strategy CMP scanner (SPL 0 carpet) + core clear
;strategy bi-directional
;assert 1
;64 Wilkies
 
DIST    equ 15
SIZE    equ DIST+1
STEP    equ (2*DIST)+1
LOOP    equ (CORESIZE-200)/(2*STEP)

scan1   sub incr1,comp1
comp1   cmp -3*STEP,-3*STEP+DIST   ; if not equal
        jmp carpet1                ; carpet bombing
cc      djn scan1,#LOOP            ; # of loops 
bomb1   spl 0,<-67
clear1  mov incr1,<cc              ; core clear
        jmp clear1,<-69
carpet1 mov #SIZE,count1
split1  mov bomb1,<comp1           ; SPL 0 - carpet
count1  djn split1,#SIZE
        add #SIZE,comp1
        jmp scan1
incr1   dat #STEP,#STEP

for 34
        dat #0
rof
                                   ; spl 0 here for both 
start   spl comp1
        spl comp2

for 38
        dat #0
rof

scan2   add incr2,comp2
comp2   cmp 3*STEP,3*STEP+DIST
        jmp carpet2
        djn scan2,#LOOP
bomb2   spl 0,<69
clear2  mov incr2,>count2
        jmp clear2,<67
carpet2 mov #SIZE,count2
split2  mov bomb2,<comp2
count2  djn split2,#SIZE
        add #SIZE,comp2
        jmp scan2
incr2   dat #STEP,#STEP

        end start
 
