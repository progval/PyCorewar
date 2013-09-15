;redcode 94
;name Enlightenment
;author Scott Manley
;strategy Scan -> Carpet Bomb bomb -> split to Imp gate / Multi pass  forward 
; travelling core clear
;assert CORESIZE==8000

inc     EQU     20
carpet  EQU     (CORESIZE-MINDISTANCE)/inc


adds    DAT     #inc , #inc
begin   SPL     clear2
start   SEQ.I   *scan, @scan
        SPL     stun, > -104        
cont    ADD.F   adds , scan
        DJN     start , count
        JMP     clear3 , > -107 
stun    MOV     scan , targ
        SUB.F   adds , targ
        MOV     sbomb , * targ
sloop   MOV     sbomb2 , { targ 
        MOV     sbomb , > targ 
        MOV     sbomb , { targ
        MOV     sbomb2 , > targ
        MOV     sbomb2 , { targ 
        MOV     sbomb , > targ 
        MOV     sbomb , { targ
        MOV     sbomb2 , > targ
        MOV     sbomb2 , { targ 
        MOV     sbomb , > targ 
        MOV     sbomb , { targ
        MOV     sbomb2 , > targ
        MOV     sbomb2 , { targ 
        MOV     sbomb , > targ 
        MOV     sbomb , { targ
        MOV     sbomb2 , > targ
        MOV     sbomb2 , { targ 
        MOV     sbomb , > targ 
        MOV     sbomb , { targ
        MOV     sbomb2 , > targ
scan    DAT     MINDISTANCE-10 , MINDISTANCE-9
targ    DAT     0,0
target1 DAT     -100 , -123
target2 DAT     22 , -22
target3 DAT     -1 , -21
target4 DAT     -2 , -20
        DAT     0 , 0
cbomb   DAT     0 , 0
        DAT     0 , 0
        JMP     0 , } cont
clear2  MOV.I   sbomb , { target1
        DJN     clear2 , target1
clear3  MOV.I   target2 , } target2
        DJN     clear3 , target2
clear1  MOV.I   target4 , { target4  
        DJN     clear1 , target4
clear4  MOV.I   sbomb , { target3
        DJN     clear4 , target3
        MOV     0,1
sbomb   SPL     0 , 0
sbomb2  JMP     -1
count   DAT     #carpet-1,#carpet-1
        END     start
