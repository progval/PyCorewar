;redcode
;name     A-Cluster v2.06
;author   Iain Hogg
;strategy Drops coreclears through core
;assert   CORESIZE==8000

        ORG     start
step    EQU     200
killa   MOV.I   $-1, $10
killb   JMP     $-1, >-1
start   MOV.I   $killa, @targeta
        SPL     @targeta, >targeta
        MOV.I   $killb, @targeta
        MOV.I   $killa, @targetb
        SPL     @targetb, >targetb
        MOV.I   $killb, @targetb
        ADD     #step-2, $targetb
        SUB     #(step+2), $targeta
        JMP     start
targeta DAT     $0, #-step
targetb DAT     $0, #step
