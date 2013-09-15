;redcode-94
;name QIMP
;author Franz
;strategy qscan -> imp
;assert 1

step    equ 2667

QB      EQU (start+400)


FOR CORESIZE==55440
  QS EQU 1000
  QD EQU 500
ROF
FOR CORESIZE==8000
  QS EQU 200
  QD EQU 100
ROF

COUNT EQU 6

GAP     EQU 15
REP     EQU 6

        ORG start

        DAT 10*QS,2*QS ; can get 21 values from this table
table   DAT 4*QS,1*QS  ; and can also use the initial value
        DAT 23*QS,3*QS ; of fnd

qbomb   JMP -200,GAP
qinc    DAT GAP,-GAP

tab     ADD.A table,table
slow    ADD.AB @tab,fnd
fast    ADD.B *tab,@slow
which   SNE.I datz,@fnd
        ADD.AB #QD,fnd

        MOV.I qbomb,@fnd
fnd     MOV.I -GAP/2,@QB
        ADD.BA fnd,fnd
        MOV.I qbomb,*fnd
        ADD.F qinc,fnd
        MOV.I qbomb,@fnd
        DJN.B -3,#REP
        JMP boot,}-300

start
         seq.i  QB+QS*0,QB+QS*0+QD
         jmp    which,}QS*13 ; qinc+GAP

         seq.i  QB+QS*1,QB+QS*1+QD
         jmp    fast,}QB+QS*1+QD/2
         seq.i  QB+QS*2,QB+QS*2+QD
         jmp    fast,{tab
         seq.i  QB+QS*3,QB+QS*3+QD
         jmp    fast,}tab

         seq.i  QB+QS*13,QB+QS*13+QD
         jmp    fast,{fast

         seq.i  QB+QS*4,QB+QS*4+QD
         jmp    >fast,}QB+QS*4+QD/2
         seq.i  QB+QS*5,QB+QS*5+QD
         jmp    slow,}QB+QS*5+QD/2
         seq.i  QB+QS*6,QB+QS*6+QD
         jmp    slow,{tab
         seq.i  QB+QS*7,QB+QS*7+QD
         jmp    slow,}tab

         seq.i  QB+QS*10,QB+QS*10+QD
         jmp    >fast,<tab
         seq.i  QB+QS*11,QB+QS*11+QD
         jmp    slow,<tab
         seq.i  QB+QS*12,QB+QS*12+QD
         djn.f  slow,tab

         seq.i  QB+QS*23,QB+QS*23+QD
         jmp    >fast,>tab
         seq.i  QB+QS*24,QB+QS*24+QD
         jmp    slow,>tab

         seq.i  QB+QS*17,QB+QS*17+QD
         jmp    slow,{fast

         seq.i  QB+QS*8,QB+QS*8+QD
         jmp    <fast,}QB+QS*8+QD/2
         seq.i  QB+QS*9,QB+QS*9+QD
         jmp    tab,}QB+QS*9+QD/2

         seq.i  QB+QS*15,QB+QS*15+QD
         jmp    tab,<tab
         seq.i  QB+QS*16,QB+QS*16+QD
         jmp    tab,{tab
         seq.i  QB+QS*20,QB+QS*20+QD
         djn.f  <fast,tab
         seq.i  QB+QS*21,QB+QS*21+QD
         jmp    tab,{fast
         seq.i  QB+QS*22,QB+QS*22+QD
         djn.f  tab,tab
         seq.i  QB+QS*27,QB+QS*27+QD
         jmp    <fast,>tab
         seq.i  QB+QS*28,QB+QS*28+QD
         jmp    tab,>tab

         seq.i  QB+QS*30,QB+QS*30+QD
         jmp    tab,}tab

         jmp boot,<-5000
        
        DAT 0,0
        DAT 0,0
        DAT 0,0
        DAT 0,0
        DAT 0,0
        DAT 0,0
        DAT 0,0
        DAT 0,0
        DAT 0,0
        DAT 0,0
        DAT 0,0
        DAT 0,0
        DAT 0,0
        DAT 0,0
        DAT 0,0

boot    SPL 8
        SPL 4
        SPL 2
        JMP imp
        JMP imp+step
        SPL 2
        JMP imp+(step*2)
        JMP imp+(step*3)
        SPL 4
        SPL 2
        JMP imp+(step*4)
        JMP imp+(step*5)
        SPL 2
        JMP imp+(step*6)
        JMP imp+(step*7)
imp     MOV.I #step,*0
        
datz    END

