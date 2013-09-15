;redcode quiet
;name Medusa's v7X
;author W. Mintardjo
;strategy Medusa's is based on Agony 2.4b which was a cmp-scanner with
;strategy SPL carpet bombing
;strategy Submitted: Fri May 14 11:03:42 PDT 1993
;assert 1
CDIST   equ 12
IVAL    equ 28
FIRST   equ (scan-OFFSET+IVAL)
OFFSET  equ 5324
n       equ 1

redo    mov #CDIST+n,count
scan    sub data,@split
comp    cmp FIRST-CDIST,FIRST
        slt #data-comp+1+CDIST+1+n,@split
        djn scan,<FIRST+163
        mov jump,@comp
split   mov bomb,<comp
count   djn split,#CDIST+n
        add #CDIST+n,@split
        jmz redo,redo-2
bomb    spl 0, <0-IVAL+1
incr    mov data, <count
jump    jmp incr, <0-IVAL+1
data    DAT <0-IVAL, <0-IVAL

        end comp
