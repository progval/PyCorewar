;redcode-b
;name Hyakutake Engine
;author Scott Manley
;strategy Once it needed to PSpace itself with a paper
;strategy Now lets see what the most up to date version 
;strategy can do on its own.
;assert 1

inc     DAT     <-2936,<-2936
loop1   MOV     splb,*2
        MOV     jmpb,@1
        MOV     -2938,*-2936
        ADD.F   inc,-1
        DJN     loop1,#999
splb    SPL     0,<-3
        MOV     inc,<1
jmpb    JMP     -1,<-3

        END     loop1   

