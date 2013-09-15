;redcode-94
;name Agony II
;author Stefan Strack
;strategy Small-interval CMP scanner that bombs with a SPL 0 carpet.
;strategy This is the good old '88 Agony with some '94 enhancements:
;strategy  - boots off decoy to delay (quick)scanners; erases boot pointer
;strategy  - optimized decoy to avoid self-triggering for more than 6000 cycles
;strategy Submitted: Sun Jul 31 14:11:05 CDT 1994
;pushed off at age 912 more than 14 months later
;assert CORESIZE == 8000
;$Id: agony_2.red,v 1.4 1995/07/12 07:03:46 stst Exp stst $

CDIST   equ 12
IVAL    equ 42
FIRST   equ scan+OFFSET+IVAL
OFFSET  equ IVAL
DJNOFF  equ -431
DESTIN  equ 2878

        org boot

boot    mov incr,DESTIN
for 11
        mov {boot,<boot
rof
        jmp @boot,<boot ; obliterate pointer and start working code

        MOV {-1,<-1     ; reflections
        dat *1,{1
        MOV {-3,<-3
        dat >1,*1
        MOV {-5,<-5
        dat @1,}1
        MOV {-7,<-7

        dat <1,>1
        MOV {-9,<-9
        dat {1,}1
        dat }1,}1   ;4
        dat @1,$1
        dat $1,@1   ;3
        dat $1,$1
        dat *1,#1   ;1
        dat >1,>1
        dat #1,*1   ;2
        dat {1,>1
        dat #1,#1
        dat {1,{1
        MOV {-9,<-9
        dat }1,<1
        dat }1,}1   ;4
        dat @1,@1
        dat $1,@1   ;3
        dat #1,$1
        dat *1,#1   ;1
        dat $1,*1
        dat #1,*1   ;2

scan    sub incr,comp
comp    cmp a=FIRST-CDIST,b=FIRST
        slt #incr-comp+CDIST+(bptr-comp)+1,comp
        djn.f scan,<c=FIRST+DJNOFF
bptr    mov.b comp,#bptr
        mov #d=CDIST+(bptr-comp)+1,count
split   mov bomb,<bptr
count   djn split,#0
        jmn.a scan,*0
bomb    spl #0,>-IVAL+1
        mov incr,<-2
incr    dat >-IVAL,>-IVAL

        dat $1,>1          ; reflections
        CMP a, b
        dat @1,#1
        DJN.F -3,<c
        dat }1,}1
        MOV #d, 2
        dat {1,{1
        DJN -1,#0

        dat <1,>1
        SPL #0,>-IVAL+1
        dat {1,}1
        dat }1,}1   ;4
        dat @1,$1
        dat $1,@1   ;3
        dat $1,$1
        dat *1,#1   ;1
        dat >1,>1
        dat #1,*1   ;2
        dat {1,>1
        dat #1,#1
        dat {1,{1
        SPL #0,>-IVAL+1
        dat }1,<1
        dat }1,}1   ;4
        dat @1,@1
        dat $1,@1   ;3
        dat #1,$1
        dat *1,#1   ;1
        dat $1,*1
        dat #1,*1   ;2

        dat #1,$1
        dat #1,#1
        dat @1,#1
        dat 0,0
        dat *1,*1
        dat 0,0
        dat >1,{1
        dat 0,0
        dat }1,<1
        dat 0,0
        dat @1,$1
        dat #1,#1
        dat $1,<1
        dat #1,#1
        dat @1,*1

        end
