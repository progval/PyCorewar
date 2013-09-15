;redcode
;name Shrimp
;author William R. Buckley
;strategy mobile warrior, a.k.a. Simple
;strategy From TCWN June 1987, with bugfix from September 1987 issue
;assert 1
GAIT    EQU     10
COUNT   DAT                             #0
SRC     DAT                             #0
DESTIN  DAT                             #0
TOP     MOV     #(BTM-TOP)             ,COUNT
        MOV     #(BTM-SRC)             ,SRC
        MOV     #(BTM+GAIT-DESTIN-1)   ,DESTIN
LOCOMO  MOV     <SRC                   ,<DESTIN
        DJN     LOCOMO                 ,COUNT
        JMP     $(TOP+GAIT-1)
BTM     END     TOP
