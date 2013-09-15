;redcode-b
;name Eranu v1.03
;author Scott Manley
;strategy Bombs with trains of JMPs to SPL/JMP pit -> Core Clear
;assert 1

        ORG     start
        MOV     targ1 , 500
        MOV     targ1+1 ,500    
        MOV     targ1+2, 500
        MOV     targ1+3 , 500
        MOV     targ1+4 , 500
        MOV     targ1+5 , 500
        MOV     targ1+6 , 500
        MOV     targ1+7 , 500
        MOV     targ1+8 , 500
        MOV     targ1+9 , 500
        MOV     targ1+10 , 500
        MOV     targ1+11 , 500
        MOV     targ1+12 , 500
        MOV     targ1+13 , 500
        MOV     targ1+14 , 500
        MOV     targ1+15 , 500
start   MOV     targ1 , targ1+2000
        MOV     targ1 , targ1+2004
        MOV     targ1 , targ1+2008
        MOV     targ1 , targ1+2012
        MOV     targ1 , targ1+2016
        MOV     targ1 , targ1+4000
        MOV     targ1 , targ1+4004
        MOV     targ1 , targ1+4008
        MOV     targ1 , targ1+4012
        MOV     targ1 , targ1+4016
        MOV     targ1 , targ1+6000
        MOV     targ1 , targ1+6004
        MOV     targ1 , targ1+6008
        MOV     targ1 , targ1+6012
        MOV     targ1 , targ1+6016
        JMP     loop
targ1   DAT     -2 , -2002
targ2   DAT     -4003 , -6003
inc1    DAT     2005 , 2004
inc2    DAT     2004 , 2004
jmpbom  JMP     2000
loop    MOV.I   splbom , }targ1
        MOV.I   jmpmin , *targ1
        MOV.I   jmpbom , @targ1
        MOV.I   jmpbom , *targ2
        MOV.I   jmpbom , @targ2
        SUB.F   inc1 , targ1
        SUB.F   inc2 , targ2
        DJN     loop , #495
splbom  SPL     0 , >-3
        MOV.I   inc2 , <-2
jmpmin  JMP     -1,>-4 
J       FOR     MAXLENGTH-CURLINE
        DAT     J*976016 ,1
        ROF
        END

