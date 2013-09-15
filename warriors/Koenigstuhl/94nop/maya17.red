;redcode-94
;name Maya v1.7
;author Christoph C. Birk
;strategy CMP scanner (SPL 0 carpet) + core clear
;assert CORESIZE==8000 
;scored 109 on pizza '94 hill (18.7.95)
;        74 Wilkies
 
DIST    equ 14
SIZE    equ 14
STEP    equ 30
LOOP    equ 267
GATE    equ 30

scan    add incr,comp
comp    cmp 4*STEP,4*STEP+DIST   ; if not equal
        jmp carpet               ; carpet bombing
        djn scan,#LOOP           ; # of loops 
        jmp bomb                 ; core clear

for 43
        dat #0
rof

carpet  mov #SIZE,count     
split   mov bomb,<comp           ; SPL 0 - carpet
count   djn split,#SIZE
        add #SIZE,comp
        jmp scan

for 43   
        dat #0
rof

bomb    spl 0,<bomb-GATE         ; imp-gate
erase   mov incr,<bomb-1         ; fast core clear 
        jmp erase,<bomb-GATE     ; imp-gate
incr    dat }STEP,>STEP

        end comp
 
