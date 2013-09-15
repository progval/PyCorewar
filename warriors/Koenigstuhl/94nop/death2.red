;redcode 94
;name DeathWalker II
;author Scott Manley
;strategy Scan -> SPL/JMP bomb -> split to Imp gate / 2 pass  forward 
;strategy travelling core clear
;strategy Wilkinson Benchmark score 44.4
;strategy Percentage Record         8/72/20
;assert CORESIZE==8000

step equ 127

adds    DAT     #8 , #8
begin   SPL     clear2
start   SEQ.AB  *scan, @scan
        JMP     scan1        
cont    ADD.F   adds , scan
        DJN     start , count
        JMP     clear3  
scan1   MOV     sbomb , * scan 
scan2   MOV     sbomb2 , @ scan 
        JMP     cont
scan    DAT     28 , 29
target1 DAT     27 , -27
target2 DAT     26 , -26
        DAT     0 , 0
        DAT     0 , 0
        DAT     0 , 0
        DAT     0 , 0
        DAT     0 , 0
        JMP     0 , } cont
clear2  MOV.I   sbomb , } target1
        DJN     clear2 , target1
clear3  MOV.I   target2 , } target2
        DJN     clear3 , target2
        JMP     launch    
imp     MOV 0,step
launch  SPL 1     ;1 process
        SPL 1     ;2 processes
        SPL 1     ;4 processes
        SPL 1     ;8 processes
        SPL 1     ;16 processes
        MOV -1,0  ;32 processes
        SPL 1     ;63 processes
        SPL 2     ;126 processes
spread  JMP @spread,imp
        ADD #step,spread
sbomb   SPL     0 , 0
sbomb2  JMP     -1
count   DAT     #994,#994
        END     begin

