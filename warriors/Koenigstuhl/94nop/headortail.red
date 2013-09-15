;redcode-94
;name Head or Tail
;author Christian Schmidt
;strategy q^2 + lethal anti-imp replicator
;assert 1

QB 	EQU 	(start-350)
QS 	EQU 	(0-200)
QD 	EQU 	(0-100)
GAP 	EQU 	8
REP 	EQU 	15
datz    EQU 	(start-200)
pstep1 	EQU 	2200
pstep2 	EQU 	3740
pstep3 	EQU 	3044
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
bcnt    djn    	-3     ,#REP
        spl   	ibh  ,<ibh  
        jmz   	ibt  ,ibt   
qincr   dat    	-GAP,2*GAP

ibh     spl 	1,0
        spl 	1,>-2000
        spl 	1,>-1000

    	spl     @0,     <pstep1
   	mov     }-1,    >-1
        spl     @0,     <pstep2
        mov     }-1,    >-1
        spl     @0,     <pstep3
        mov     }-1,    >-1
	mov     >1000,      <6335
	mov     >2000,      <4667

	dat	0, 0

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

	spl	ibh

ibt     spl 	1,0
        spl 	1,>-2000
        spl 	1,>-1000

    	spl     @0,     <pstep1
   	mov     }-1,    >-1
        spl     @0,     <pstep2
        mov     }-1,    >-1
        spl     @0,     <pstep3
        mov     }-1,    >-1
	mov     >1000,      <6335
	mov     >2000,      <4667

	dat 	0, 0

attack2 mov    	qbomb  ,*fnd    
        mov.i  	qbomb  ,@fnd    
fnd:    mov.i  	-GAP/2 ,@QB
        add    	qincr  ,fnd
        djn    	-4     ,bcnt
        spl   	ibt  ,<ibt  
        jmz   	ibh  ,ibh   
