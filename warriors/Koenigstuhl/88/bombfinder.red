;redcode verbose
;name Bomb Finder 2.0
;author Devin Kilminster
;assert 1


        JMN p1, <scan         
        JMN p2, <scan
        JMN p3, <scan
        JMN p4, <scan
        JMP -4
scan    DAT #3157

s1              ADD #3364, target1
target1         JMZ -1, 0
                JMP 2
                DAT #111
                MOV target1, save1
                JMP 3, 0
save1           DAT #0, #0
                DAT #111
                MOV bomb1, @target1
                JMP 3, 0
bomb1           DAT #0, #0
                DAT #111
                MOV bomb1, <target1
                JMP 3, 0
                DAT #0, #0
                DAT #111
                MOV save1, target1
                JMP s1, 0
                DAT #0, #0
                DAT #111
p1              MOV scan, <scan
                DJN -1, #6
                JMP s1

s2              ADD #3364, target2
target2         JMZ -1, 0
                JMP 2
                DAT #111
                MOV target2, save2
                JMP 3, 0
save2           DAT #0, #0
                DAT #111
                MOV bomb2, @target2
                JMP 3, 0
bomb2           DAT #0, #0
                DAT #111
                MOV bomb2, <target2
                JMP 3, 0
                DAT #0, #0
                DAT #111
                MOV save2, target2
                JMP s2, 0
                DAT #0, #0
                DAT #111
p2              MOV scan, <scan
                DJN -1, #6
                JMP s2

s3              ADD #3364, target3
target3         JMZ -1, 0
                JMP 2
                DAT #111
                MOV target3, save3
                JMP 3, 0
save3           DAT #0, #0
                DAT #111
                MOV bomb3, @target3
                JMP 3, 0
bomb3           DAT #0, #0
                DAT #111
                MOV bomb3, <target3
                JMP 3, 0
                DAT #0, #0
                DAT #111
                MOV save3, target3
                JMP s3, 0
                DAT #0, #0
                DAT #111
p3              MOV scan, <scan
                DJN -1, #6
                JMP s3

s4              ADD #3364, target4
target4         JMZ -1, 0
                JMP 2
                DAT #111
                MOV target4, save4
                JMP 3, 0
save4           DAT #0, #0
                DAT #111
                MOV bomb4, @target4
                JMP 3, 0
bomb4           DAT #0, #0
                DAT #111
                MOV bomb4, <target4
                JMP 3, 0
                DAT #0, #0
                DAT #111
                MOV save4, target4
                JMP s4, 0
                DAT #0, #0
                DAT #111
p4              MOV scan, <scan
                DJN -1, #6
                JMP s4
