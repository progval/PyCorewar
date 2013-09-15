;redcode-94 
;name Fleetfoot in a Rose-Garden
;author Robert Macrae
;strategy A Q^2 Rosebud (in Beppe's honour:)
;assert CORESIZE == 8000

; Q^2 as Probe, with re-ordered scan & DAT attack,
; followed with an unbooted Rosebud.

ORG start

QB EQU (start+400)
QS EQU 206
QD EQU 103
COUNT EQU 6

GAP EQU 15
REP EQU 6

         dat    10*QS, 2*QS ; can get 21 values from this table
table:   dat     4*QS, 1*QS ; and can also use the initial value
         dat    23*QS, 3*QS ; of fnd

qbomb:   dat    0, -56

tab:     add.a  table,table
slow:    add.ab @tab,fnd
fast:    add.b  *tab,@slow
which:   sne.i  datz,@fnd
         add.ab #QD,fnd

         mov.i  qbomb,@fnd
         add.ab #46, fnd     ; Nudge pointer on to start run

         mov.i  qbomb, @fnd
fnd:     mov.i  qbomb, @QB
         add.ab #-7,   fnd
         djn.b  -3,    #6    ; 0.5c bombing over wide area

         jmp    implaun,}-3000

start:
         seq.i  QB+QS*17,QB+QS*17+QD
         jmp    slow,{fast

         seq.i  QB+QS*8,QB+QS*8+QD
         jmp    <fast,}QB+QS*8+QD/2
         seq.i  QB+QS*9,QB+QS*9+QD
         jmp    tab,}QB+QS*9+QD/2

         seq.i  QB+QS*23,QB+QS*23+QD
         jmp    >fast,>tab
         seq.i  QB+QS*24,QB+QS*24+QD
         jmp    slow,>tab

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

         seq.i  QB+QS*30,QB+QS*30+QD
         jmp    tab,}tab

; -----------------------------------------------------
; Launch Imp

implaun  spl     clr,    >2900
         spl     1,      >3000
         spl     1,      >3100
         spl     1,      >3200
         spl     1,      >3300
         spl     2,      >3400
         jmp     imp,    >3600
         add.f   #impsize,-1
vector   dat     0,      0

; -----------------------------------------------------
; Stone


                dat     0,      0
                dat     0,      0
                dat     0,      0

step            equ     -845
djnoff          equ     split+step
impsize         equ     2667

clr             spl     #0,     0
split           spl     #-step, <step
stone           mov     >-step, step+1
                add     split,  stone
cnt             djn.f   stone,  <djnoff
stptr           dat     0,      0      
datz            dat     0,      0
cc              dat     0,      #clr-2

for MAXLENGTH-CURLINE-3
                dat     0,      0
rof

imp             mov.i   #impsize,*0

end             
