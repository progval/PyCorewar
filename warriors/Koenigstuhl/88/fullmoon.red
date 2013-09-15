;redcode
;name Full moon
;author Dan Nabutovsky
;contact fedimit@wisipc.weizmann.ac.il
;group A
;strategy moonstone + 7-process 3-point imp spiral (ala Night Crawler)
;contact fedimit@wisipc.weizmann.ac.il
;assert CORESIZE==8000
d       equ 2667
imp     equ (impcopy+1700)    ;imp start
hide    equ 1600              ;bomb location

; stone

bomb:   dat #-8
        MOV 16, <-16
incr:   MOV 16, <-16
init:   SPL 0
loop:   MOV <15, @-5
        MOV bomb, @-1
        ADD incr, loop
        JMP loop
        JMN -1, 295
        JMP 0, <-15

; decoys 

dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1
dat #1

; Bootstrap

start 
mov bomb+9,hide
mov bomb+8,<start
mov bomb+7,<start
mov bomb+6,<start      
mov bomb+5,<start
mov bomb+4,<start
mov bomb+3,<start
mov bomb+2,<start
mov bomb+1,<start
mov bomb,<start

; ACTION

spl start+hide-6         ;Split to stone
ring
spl 9                    ;binary ring startup is the fastest
spl 5                    ;7 process 3-point spiral
spl 3      
mov impcopy,imp          ;use one process to copy imp away from decoy
jmp start+hide-3         ;then jmp to stone
jmp imp      
spl 2      
jmp imp+d
jmp imp+2*d
spl 4      
spl 2      
jmp imp+3*d
jmp imp+4*d
spl 2      
jmp imp+5*d
jmp imp+6*d
impcopy mov 0,2667
end start

