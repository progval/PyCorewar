;redcode-94nop
;name Wallpaper
;author Christian Schmidt
;strategy mini q^4 -> paper / stone
;strategy anti-imp coreclear paper, based
;strategy on Head or Tail's paper engine
;strategy using mov.i #1, <1
;strategy Stone and the rest are stolen
;strategy from Grabun's Purifier.
;strategy not well optimized
;assert 1

	org  qGo

pstep1 	EQU 	2200
pstep2 	EQU 	3740
pstep3 	EQU 	3044
bstep1      EQU   2335

pHit 	equ  	7235

sStep 	equ  	598
sTime 	equ  	1698
sOff 	      equ  	7430;7770

pGo     spl     1 		, }qC
qTab2   spl     1 		, }qD
        spl     1 		, }qE

pSilk0  spl     @0,      <pstep1
        mov     }-1,     >-1
        spl     @0,      <pstep2
        mov     }-1,     >-1
        spl     @0,      <pstep3
        mov     }-1,     >-1
        mov.i   #1,      <1
	  djn     -2,      <bstep1

	  for     10
        dat     0 		, 0
        rof

sSpl    spl     #0 		, #0
sMov    mov     sBmb 		, @sDjn
sInc    add     #sStep 		, sDjn
sDjn    djn.f   sMov 		, {sInc-(sTime*sStep)
sBmb    dat     >4 		, >1

bBoot   mov     sSpl 		, sOff-6-CURLINE
        spl     2 		, 0
sDest   spl     2 		, sOff-CURLINE
sSrc    spl     1 		, sBmb+1
        mov     <sSrc 		, <sDest
        djn     @bBoot 		, #5
        jmp     pGo 		, 0

qX    	equ    	6012
qA    	equ    	3090
qB    	equ     2181
qC    	equ     5447
qD    	equ     4538
qE    	equ     3629
qF    	equ     3999

qStep 	equ     7
qTime 	equ     16
qOff  	equ     87

      	for     39
      	dat     0                , 0
      	rof

qBomb 	dat    	{qOff            , qF

      	dat    1000              , qA
qTab1 	dat    1000              , qB

qGo   	sne    qPtr+qX*qE        , qPtr+qX*qE+qE
      	seq    <qTab2+1          , qPtr+qX*(qE-1)+(qE-1)
      	jmp    qDec              , }qDec+2
      	sne    qPtr+qX*qF        , qPtr+qX*qF+qD
      	seq    <qBomb            , qPtr+qX*(qF-1)+qD
      	jmp    qDec              , }qDec
      	sne    qPtr+qX*qA        , qPtr+qX*qA+qD
      	seq    <qTab1-1          , qPtr+qX*(qA-1)+qD
      	djn.a  qDec              , {qDec
      	sne    qPtr+qX*qB        , qPtr+qX*qB+qD
      	seq    <qTab1            , qPtr+qX*(qB-1)+qD
      	djn.a  qDec              , *0
      	sne    qPtr+qX*qC        , qPtr+qX*qC+qC
      	seq    <qTab2-1          , qPtr+qX*(qC-1)+(qC-1)
      	jmp    qDec              , {qDec+2
      	sne    qPtr+qX*qD        , qPtr+qX*qD+qD
      	jmz.f  bBoot             , <qTab2

qDec  	mul.b  *2                , qPtr
qSkip 	sne    *qTab1            , @qPtr
      	add.b  qTab2             , qPtr
qLoop 	mov    qBomb             , @qPtr
qPtr  	mov    qBomb             , }qX
      	sub    #qStep            , @qSkip
      	djn    qLoop             , #qTime
      	djn.f  bBoot             , #0

      	end

