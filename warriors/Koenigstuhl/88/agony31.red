;redcode
;name Agony 3.1
;author Stefan Strack
;strategy Small-interval CMP scanner that bombs with a SPL 0 carpet.
;assert 1
 
CDIST   equ 12
IVAL    equ 42
FIRST   equ (scan+OFFSET+IVAL)
OFFSET  equ (2*IVAL)
DJNOFF  equ -431
 
scan    sub incr,comp
comp    cmp FIRST-CDIST,FIRST
        slt #incr-comp+CDIST+(bptr-comp)+1,comp
        djn scan,<FIRST+DJNOFF
        mov #CDIST+(bptr-comp)+1,count
        mov comp,bptr
bptr    dat #0
split   mov bomb,<bptr
count   djn split,#0
        jmn scan,scan
bomb    spl 0
        mov incr,<count
incr    dat <0-IVAL,<0-IVAL
 
        end comp
 
