;redcode-lp
;name The Ring'o matic v04
;author G.Labarga
;assert MAXPROCESSES==8 && CORESIZE==8000
;strategy P-spaced imps
;strategy ver. 0.4

pin 2200

;--- EQU's
;P-brain:
 CT0 EQU 232 ;state constants
 CT1 EQU 248
 CT2 EQU 194
 CT3 EQU 147
 CT4 EQU 119
 CT5 EQU 66
 CT6 EQU 24
 CT7 EQU 294
 CT8 EQU 154
 CT9 EQU 35
 C_LOSS EQU 7 ;result constants
 C_WIN EQU 4
 C_TIE EQU 11
 C_SCD EQU 2323  ;self-detect constant
 STRAT0 EQU boot1 ;strategy labels
 STRAT1 EQU boot2
 STRAT2 EQU boot3
 D_RESULT EQU 0  ;P-space addresses
 D_STATE EQU 250
 D_SELF EQU 114
 D_SCD EQU 311

;--- Now, the code

imp3: mov.i #-581,2667  ;3pt B-imp

boot1: add.a <1,bf    ;launcher mutation
boot2: spl @4,>1   ;ring2
 spl 1,>0
spd: spl 2,}1   ;vector launch, ("vortex"?)
bf: djn.a @mgo,#0
af: djn.a *mgo,#-3
 dat 0,0
vector: dat }imp3+2668 ,}imp3+1 ;partial spiral + A-ring
 dat }imp3+5334 ,}imp3+2667
 dat }imp3 ,}imp2+5334
mgo: dat }imp2+2667 ,}imp2
 dat }imp3+2669 ,}imp3+2 ;full spiral
 dat }imp3+5335 ,}imp3+2668
 dat }imp3+1 ,}imp3+5334
rgo: dat }imp3+2667 ,}imp3
for 10
 dat 0,0
rof
imp2: mov.i #2667,*0   ;3pt A-imp

boot3: spl #1007,1007   ;ringk2
 add.f boot3,2
 mov imp4,@1
 jmp imp4-2014,imp4-1007

imp4: mov.i #1,1   ;1pt B-imp

dg for (MAXLENGTH-CURLINE)-29  ;decoy
 dat }-581,{1100+(10*dg)
rof
mark: STP.A #C_SCD,DONE ;set sucide flag
RESULT: DAT 0,C_LOSS  ;P-brain: ten stated table switcher
 DAT 0,C_WIN
 DAT 0,C_TIE

start: LDP.A #D_RESULT,RESULT
DONE: LDP.AB #D_SCD,#0
 JMN.B self,DONE  ;self check done?
 JMN.A @0,*RESULT ;suicide in the first round
 STP.A RESULT,CHK ;self chek
CHK: LDP.A #D_SELF,#0
 SEQ.A RESULT,CHK
 JMP mark
 STP.A #1,>mark  ;Self check done
self: JMN.A NEXT,RESULT
 SNE.BA DONE,mark ;its me?
SUICIDE:DAT 0,0   ;suicide again

NEXT: LDP.BA SAVE,STATE
 MOD.BA *RESULT,STATE
SAVE: STP.B *STATE,#D_STATE
STATE: JMP }0,#CT0  ;initial state: ring-g (next one)
TABLE: DAT STRAT0,{CT1  ;ring-g
 DAT STRAT1,{CT2  ;ring2
 DAT STRAT2,{CT3  ;ringk2
 DAT STRAT2,{CT4  ;ringk2
 DAT STRAT1,{CT5  ;ring2
 DAT STRAT0,{CT6  ;ring-g
 DAT STRAT1,{CT7  ;ring2
 DAT STRAT1,{CT8  ;ring2
 DAT STRAT2,{CT9  ;ringk2

 end start

