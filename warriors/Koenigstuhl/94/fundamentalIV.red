;redcode
;name Fundamental IV
;author John Metcalf
;strategy On loss or tie, Timescape, else
;strategy Carbonite. Probably better to have
;strategy started on Carbonite instead tho
;assert 1
pswi: ldp #0,pung
pung: sne #1,#0
      jmp STONE
;[TIMESCAPE] Start at the label PAPER
TSTEP  EQU 1800
CSTEP  EQU 3740
NSTEP  EQU -1922
FSTEP  EQU 1870
PAPER  SPL 1,<-200
       SPL 1,<-300
       MOV.I -1,0
TIM1   SPL @TIM1,}TSTEP
       MOV.I }TIM1,>TIM1
CEL1   SPL @CEL1,}CSTEP
       MOV.I }CEL1,>CEL1
       MOV.I {-FSTEP,<FSTEP
       MOV.I {CEL1,<NCL1
NCL1   JMP @NCL1,>NSTEP
       DAT 0,0
       DAT 0,0
;[CARBONITE] Start at the label STONE
DBOMB  DAT >-1,>1
STONE  SPL #0,<-100
       MOV DBOMB,TAR-197*3500
TAR    ADD #197,-1
       DJN.F -2,<-1151
       end pswi
--------------------------------------
