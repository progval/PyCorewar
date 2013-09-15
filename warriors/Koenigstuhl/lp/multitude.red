;redcode-lp
;name Multitude
;author Robert Hale
;assert CORESIZE == 8000
;strategy Multiple coreclears with a qscan

NUMCLEARS equ 8

ptr     dat     dclr, dclr+CORESIZE/NUMCLEARS
     
QB EQU (start+1800)
QS EQU (QD*2)
QD EQU 100

GAP EQU 12
REP EQU 8

datz EQU (table-3)

         dat    10*QS, 2*QS ; can get 21 values from this table
table:   dat     4*QS, 1*QS ; and can also use the initial value
         dat    23*QS, 3*QS ; of fnd

qinc:    spl    #GAP,-GAP
tab:     add.a  table,table
slow:    add.a  @tab,fnd
fast:    add.ba *tab,@slow
which:   sne.i  datz,*fnd
         add.a  #QD,fnd
         mov.i  ptr,*fnd
         add.ab fnd,fnd

fnd:    mov.i  QB,GAP/2
        add.f  qinc,fnd
        mov.i  ptr,*fnd
        djn.b  fnd,#REP
        jmp    boot,}QS*13

start:
            ; WHICH
        seq.i  QB+QS*0,QB+QS*0+QD
        jmp    which,}QB+QS*0+QD/2
            
             ; FAST
         seq.i  QB+QS*1,QB+QS*1+QD
         jmp    fast,}QB+QS*1+QD/2
            
         seq.i  QB+QS*13,QB+QS*13+QD
         jmp    fast,{fast
         seq.i  QB+QS*2,QB+QS*2+QD
         jmp    fast,{tab
         seq.i  QB+QS*3,QB+QS*3+QD
         jmp    fast,}tab
            
            ; SLOW
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
            
            ; TAB
            
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
 
boot    spl           @ptr
        mov.i         }ptr, >ptr
        mov.i         }ptr, >ptr
        mov.i         }ptr, >ptr
        mov.a         #dclr-ptr,ptr
          add.ab        #1000-3, ptr
          djn           start, #NUMCLEARS-1
          jmp           dclr

for MAXLENGTH-CURLINE-15
        dat     0,0
rof

gate    dat     0, wipe+200

for MAXLENGTH-CURLINE-3
        dat     0,0
rof

dclr    mov     wipe  ,>gate
        djn.f   -1    ,>gate
wipe    dat     >5335 ,2-gate

          end           start

