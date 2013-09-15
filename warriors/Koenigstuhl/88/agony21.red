;redcode verbose
;name Agony 2.1
;author Stefan Strack
;strategy Small-interval CMP scanner that bombs with a SPL 0 carpet.
;strategy 2.0: smaller
;strategy 2.1: larger, but should tie less; changed scan constants
;strategy Submitted: @date@
;assert 1

CDIST   EQU     23                 ; distance between addresses CoMPared
IVAL    EQU     994                ; scan increment (mod-2 pattern)

scan    ADD     incr,   comp                            ; CMP scan loop:
comp    CMP     0,      CDIST                           ;
        SLT     #incr-comp+CDIST+(bptr-comp)+1,comp     ; don't bomb self
        JMP     scan                                    ;

        MOV     #CDIST+(bptr-comp)+1,count    ; init bomb-loop w/ # of bombs
        MOV     comp,    bptr                 ; use "comp" as bomb-pointer
bptr    DAT     #0                            ; this will be "comp" when exec
split   MOV     bomb,   <bptr                 ; bomb away
count   DJN     split,  #0
        JMN     scan,   scan                  ; fall thru when self-obliterated
bomb    SPL     0                             ; and clear the core
        MOV     2,<-1
incr    DAT     #IVAL,  #IVAL

        END     scan
