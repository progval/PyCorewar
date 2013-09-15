;redcode
;name Agony 5.1
;author Stefan Strack
;strategy Small-interval CMP scanner that bombs with a SPL 0 carpet.
;rem strategy Initial version: 4-7-92
;rem strategy 2.0: smaller
;rem strategy 2.1: larger, but should tie less; changed scan constants
;rem strategy 2.2a: smaller
;rem strategy 2.3a: mutagenizes core
;rem strategy 2.4: smaller CMP interval, spends less time bombing
;rem strategy 2.4b: mutagenize constant optimized
;rem strategy 3.0: long scan with anti-imp constants (a la Charon v8.0+)
;rem strategy 3.1: zero bfield bombs again; more robust
;rem strategy 4.0: gating; shorter carpet
;rem strategy 4.1: tweaked constants
;rem strategy 4.2: ditto
;strategy 5.0: bootstrap with decoys (no reflections)
;strategy 5.1: smaller launch code; better placement -> scans own decoy later
;strategy Submitted: @date@
;assert 1

CDIST   equ 13
IVAL    equ 55                  ;22 ;22 ;42
FIRST   equ (scan+OFFSET+IVAL)
OFFSET  equ 110
DJNOFF  equ 7657                ;7645 ;7691
DESTIN1 equ 2744                ;FIRST-scan-216+48+1-5115-1+5-89-54
DESTIN2 equ 2731                ;FIRST-scan-216+48+2-8-5116-1-89-54

boot
cptr1   mov incr,DESTIN1
        mov bomb+1,<cptr1
        mov bomb,<cptr1
        mov count+1,<cptr1
        mov count,<cptr1
        mov split,<cptr1
cptr2   mov comp+3,DESTIN2
        mov comp+2,<cptr2
        mov comp+1,<cptr2
        mov comp,<cptr2
        mov scan,<cptr2
        mov load,<cptr2
        jmp DESTIN2-9
        mov 67,2739
        dat #1
        dat #1
        dat #1
        dat #1
        mov 57,<-5
        dat #1
        dat #1
        dat #1
        dat #1
        mov 46,<-4
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
load    mov #CDIST+(bptr-comp)+1,count
scan    sub incr,comp
comp    cmp FIRST-CDIST,FIRST
        slt #incr-comp+CDIST+(bptr-comp)+1,comp
        djn scan,<FIRST+DJNOFF
        mov comp,bptr
bptr    dat #1
split   mov bomb,<bptr
count   djn split,#CDIST+(bptr-comp)+1
        jmz load,load-1
bomb    spl 0,<1-IVAL
        mov incr,<count
incr    dat <0-IVAL,<0-IVAL
        mov #18,8
        dat #1
        dat #1
        dat #1
        dat #1
        mov -3,1
        dat #1
        dat #1
        dat #1
        dat #1
        spl 0,<1-IVAL
        dat #1
        dat #1
        dat #1
        dat #1
        dat #1
        dat #1

        end boot
