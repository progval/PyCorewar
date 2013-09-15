;redcode quiet
;name Sphinx v5.1
;author W. Mintardjo
;strategy Stone/Spiral program with multi-pass core clear
;strategy Decoy added
;assert 1
;Wayne. I'm not bluffing. *grin*. only if I don't mail this to KotH

IMP0    EQU (IMP+666)
IMP1    EQU (IMP0+2667)
IMP2    EQU (IMP1+2667)

Init    EQU wait+2584

launch  MOV Stone+4, Init
        MOV Stone+3, <-1
        MOV Stone+2, <-2
        MOV Stone+1, <-3
        MOV Stone+0, <-4
        MOV Stomp+0, <-5

        SPL Init-5, <Init-1742
        SPL Init-5, <Init-3754
        SPL Init-5, <Init-7302
        SPL Init-5, <Init-6542
        SPL Init-5, <Init-5666

        SPL 9, <Init-1206
        SPL 5, <Init-3902
        SPL 3, <Init-638
        MOV IMP, IMP0
        JMP Init-5, <Init-4114
        JMP IMP0, <Init-5294
        SPL 2, <Init-1606
        JMP IMP1, <Init-6002
        JMP IMP2, <Init-2006
        SPL 4, <Init-6406
        SPL 2, <Init-6946
        JMP IMP0+1, <Init-7606
        JMP IMP1+1, <Init-2442
        SPL 2, <Init-3226
        JMP IMP2+1, <Init-4874
        JMP IMP0+2, <Init-934

Stone   MOV <4+2584+2584, -2584-2584
        SUB 3, -1
        DJN -2, #877
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

wait    SLT #-3270, @Stomp+2
        MOV #-6, @Stomp+2
        JMP -2, <-8

        SPL 0, 1
        SPL 0, 1
        SPL 0, @1
        SPL 0, 1
        SPL 0, @1
        JMP 2897, 1
        SPL 0, 1
        SPL 0, @1
        SPL 0, 1
        SPL 0, 1
        SPL 0, @1
        SPL 0, 1
        SPL 0, @1
        JMP 2905, 1
        SPL 0, @1
        SPL 0, @1
        SPL 0, @1
        SPL 0, 1
        SPL 0, 1
        SPL 0, @1
        SPL 0, 1
        JMP 2913, @1
        SPL 0, 1
        SPL 0, @1
        SPL 0, @1
        SPL 0, @1
        SPL 0, @1
        SPL 0, 1
        SPL 0, 1
        JMP 2921, @1
        SPL 0, @1
        SPL 0, 1
        SPL 0, @1
        SPL 0, @1
        SPL 0, 1
        SPL 0, 1


IMP     MOV 0, 2667

        JMP 2929, @2667            ; Distracting imp code
        SPL 0, 2667
        SPL 0, @2667
        SPL 0, @2667
        SPL 0, 2667
        SPL 0, @2667
        SPL 0, 2667
        SPL 0, @2667
        JMP 2937, 2667
        SPL 0, @2667
        SPL 0, 2667
        SPL 0, @2667
        SPL 0, @2667
trap    SPL 3, @2667
        SPL 2, 2667
        SPL 1, @2667
        SPL 0, 2667
btrap   JMP -1, 2667

        END launch
