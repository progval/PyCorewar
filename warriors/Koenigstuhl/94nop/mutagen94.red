;redcode-b
;name Mutagen
;author Scott Manley
;strategy Scan -> SPL/JMP bomb -> split to Imp gate / 2 pass  forward 
;strategy travelling core clear
;assert CORESIZE==8000

plength EQU     35
inc     EQU     6
carpet  EQU     (CORESIZE-MINDISTANCE)/inc


adds    DAT     #inc , #inc
begin   SPL     clear2
start   SEQ.I   *scan, @scan
        JMP     scan1        
cont    ADD.F   adds , scan
        DJN     start , count
        JMP     clear3  
scan1   MOV     sbomb , * scan 
scan2   MOV     sbomb2 , @ scan 
        JMP     cont
scan    DAT     MINDISTANCE-10 , MINDISTANCE-9
target1 DAT     23 , -23
target2 DAT     22 , -22
target3 DAT     -1 , -21
target4 DAT     -2 , -20
        DAT     0 , 0
        DAT     0 , 0
        DAT     0 , 0
        JMP     0 , } cont
clear2  MOV.I   sbomb , } target1
        DJN     clear2 , target1
        JMP     clear4
clear3  MOV.I   target2 , } target2
        DJN     clear3 , target2
clear1  MOV.I   target4 , { target4  
        DJN     clear1 , target4
        JMP     0 , > -10
clear4  MOV.I   sbomb , { target3
        DJN     clear4 , target3
        MOV     0,1
sbomb   SPL     0 , 0
sbomb2  JMP     -1
count   DAT     #carpet-1,#carpet-1
        END     begin
