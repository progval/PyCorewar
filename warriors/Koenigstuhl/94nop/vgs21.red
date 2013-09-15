;redcode-b
;name Voodoo Glow Skull v2.1
;author Gene Gomez
;strategy Q-scan -> bomber
;assert 1

space   EQU ((CORESIZE-(MINDISTANCE*2))/81)
qbomb   EQU 6
strap   EQU 3571
step    EQU 153

init    SPL scan2
scan1a  FOR 5
        SNE.X space*(4*(scan1a-1)+1)+bottom, space*(4*(scan1a-1)+3)+bottom
        SEQ.X space*(4*(scan1a-1)+2)+bottom, space*(4*(scan1a-1)+4)+bottom
        MOV #space*(4*(scan1a-1)+1)+bottom-found, found
        ROF

        JMN.B found, found

scan1b  FOR 5
        SNE.X space*(4*(scan1b-1)+21)+bottom, space*(4*(scan1b-1)+23)+bottom
        SEQ.X space*(4*(scan1b-1)+22)+bottom, space*(4*(scan1b-1)+24)+bottom
        MOV #space*(4*(scan1b-1)+21)+bottom-found, found
        ROF

        JMP boot
scan2

scan2a  FOR 10
        SNE.X space*(4*(scan2a-1)+41)+bottom, space*(4*(scan2a-1)+43)+bottom
        SEQ.X space*(4*(scan2a-1)+42)+bottom, space*(4*(scan2a-1)+44)+bottom
        MOV #space*(4*(scan2a-1)+41)+bottom-found, found
        ROF

        SNE.B backwd, #0
        JMN.B found, found
boot

boot1   FOR 7
        MOV (boot1-1)+split, strap
        ROF

        MOV data, strap-104
        JMP @1, }0
data    DAT <-98, #boot+strap+1
split   SPL #0, <-250
warrior MOV jump, @3
        MOV split, <2
        ADD #step, 1
        JMP warrior, 152
        MOV @-4, <94
jump    JMP -1, 1
        ADD #space, found
found   JMZ.F -1, 0
        MOV.B found, backwd
forward MOV.I first, >found
        MOV.I second, @found
        ADD #(qbomb-1), found
        JMN.F forward, @found
        SUB #(2*qbomb), backwd
backwd  MOV.I second, 0
        MOV.I first, <backwd
        SUB #(qbomb-1), backwd
        JMN.F backwd, @backwd
        JMP boot
first   SPL #0, #2
second  MOV -1, >-1
bottom  END init
