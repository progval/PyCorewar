;redcode-94
;name Frogz
;author Franz
;strategy qscan+silk
;assert CORESIZE==8000 || CORESIZE==55440

len EQU 13

QB EQU (start+400)

;these are the frog constants, Tiberius uses different ones
FOR CORESIZE==55440
fcp EQU (3039*3)
scp EQU (2365*2)
tcp EQU (777)
QS EQU 1000
QD EQU 500
ROF
FOR CORESIZE==8000
fcp EQU 3039
scp EQU 2365
tcp EQU 777
QS EQU 200
QD EQU 100
ROF

COUNT EQU 6

GAP EQU 15
REP EQU 6

                ORG start

;this is probes Q^2 scan exactly. I never found 
;the need to make it better ... and when i 
;did the result was a disaster so it's just 
;about what it was

                DAT 10*QS,2*QS ; can get 21 values from this table
table           DAT 4*QS,1*QS  ; and can also use the initial value
                DAT 23*QS,3*QS ; of fnd

qbomb           JMP -200,GAP
qinc            DAT GAP,-GAP

tab             ADD.A table,table
slow            ADD.AB @tab,fnd
fast            ADD.B *tab,@slow
which           SNE.I datz,@fnd
                ADD.AB #QD,fnd

                MOV.I qbomb,@fnd
fnd             MOV.I -GAP/2,@QB
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
         

;this is a boot away from the qscan to avoid 
;scanners finding us real fast

boot    spl 1,<-3000  ;letz get 13 processes together
        spl 1,<-2000
        mov -1,0
        mov -1,0

        spl     @frog,  >-1000 ;lets boot the silk way
        mov     }-1,    >frog  ;
        dat     >-300,  <300   ;now die ... boot process die ...

;this is the main paper quite a standard from I guess
frog    spl     @0,     <fcp-len
        mov     }-1,    >-1
        spl     @0,     <scp
        mov     }-1,    >-1
        spl     @0,     <tcp
        mov     }-1,    >-1
        mov     bomb,   <-2000
        mov     bomb,   <-1000
        mov     bomb,   <-500
        mov     bomb,   <500
        mov     bomb,   <1000
        mov     bomb,   <2000
bomb    dat     <2667,  }-2
datz    end
