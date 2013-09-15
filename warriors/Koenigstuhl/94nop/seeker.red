;redcode
;author CapnStrong
;name Seeker .5c
;strategy .5c Scan -> SPL carpet
;strategy Ends with DAT coreclear
;kill Seeker .5c
;assert 1

org start

; ------------------------
pointer     DAT 0, 0
            DAT 0, 0
; ------------------------
seeker      ADD   #88, pointer 
            JMZ.f seeker, @pointer
carpet      MOV   bomb, >pointer
            DJN   -1, #8
            MOV   #8, -1
            JMN.a seeker, pointer-8
bomb        SPL   #0, #0
            MOV   2, >pointer
            DJN.f -1, >pointer
            DAT   <2667, #20
; ------------------------
            for 4
                 DAT 0, 0
            rof
            DAT 0, 0
            for 7
                 DAT 0, 0
            rof
            DAT 0, 0
            for 7
                 DAT #5, #5
            rof
            DAT 0, 0
; ------------------------
start       add.a  #5, pointer-8
            JMP seeker
; ------------------------
end

