;redcode-94
;name Demented 4.0
;author Robert Macrae
;assert CORESIZE == 8000
;strategy Retro Q^2 scan with Augmented D-Clear

; 1.0 Attempts to improve spacing of my bombers.
; 2.0 As 1.0, but protects against Q-damaged dclear.
; 3.0 Tiny tweaks to DClear.
; 4.0 Based on 3, but removes the extra processes from 2.

; DClear is spaced out to resist bombers, and has
; an auxiliary MOV to reduce vulnerability to DATs.
; These are tricks inspired by The Core Clear.


QB       EQU    (start-350)
QS       EQU    (0-200)
QD       EQU    (0+100)

GAP      EQU    8
REP      EQU    15
datz     equ    (start-200)      ; save one instruction

         dat    10*QS, 2*QS      ; can get 21 values from this table
table:   dat     4*QS, 1*QS      ; and can also use the initial value
         dat    23*QS, 3*QS      ; of fnd
qbomb:   dat    -GAP,  GAP
qincr    dat    -GAP,  2*GAP

         dat    start+1,0        ; very important!
tab:     add.a  table  ,table    ; translate found location
slow:    add.ab @tab   ,fnd
fast:    add.b  *tab   ,@slow
which:   sne.i  datz   ,@fnd
         add.ab #QD    ,fnd
         add.ba fnd    ,fnd
         spl    attack2, {800    ; start primary bomber

attack1  add.b  fnd    ,fnd2     ; redundant bomber bombs left-to-right
bmb1     mov.i  qbomb  ,@fnd2
fnd2     mov.i  qbomb  ,@fnd-(GAP*REP)/2-GAP/2
         add    #2*GAP ,fnd2
bcnt     djn    -3     ,#REP
flag     jmp    dclear ,}200

ptr       dat   0,     4000

          dat   -10,   100
          dat   -10,   -10
          dat   -10,   -10
          dat   0,     0
          dat   0,     0
          dat   0,     0

dclear    spl   #0,    }ptr
          mov.i bomb,  >ptr
          mov.i bomb2, >ptr
          djn.f -1,    >ptr
          jmp   -2,    }ptr

;ASSERT (dclear-bmb1) == 12

          dat   }5335, bomb-ptr+3       
bomb      dat   }5335, bomb-ptr+3       ; Another inevitable Kline touch :-)
bomb2     dat   }5335, bomb-ptr+3
          dat   }5335, bomb-ptr+3


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

         jmp    dclear           ; no scan, so start bomber and imp

         dat   0,     0
         dat   0,     0
         dat   0,     0

attack2  mov    qbomb  ,*fnd     ; primary bomber
         mov.i  qbomb  ,@fnd     ; bombs left and right from found location
fnd:     mov.i  -GAP/2 ,@QB
         add    qincr  ,fnd
         djn    -4     ,bcnt
         jmp    dclear ,{700        

;ASSERT (attack2-bmb1) == 73

         end start
