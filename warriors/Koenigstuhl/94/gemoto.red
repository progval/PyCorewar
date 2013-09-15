;redcode-94
;name Gem of the Ocean
;author P.Kline
;assert CORESIZE == 8000
;strategy pswitching stone, clisson, paper, sweep
;strategy using table-based switcher
;strategy the final one!

PFLAG     equ    320
choose1   equ    slStone
choose2   equ    slSweep
choose3   equ    slClisson
choose4   equ    slPaper

slStone
Stone     spl    #-76,#76     ; self-splitting, unbooted stone
          mov    -2,<-13      ; with sequential core clear
          add    Stone,1
          mov    >0,-3
          djn.f  -2,{-1501
      for 11
          dat    0,0
      rof
parray    dat 0,choose1       ; table for pswitching
          dat 0,choose3       ; - stay after win
          dat 0,choose1       ; - go to ptie after tie
          dat 0,choose4       ; - move up one after loss
          dat 0,choose1
          dat 0,choose3
ptie      dat 0,choose2
          dat 0,choose4

presult   ldp.ab #0,#0        ; pswitch code, nice and short
pselect   ldp.ab #PFLAG,#0
          sne.ab #0,presult   ; advance table selection after a loss
          add.ab #1,pselect
          sne.ab #2,presult   ; go to Sweep after a tie
          mov    #ptie-parray,pselect
          stp.ba pselect,pselect
          mod.ab #presult-parray,pselect
          add.ba pselect,pchoice
pchoice   jmp    @parray,{pselect       ; jump to selection
     for 4
          dat    0,0
     rof
slSweep   mov    <btSweep,{btSweep      ; boot the sweep
          djn    -1,#5
          add.a  #1,btSweep
btSweep   jmp    Sweep+4+4100,Sweep+4

          dat    #-5     ,8
Sweep     spl    #6050   ,150
          mov    @2,>Sweep-4
          mov    @1,>Sweep-4
          djn.b  -2,{Sweep
watch2    dat    0,0
          dat    1,1
      for 18
          dat    0,0
      rof
slClisson mov    #watch2-(datone+40),(datone+40)
Clisson   sne    {watch1,{watch1      ; Clisson to beat fast bombers
          jmz.f  -1,@(datone+40)
          add.a  #3,watch1
          mov    <watch1,{watch1
          djn    -1,#5
          add.a  #1,watch1
watch1    jmp    -200,qb+5

qb        dat    #1 ,-3               ; Clisson's killer
q1        spl    #0 ,#0
          mov    qb ,<q4
q4        djn    -1 ,#qb
      for 4
          dat    0,0
      rof
slPaper   spl    1,{pselect
          spl    1,{pselect           ; make 8 processes
          spl    1,{pselect

s0        spl    @0,<3359             ; Paper
          mov.i  }s0,>s0
s1        spl    @0,>1907
          mov.i  }-1,>-1
          spl    -1,{-500
          mov    datone,>s1
          mov    datone,{-502
datone    dat    1,1

          end    presult
