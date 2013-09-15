;redcode
;name Trivial v0.2
;author John Metcalf
;strategy '88 oneshot, .66c scan -> .5c clear
;strategy v0.2 useless boot & decoy removed
;assert CORESIZE%8==0
        STEP    EQU    -24
        DIST    EQU     4
DBMB    DAT   < 3428        , < GBMB-BPTR
GBMB    DAT   < DBMB-BPTR-1 , < -2
INC     MOV     STEP        ,   STEP+1
SLP     ADD     INC         ,   PTR
PTR     ADD     STEP*5-2    , < STEP*5+DIST-1
        JMZ     SLP         , < PTR
        MOV     PTR         ,   CPTR
SBMB    SPL     0           , < DBMB-BPTR
CLP     MOV   @ BPTR        , < CPTR
        DJN     CLP         , < DBMB-BPTR-2
        JMP     CLP         , # 0
CPTR    DAT                   # 0
BPTR    DAT                   # SBMB
        END     PTR
