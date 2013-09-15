;redcode
;name Bipolar
;author Planar
;strategy  This is a Q^2 scan (taken from Head or Tail), followed by
;strategy  either a dirty-clear (in the limited-process case) or a
;strategy  paper (in the many-process case).
;strategy  Unfortunately, the dirty-clear is not as efficient as I'd like.
;assert MAXPROCESSES==8 || MAXPROCESSES==8000

;; entry for round 9 of the Redcode Maniacs Tournament.
;; rules: half the battles with normal rules
;;        the other half with limited-process rules.
;;        no pspace.

QB 	EQU 	(start-350)
QS 	EQU 	(0-200)
QD 	EQU 	(0-100)
GAP 	EQU 	8
REP     EQU     15
REP1 	EQU 	8
REP2 	EQU 	6
datz    EQU 	(start-200)

	ORG	start

        dat    	10*QS, 2*QS      
table:  dat    	4*QS, 1*QS      
        dat    	23*QS, 3*QS     
qbomb:  dat    	-GAP,GAP

        dat 	start+1,0           
tab:    add.a  	table  ,table    
slow:   add.ab 	@tab   ,fnd
fast:   add.b  	*tab   ,@slow
which:  sne.i  	datz   ,@fnd
        add.ab 	#QD    ,fnd
        add.ba 	fnd    ,fnd
        spl    	attack2         
         
attack1 add.b  	fnd,fnd2        
bmb1    mov.i  	qbomb  ,@fnd2
fnd2    mov.i  	qbomb  ,@fnd-(GAP*REP)/2-GAP/2
        add    	#2*GAP ,fnd2
bcnt    djn    	-3     ,#REP1
mutex   djn.b   boot, #2

qincr   dat    	-GAP,2*GAP


start:   seq.i  QB+QS*0,QB+QS*0+QD
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


;; Boot the d-clear and determine which half-round we're in.

boot            spl     1
                mov     -1, 0
                mov     -1, 0
                mov     -1, 0

                mov     {bootptr, <bootptr

                jmn.a   @bootptr, bootptr


;; paper for unlimited-process half-round

pstep1          equ     2200
pstep2          equ     3740
pstep3          equ     3044

                spl     @0,     <pstep1
                mov     }-1,    >-1
                spl     @0,     <pstep2
                mov     }-1,    >-1
                mov     4,      >4333
                mov     3,      >pstep2-pstep3-6
                mov     {-4,    <1
                jmp     @0,     <pstep3
                dat     <2667,  <5334


;; second half of the qscan attack

attack2 mov    	qbomb  ,*fnd    
        mov.i  	qbomb  ,@fnd    
fnd:    mov.i  	-GAP/2 ,@QB
        add    	qincr  ,fnd
        djn    	-4     ,#REP2
        djn.b   boot, mutex


;; dirty-clear for limited-process half-round

gate            equ     (bootptr-9)

bootptr         dat     9, 6422

clear           mov.i   *bptr, >gate
                djn.b   clear, >gate
                jmp     clear, {gate

bomb3           dat     bomb3-bptr, bptr-gate
bomb2           jmp     #bomb3-bptr, bptr-gate
bomb1           jmp     #bomb2-bptr, bptr-gate
bptr            dat     bomb0, bptr-gate
bomb0           dat     bomb1-bptr, bptr-gate

                end
