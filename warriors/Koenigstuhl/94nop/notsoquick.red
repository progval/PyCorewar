;redcode-94
;author Franz
;name NotSoQuickScan
;strategy Quickscan with tiny killable footprint but a but only 100%c
;strategy just a test i put spl/spl/dat/dat coreclear to it
;url http://www.azstarnet.com/~franz
;assert CORESIZE==8000

QS  EQU 400
QI  EQU 65
QBI EQU 13
REP EQU 4
SCANS EQU 50
whichl EQU whichp-1

scan		SEQ *whichl,@whichl
		JMP kill,<-300
decer		DJN.F scan,scan

which 		
p		FOR SCANS
		SPL #QS+(((p*2)-1)*QI),<QS+(p*2*QI)
		ROF
whichp

		DAT 0,0
		DAT <-5,<-7
		SPL #-5,<-6
boot		SPL #-4,<-20
		MOV *2,<2
		JMP -1,<-100
		DAT -3,-21

kill		SNE.B scan,#1
		JMP boot,<-300
		
		MOV.I @scan,which		
		ADD.F scan,which
		
		MOV.I dbomb,*which

		SEQ datz,@which
		MOV.BA which,which

		ADD.A #QBI,which

		MOV.I dbomb,*which
		SUB.A #QBI,which
		DJN -2,#REP

		JMP boot,<-500

dbomb		DAT >2667,>2667*2
datz		END scan

