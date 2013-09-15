;redcode quiet
;name Sphinx v2.9
;author W. Mintardjo
;strategy Stone/Spiral program with multi-pass core clear
;strategy Trying other constants
;assert 1

IMP0	EQU IMP
IMP1	EQU IMP+2667
IMP2	EQU IMP+2667+2667

Init	EQU Wait+2584

launch	MOV Stone+4, Init-0
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

	SPL 16, <3708
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
	SPL 8, <6110
	SPL 4, <5617
	SPL 2, <5216
	JMP IMP2+2, <3511
	JMP IMP0+3, <1910
	SPL 2, <2417
	JMP IMP1+3, <3316
	JMP IMP2+3, <4603
	SPL 4, <3602
	SPL 2, <4161
	JMP IMP0+4, <3104
	JMP IMP1+4, <2903
	SPL 2, <2172
	JMP IMP2+4, <1517
	JMP IMP0+5, <1011

Stone	MOV <4+2584+2584, -2584-2584
	SUB 3, -1
	DJN -2, #886
	MOV 1, -2
	JMP -2584, 2584

	DAT #0
	DAT #0
	DAT #0
	DAT #-1000

	DAT #0
	DAT #0

	DAT <-4, <-5
Stomp	SPL 0, <-3
	MOV -2, <-4
	JMP -1, <-5

Wait	SLT #-3592, @Stomp+1
	MOV #-55, @Stomp+1
	JMP -2, <-8

IMP	MOV 0, 2667

