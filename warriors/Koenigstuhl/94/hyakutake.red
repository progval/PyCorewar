;redcode-b
;name Hyakutake C/1996 B2
;author Scott Manley
;strategy Another Pspacer
;assert 1

strat   SPL     0,0
record  SPL     #0,#250
last    SPL     #0,#7
think   LDP.A   #0,last
        LDP.A   #1,record
        LDP.A   #2,strat
        ADD.AB  last,last
        JMP     @last
        JMP     boot
        JMP     lost
        JMP     won
        SLT.AB  record,record
        JMP     cs1
        STP     #0,#2
        JMP     boot,0
cs1     STP     #1,#2
        JMP     strat1
lost    ADD.A   #10,record
        MOD.A   #20,record
        ADD.A   #-10,record
        MOD.A   #2,strat
        JMZ.A   ls0,strat
        STP     #0,#2
        ADD.A   #1,record
        STP.AB  record,#1
        JMP     boot
ls0     STP     #1,#2
        ADD.A   #-1,record
        STP.AB  record,#1
        JMP     strat1
won     JMZ.A   ws0,strat
        ADD.A   #-1,record
        STP.AB  record,#1
        JMP     strat1
ws0     ADD.A   #1,record
        STP.AB  record,#1
boot    MOV.I   jmpb, -3500
        MOV.I   {boot,<boot
        MOV.I   {boot,<boot
        MOV.I   {boot,<boot
        MOV.I   {boot,<boot
        MOV.I   {boot,<boot
        MOV.I   {boot,<boot
        MOV.I   {boot,<boot
        MOV.I   {boot,<boot
        MOV     -1,boot
        JMP     -3516
inc     DAT     <-2936,<-2936
loop1   MOV     splb,*2
        MOV     jmpb,@1
        MOV     -2938,*-2936
        ADD.F   inc,-1
        DJN     loop1,#999
splb    SPL     0,<-3
        MOV     inc,<1
jmpb    JMP     -1,<-3
        SPL     0,0
        DAT     1,1
        DAT     1,1
        DAT     1,1
strat1  SPL     1, <300
        SPL     1, <400
        SPL     1,<500
silk    SPL     @0,{2200
        MOV.I   }-1,>-1 
silk1   SPL     @0,<3740
        MOV.I   }-1,>-1
        MOV.I   bom,>933
        MOV     {silk1,<silk2
silk2   JMP     @0,>-1278
bom     DAT     <2667,<1
        DAT     0,0
        DAT     0,0
        DAT     1,1
        DAT     1,1
        SPL     0,0
        SPL     0,1
        SPL     1,0
        SPL     1,1
        SPL     0,-1
        STP     0,>-1
        SPL     0,0
        STP     #0,{0
        SPL     0,1
        SPL     0,0
        STP     0,>-1
        SPL     1,0
        SPL     0,0
        STP     #0,}0
        SPL     0,1
        SPL     1,1
        SPL     0,1
        STP     #0,}0
        SPL     0,1
        SPL     1,1
        SPL     0,0
        SPL     #1,0
        SPL     0,0
        SPL     1,1
        JMP     -2,-2
        END     think   
