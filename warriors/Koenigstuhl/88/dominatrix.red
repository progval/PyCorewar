;redcode
;name Dominatrix 1.04
;author Eric J. Schwertfeger
;strategy Scanner/Slaver
;strategy The result of StealthHunter and
;strategy J. Cisek's scanning article
;strategy Faster Scanning, slower bombing
;strategy need better constants :-(
;strategy Submitted: @date@
;assert 1
SPLIT   EQU     (191-STEP)
START   EQU     (100)
STEP    EQU     (411)
BLANK   EQU     (LOOP-2)
LOOP    ADD     INC,WHERE
WHERE   CMP     START,START+SPLIT
        SLT     #TAIL+1,WHERE
        JMP     LOOP
        MOV     JMPBOMB,BOMB
        SUB     WHERE,BOMB
        SLT     #-6,WHERE
        MOV     BOMB,@WHERE
        SUB     ALIGN,WHERE
        JMP     WHERE
ALIGN   DAT     #SPLIT,#SPLIT
INC     DAT     #STEP,#STEP
JMPBOMB JMP     (PIT-WHERE-SPLIT),4000
BOMB    DAT     #0,#0
PLOOP   MOV     TAIL+1,<BLANK
        MOV     TAIL+1,<BLANK
PIT     SPL     0
TAIL    JMP     PLOOP
        END     LOOP
