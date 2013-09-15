;redcode 
;name Chimera v3.5
;author W. Mintardjo
;assert CORESIZE==8000

IMP0    EQU imp
IMP1    EQU (IMP0+2667)
IMP2    EQU (IMP1+2667)

step    EQU 283
init    EQU 276
boota   EQU 3211
spacea  EQU 8
spaceb  EQU 1

;       decoys go here

setup   MOV trap, boota
ptra    MOV start+3, boota-spacea+setup+2
        MOV start+2, boota-spacea+setup+1
        MOV start+1, boota-spacea+setup
        MOV start+0, boota-spacea+setup-1
ptrb    MOV clear+2, boota+spaceb+setup+2
        MOV clear+1, boota+spaceb+setup+1
        MOV clear+0, boota+spaceb+setup
        MOV dbomb, boota+spaceb+setup+step

        SPL 16, <3706
        SPL 8, <1933
        SPL 4, <1812
        SPL 2, <2009
        JMP IMP0, <7368
        JMP IMP1, <6011
        SPL 2, <5810
        JMP IMP2, <4809
        JMP IMP0+1, <3908
        SPL 4, <7515
        SPL 2, <4914
        JMP IMP1+1, <2213
        JMP IMP2+1, <7212
        SPL 2, <7011
        JMP IMP0+2, <6710
        JMP IMP1+2, <6509
        SPL 8, <6108
        SPL 4, <5615
        SPL 2, <5214
        JMP IMP2+2, <3509
        JMP IMP0+3, <1908
        SPL 2, <2415
        JMP IMP1+3, <3314
        JMP IMP2+3, <4601
        SPL 4, <3600
        SPL 2, <4159
        JMP IMP0+4, <3102
        JMP IMP1+4, <2901
        SPL 2, <2168
        JMP IMP2+4, <1515

        SPL boota-spacea+setup-1, <7115
        SPL boota-spacea+setup-1, <6302
        SPL boota-spacea+setup-1, <5301
        SPL boota-spacea+setup-1, <5900
        JMP boota-spacea+setup-1, <1112

dbomb   DAT <1-(spacea+spaceb+spacea+spaceb), <1-(spacea+spaceb+spacea+spaceb)

start   SPL 0, spacea+1
s       MOV spacea, @spacea		  ;JMP spot
        SUB spacea+spaceb+s, @-1
p       DJN s, <3154
trap    JMP spaceb-init, <init
clear   MOV step, <0-step
        SPL clear, <-183
        SPL -1

imp     MOV imp, imp+2667

        END setup
