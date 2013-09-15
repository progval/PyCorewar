;redcode-94
;name Whatever
;author Ilmari Karonen
;strategy RetroQ scan -> 2*(bomb dodger -> d-clear)
;assert CORESIZE == 8000
;planar quick, scan, stone, other, boot, clear, gate

dstep   equ     40
cptrA   equ     (clearA-3)
cendA   equ     (cbmbA+2)
cptrB   equ     (clearB-3)
cendB   equ     (cbmbB+2)

;  RQ^2, like Anton's Probe only backward

QB EQU (start-350)
QS EQU (0-200)
QD EQU (0+100)

GAP EQU 8
REP EQU 15
datz     equ (start-200)         ; save one instruction

         dat    10*QS, 2*QS      ; can get 21 values from this table
table:   dat     4*QS, 1*QS      ; and can also use the initial value
         dat    23*QS, 3*QS      ; of fnd
qbomb:   dat    -GAP,GAP
qincr    dat    -GAP,2*GAP

         dat start+1,0           ; very important!
tab:     add.a  table  ,table    ; translate found location
slow:    add.ab @tab   ,fnd
fast:    add.b  *tab   ,@slow
which:   sne.i  datz   ,@fnd
ptrA     add.ab #QD    ,fnd

         add.ba fnd    ,fnd
         spl    attack2          ; start primary bomber
         
attack1  add.b  fnd,fnd2         ; redundant bomber bombs left-to-right
bmb1     mov.i  qbomb  ,@fnd2
fnd2     mov.i  qbomb  ,@fnd-(GAP*REP)/2-GAP/2
         add    #2*GAP ,fnd2
bcnt     djn    -3     ,#REP/2
         spl   keyB   ,0        ; start dodgers
keyA     djn.a seekA  ,RetinA   ; if not already started
RetinA   dat 2,2

skipA   add.a   #dstep, ptrA
seekA   sne.i   }ptrA, }ptrA     ; 1.5c sweep
        jmz.f   seekA, }ptrA
        jmn.f   skipA, }ptrA     ; is it really a bomb?
dodgeA  mov.i   {cfromA, {ptrA
        djn.b   dodgeA, #4
        jmp     *ptrA, >666
cfromA  spl     #cbmbA+1
clearA  mov.i   cbmbA, >cptrA
        djn.f   clearA, >cptrA
cbmbA   dat     >5335, cendA-cptrA


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
ptrB     seq.i  QB+QS*22,QB+QS*22+QD
         djn.f  tab,tab
         seq.i  QB+QS*27,QB+QS*27+QD
         jmp    <fast,>tab
         seq.i  QB+QS*28,QB+QS*28+QD
         jmp    tab,>tab

skipB   add.ab  #dstep, ptrB
seekB   sne.i   >ptrB, >ptrB     ; 1.5c sweep
        jmz.f   seekB, >ptrB
        jmn.f   skipB, >ptrB     ; is it really a bomb?
dodgeB  mov.i   {cfromB, <ptrB
        djn.b   dodgeB, #4
        jmp     @ptrB, >666
cfromB  spl     #cbmbB+1
clearB  mov.i   cbmbB, >cptrB
        djn.f   clearB, >cptrB
cbmbB   dat     >5335, cendB-cptrB


attack2  mov    qbomb  ,*fnd     ; primary bomber
         mov.i  qbomb  ,@fnd     ; bombs left and right from found location
fnd:     mov.i  -GAP/2 ,@QB
         add    qincr  ,fnd
         djn    -4     ,#REP/2
         spl   keyA   ,0        ; start dodgers
keyB     djn.b seekB  ,RetinA   ; if not already started

         end start
