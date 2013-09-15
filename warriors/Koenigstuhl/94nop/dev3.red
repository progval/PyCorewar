;redcode-94
;name Dev3
;author Roy van Rijn
; <roy_van_rijn@hotmail.com>
;assert 1

offset          equ     (CORESIZE-25)

                JMP     3
                DAT     0,27
                DAT     0,0
Field           ADD     #31, -1
                MOV     -5, @-2
                SEQ     -3,-4
                JMP     -3

CoreClear       SPL     5
                JMP     2
                DAT     0,-30
                MOV     10,<-1
                JMP     -1

Copy            ADD.I   #1,1
                MOV     -7,offset-7
                SNE     offset+5,offset+6
                JMP     -3
                ADD.A   #-8,offset-3
                ADD.AB  #-8,offset-4
                MOV     2,offset-8008
                JMP     offset -6 -6

