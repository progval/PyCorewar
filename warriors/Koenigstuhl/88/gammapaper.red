;redcode
;name Gamma Paper 3.0
;author W. Mintardjo
;strategy Stone/Paper, designed to beat some bombers and to tie others
;strategy Version history
;strategy 1.0: Stone/Paper
;strategy 1.2: Better Paper structure
;strategy 1.3: Constant modified
;strategy 2.0: PLASMA protection
;strategy 3.0: A little imp-defense
;assert 1
        MOV #8, 8
Paper2  MOV <-1, <1
        SPL @0, 6501
        MOV 3, <-1
        MOV 3, <-2
        JMZ -5, -5
        MOV @-2667, 2667
        DAT <-1, <-1

label1  SPL 1, <-5550
        SPL 1, <-6101
        SPL 1, <-1212

        SPL Paper4, <-4113
        SPL Paper3, <-4614

        DJN 0, #10
        MOV 102, <1
        JMP -1, label1

        MOV #8, 8
Paper3  MOV <-1, <1
        SPL @0, 6701
        MOV 3, <-1
        MOV 3, <-2
        JMZ -5, -5
        MOV @-2667, 2667
        DAT <-1, <-1

        MOV #8, 8
Paper4  MOV <-1, <1
        SPL @0, 6901
        MOV 3, <-1
        MOV 3, <-2
        JMZ -5, -5
        MOV @-2667, 2667
        DAT <-1, <-1

        MOV #8, 8
Paper5  MOV <-1, <1
        SPL @0, 5901
        MOV 3, <-1
        MOV 3, <-2
        JMZ -5, -5
        MOV @-2667, 2667
        DAT <-1, <-1

        MOV #8, 8
Paper6  MOV <-1, <1
        SPL @0, 5701
        MOV 3, <-1
        MOV 3, <-2
        JMZ -5, -5
        MOV @-2667, 2667
        DAT <-1, <-1

label2  SPL 1, <-7107
        SPL 1, <-6608
        SPL 1, <-4449

        SPL Paper8, <-2220
        JMP Paper7, <-1231

        DAT #2222
        DAT #3333
        DAT #5555

        MOV #8, 8
Paper7  MOV <-1, <1
        SPL @0, 5501
        MOV 3, <-1
        MOV 3, <-2
        JMZ -5, -5
        MOV @-2667, 2667
        DAT <-1, <-1

        MOV #8, 8
Paper8  MOV <-1, <1
        SPL @0, 5301
        MOV 3, <-1
        MOV 3, <-2
        JMZ -5, -5
        MOV @-2667, 2667
        DAT <-1, <-1

label   SPL label2, <-3334

        SPL 1, <-4005
        SPL 1, <-5156
        SPL 1, <-3337

        SPL Paper6, <-6028
        JMP Paper5, <-4319

        DAT #4048, #-4048
        MOV <8, 0
start   SUB -2, -1
        DJN -2, #500       ;Better than DJN A, <B. Avoid scissor decoys

        SPL label, <-516
        SPL label1, <-1517

        SPL 1, <-1018
        SPL 1, <-2019
        SPL 1, <-4000

        SPL Paper2, <-3121

        MOV #8, 0
Paper1  MOV <-1, <1
        SPL @0, 6301
        MOV 3, <-1
        MOV 3, <-2
        JMZ -5, -5
        MOV @-2667, 2667
        DAT <-1, <-1

        END start
