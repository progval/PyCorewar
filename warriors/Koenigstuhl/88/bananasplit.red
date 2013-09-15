;redcode verbose
;author Frank J. T. Wojcik
;name Banana Split v1.4
;strategy Program which acts like three different ones.
;strategy v1.0 -- Initial release. Slow and long.
;strategy v1.1 -- No more bootstrap! Faster. Better bomber.
;strategy v1.2 -- *Much* faster bomber. Probably won't do much, but...
;strategy v1.3 -- Fixed a really stupid bug introduced in 1.2.
;strategy v1.4 -- Turned final bomber into 2/3 imp-gate when done.
;assert 1

fp      JMP 1,<-5               ;Front Program Top
        JMP 1,<-6
        ADD #1,cnt
        JMP 1,<-8
        JMP -3,<-9              ;Front Program Bottom
        DAT #0, #0
        for 30
        DAT #0, #0
        rof
        DAT #0, #0
cnt     DAT #0, #4000
boot    SPL fp,<fp-5            ;Launch Front Program
        SPL bp,<fp-5            ;Launch Back Program
        MOV bomb,<bomb
        MOV bomb,<bomb
        CMP #4000,cnt
        JMP attack,<fp-5
        JMP -4,<fp-5
attack  MOV mvpt1,fp+4          ;First, kill off out old processes, because
        MOV mvpt1,bp+2          ;WE'VE BEEN ATTACKED!!!!!!!!!!!!!!!!!!!!!!!!!
        SLT #4000, cnt          ;But in which direction?
        ADD #-600,mvpt2         ;If 0>cnt (cnt<0), #1 failed --> move fwd
        MOV <mvpt1,<mvpt2       ;If 0<cnt (cnt>0), #2 failed --> move bck
        CMP @mvpt1,cpb          ;Copy the retaliation program...
        JMP -2,<fp+15
        JMP @mvpt2,<fp+15       ;...and launch it!
mvpt1   DAT #0,#cpe+1
mvpt2   DAT #0,#300
cpb     spl 0,<-1
loop    add #3039,ptr
ptr     mov cpb,81
        jmp loop
        mov 1, <1
cpe     DAT <-3,#-3
        DAT #0, #0
        for 31
        DAT #0, #0
        rof
        DAT #0, #0
bomb    DAT #0, #fp-7
bp      MOV bomb,<bomb          ;BEGIN-->Back Program
        ADD #-1,cnt
        MOV bomb,<bomb
        JMP -3,<fp-5
        END boot
