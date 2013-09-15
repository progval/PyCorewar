;redcode quiet
;name Sphinx v4.7
;author W. Mintardjo
;strategy Stone/Spiral program with multi-pass core clear
;strategy Decoy added
;assert CORESIZE==8000

;contact wangsawm@prism.cs.orst.edu

; Here goes Sphinx again. I strongly believe that my next opponent is either
; Agony or Sucker.

IMP0    EQU IMP
IMP1    EQU (IMP+2667)
IMP2    EQU (IMP+2667+2667)

Init    EQU wait+2584

launch  MOV Stone+4, Init-0
        MOV Stone+3, Init-1
        MOV Stone+2, Init-2
        MOV Stone+1, Init-3
        MOV Stone+0, Init-4
        MOV Stomp+0, Init-5

        SPL Init-5, <7115
        SPL Init-5, <6304
        SPL Init-5, <5303
        SPL Init-5, <5902
        SPL Init-5, <4061

        SPL 8, <1935
        SPL 4, <1814
        SPL 2, <2011
        JMP IMP0, <7370
        JMP IMP1, <6013
        SPL 2, <5812
        JMP IMP2, <4811
        JMP IMP0+1, <3910
        SPL 4, <7517
        SPL 2, <4916
        JMP IMP1+1, <2215
        JMP IMP2+1, <7214
        SPL 2, <7013
        JMP IMP0+2, <6712
        JMP IMP1+2, <6511

Stone   MOV <4+2584+2584, -2584-2584
        SUB 3, -1
        DJN -2, #886
        MOV 1, -2
        JMP -2584, 2584

        DAT #0
ptr     DAT #-2200
        DAT #0
        DAT #0

        DAT #0
        DAT #0

        DAT <-4, <-5
Stomp   SPL 0, <-3
        MOV -2, <ptr
        JMP -1, <ptr

wait    SLT #-3395, @Stomp+2
        MOV #-6, @Stomp+2
        JMP -2, <-8

        SPL 0, 1
        JMP -1, 1
        DAT #wait, #1
        DAT #wait, #1
        SPL 1, 1
        SPL 0, 1
        JMP -1, 1
        DAT #wait, #1
        DAT #wait, #1
        JMZ 2, @1
        SPL 8, <6110
        SPL 4, <5617
        SPL 2, <5216
        JMP IMP2+2, <3511
        JMP IMP0+3, <1910
        SPL 2, <2417
        JMP IMP1+3, <3316
        JMP IMP2+3, <4603
        SPL 1, 1
        SPL 0, 1
        DAT #wait, #1
        DAT #wait, #1
        SPL 1, 1
        SPL 0, 1
        JMP -1, 1
        DAT #wait, #1
        DAT #wait, #1
        SPL 1, 1
        SPL 0, 1
        JMP -1, 1
        SPL 4, <3602
        SPL 2, <4161
        JMP IMP0+4, <3104
        JMP IMP1+4, <2903
        SPL 2, <2172
        JMP IMP2+4, <1517
        JMP IMP0+5, <1011
        DAT #wait, #1
        DAT #wait, #1
        SPL 1, 1
        JMP -1, 1
        SPL 0, 1
        JMP -1, 1
        DAT #wait, #1
        DAT #wait, #1
        SPL 1, 1
        SPL 0, 1
        JMP -1, 1
        DAT #wait, #1
        SPL 1, 1
        SPL 0, 1
        JMP -1, 1
        DAT #wait, #1
        DAT #wait, #1
        DAT #wait, #1

IMP     MOV 0, 2667
