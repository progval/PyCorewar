;redcode-94
;author Franz
;name John Gotti
;rating 68.92 wilkies
;strategy Scanner/Pittrapper/Brainwasher/Coreclear/IMPgate
;strategy the pit is a SPL only pit that tries to cripple the enemy asap
;strategy in spare time the pit brainwashes pspace type enemies
;strategy runs on the big/normal hill in '94ICWS
;strategy You will get "whacked":)
;url http://www.azstarnet.com/~franz
;assert CORESIZE==55440 || CORESIZE==8000

FOR (CORESIZE==55440)
  opt EQU 23435
ROF

FOR (CORESIZE==8000)
  opt EQU 2365
ROF

scanstart       DAT 969,0
scaninc         ADD adder,scanner
scanner         SNE.X scanstart,scanstart+opt
                JMP scaninc,<-100               
                JMP bombme,<-101

                DAT 0,0

bombme          MOV trapbomb,@scanner           
                SUB.BA scanner,@scanner
                MOV trapbomb,*scanner
                JMP sandc

                DAT 0,0

sandc           SUB.A scanner,*scanner
                JMZ.B scaninc,scanstart
                JMP coreclr
                DAT 0,0

                DAT 0,0

coreclr         SPL 0,<-80              
                MOV bombstart,<-3
                MOV bombstart,<-4
                JMP coreclr,<-82        

                DAT 0,0

pit             SPL 0,>-80
p2              SPL -1,}1
p3              STP.AB #0,>-82
p4              JMP pit,>-83
                
                DAT 0,0

bombstart       DAT }-1-80,}-2-80
trapbomb        DJN pit-scanner,}1
adder           DAT #opt*2,#opt*2

                END scaninc
