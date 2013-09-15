;redcode-94
;author Franz
;name NotSoQuickScan 2
;strategy Quickscan with tiny killable footprint but a but only 100%c ...
;strategy just a test i put spl/spl/dat/dat coreclear to it
;url http://www.azstarnet.com/~franz
;assert 1

QS      EQU 400
SCANS   EQU 75
QBI     EQU 15
QBO     EQU 15*2
REP     EQU 6
which   EQU wp-1
QI      EQU ((CORESIZE-1000)/(SCANS*2))

        ORG scan

;the scanner itself

scan    SEQ *which,@which
        JMP kill,kill         ;these lines are used by data but
decer   DJN.F scan,scan       ;they pass the test
        JMP boot,boot         ;and are not bombed

p       FOR SCANS/3
        SPL #QS+(((p*2)-1)*(QI*3)),<QS+(p*2*(QI*3))
        ROF
p       FOR SCANS/3
        SPL #QS+(((p*2)-1)*(QI*3))+QI,<QS+(p*2*(QI*3))+QI
        ROF
p       FOR SCANS/3
        SPL #QS+(((p*2)-1)*(QI*3))+(QI*2),<QS+(p*2*(QI*3))+(QI*2)
        ROF
wp

kill    ADD.F scan,@scan
        MOV.I @scan,scan
        
;find out which to bomb
        SEQ datz,@scan
        MOV.BA scan,scan

        MOV.I dbomb,*scan

        ADD.A #QBO,scan

        MOV.I dbomb,*scan
        SUB.A #QBI,scan
        DJN -2,#REP

        JMP boot,<-500

        DAT 0,0
        DAT <-5,<-7
        SPL #-5,<-6
boot    SPL #-4,<-20
        MOV *2,<2
        JMP -1,<-100
        DAT -3,-21

dbomb   DAT >2667,>2667*2
datz    END

