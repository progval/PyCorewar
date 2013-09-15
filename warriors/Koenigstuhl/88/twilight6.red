;redcode quiet
;name Twilight Pits v6.0
;author W. Mintardjo
;strategy v1: bombs --> pits --> slavers
;strategy v2: 2 pass core-clear (1 SPL + 1 DAT)
;strategy v3: simplification of version 2. One pass and delayed core-clear
;strategy v4: IMP protection aided with DJN stream. DJN reset core-clear
;strategy v5: Separated module. Different init
;strategy v6: Launched code. Draining more enemy's process. Use decoys
;strategy   : Different step-size
;strategy Bugs: Its mirror is unprotected
;assert 1
step    EQU 91
init    EQU 86
boota   EQU 3000
spacea  EQU 6
spaceb  EQU 8

setup   MOV trap, boota
ptra    MOV start+3, boota-spacea+setup+2
        MOV start+2, boota-spacea+setup+1
        MOV start+1, boota-spacea+setup
        MOV start+0, boota-spacea+setup-1
ptrb    MOV clear+3, boota+spaceb+setup+1
        MOV clear+2, boota+spaceb+setup
        MOV clear+1, boota+spaceb+setup-1
        MOV clear+0, boota+spaceb+setup-2
        MOV dbomb, boota+spaceb+setup-2+step
        JMP boota-spacea+setup-1, <1112

dbomb   DAT <0-(spacea+spaceb-2+spacea), <0-(spacea+spaceb-2+spacea)

;       Put some decoys here

start   SPL 0, <0-(spacea-1)
s       MOV spacea, @spacea               ;JMP spot
        SUB spacea+spaceb+s-2, spacea+s
p       DJN s, <3025
trap    JMP spaceb-2-init, <init
clear   MOV step, <0-step
        SPL clear
        SPL 0
        SPL -1

;       And also put some decoys here

        END setup
