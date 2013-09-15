;redcode
;name Maya v1.6
;author Christoph C. Birk
;strategy CMP scanner (SPL 0 carpet) + core clear
;assert CORESIZE==8000 
;95 Wilkies
 
DIST    equ 14
SIZE    equ 20        ; 34
STEP    equ 29        ; 30
LOOP    equ 267
GATE    equ 30

junk    dat #0
scan    add incr,comp
comp    cmp 4*STEP,4*STEP+DIST   ; if not equal
        spl carpet               ; carpet bombing
        djn scan,#LOOP           ; # of loops 
        jmp bomb                 ; core clear

for 42
        dat #0
rof

carpet  mov comp,junk
        add #3,junk
        mov #SIZE,count     
split   mov bomb,<junk           ; SPL 0 - carpet
count   djn split,#SIZE
        jmp erase

for 42   
        dat #0
rof

bomb    spl 0,<scan-GATE         ; imp-gate
erase   mov incr,<bomb           ; fast core clear 
        jmp erase,<scan-GATE     ; imp-gate
incr    dat #STEP,#STEP

        end comp
 
