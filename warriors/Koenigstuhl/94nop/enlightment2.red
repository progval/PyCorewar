;redcode 94
;name Enlightenment II
;author Scott Manley
;strategy Scan -> Carpet Bomb bomb -> split to Imp gate / Multi pass  forward 
; travelling core clear
;assert CORESIZE==8000
;inc EQU 8 scores 373
;inc EQU 9 scores 431
;inc EQU 10 scores 417
;inc EQU 11 scores 463
;inc EQU 12 scores 452
;inc EQU 13 scores 474
;inc EQU 14 scores 466
;inc EQU 15 scores 490
;inc EQU 16 scores 503
;inc EQU 20 scores 530

plength EQU     45
inc     EQU     20
carpet  EQU     (CORESIZE-MINDISTANCE)/inc

step equ 127

adds    DAT     #inc , #inc
begin   SPL     clear2
start   SEQ.I   *scan, @scan
        SPL     stun, > -104        
cont    ADD.F   adds , scan
        DJN     start , count
        JMP     igate , > -107 
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
;subs    DAT     #inc-10,#inc
target1 DAT     -100 , -123
target2 DAT     22 , -22
target3 DAT     -1 , -21
target4 DAT     -2 , -20
        DAT     0 , 0
cbomb   DAT     0 , 0
        DAT     0 , 0
igate   JMP     0 , > adds
clear2  MOV.I   sbomb , { target1
        DJN     clear2 , target1
        ;JMP     clear4
clear3  MOV.I   target2 , } target2
        DJN     clear3 , target2
clear1  MOV.I   sbomb , { target4  
        DJN     clear1 , target4
        ;JMP     0 , > -10
clear4  MOV.I   cbomb , { target3
        DJN     clear4 , target3
sbomb   SPL     0 , 0
sbomb2  JMP     -1
count   DAT     #carpet-1,#carpet-1
        END     begin
