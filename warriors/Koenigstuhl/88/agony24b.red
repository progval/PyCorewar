;redcode
;name Agony 2.4b
;author Stefan Strack
;strategy Small-interval CMP scanner that bombs with a SPL 0 carpet.
;strategy 2.0: smaller
;strategy 2.1: larger, but should tie less; changed scan constants
;strategy 2.2a: smaller
;strategy 2.3a: mutagenizes core
;strategy 2.4: smaller CMP interval, spends less time bombing
;strategy 2.4b: mutagenize constant optimized
;strategy Submitted: @date@
;assert 1

CDIST   equ 12
IVAL    equ 28
FIRST   equ (scan-OFFSET+IVAL)
OFFSET  equ 5324                    ; -> 1333 scan loops

;start   mov start-1,bptr

scan    sub incr,comp
comp    cmp FIRST-CDIST,FIRST
        slt #incr-comp+CDIST+(bptr-comp)+1,comp
        djn scan,<FIRST+163    ;-195-OFFSET ;796-OFFSET
        mov #CDIST+(bptr-comp)+1,count
        mov comp,bptr
bptr    dat #0
split   mov bomb,<bptr
count   djn split,#0 ;#last+1
        jmn scan,scan
bomb    spl 0
incr    mov 0-IVAL,<0-IVAL

;;------ boot code that sets bptr to DAT 0,0, then erases itself
;erase   mov last+1,<count
;        djn erase,<792-OFFSET   ;jmp erase
;boot    mov last+1,bptr ;.. and any other internal spacers
;        spl comp
;        spl erase
;last    jmp erase
;
;        end boot

        end comp
