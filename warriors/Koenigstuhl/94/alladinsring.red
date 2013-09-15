;redcode-94
;name Alladin's Ring
;author P.Kline
;assert CORESIZE == 8000
;strategy pswitching stone, one-shot dclear, and one-shot spl/dat wiper

slStone   mov    <btStone ,{btStone
          mov    <btStone ,{btStone
          mov    <btStone ,{btStone
btStone   jmp    -300     ,4
sStep     equ    4954
Stone     mov    {1601    ,1-sStep         ; dat-bomb about 90% of core
          sub.x  #sStep   ,-1
          jmp    -2       ,}-2
      for 4
          dat 0,0
      rof
clBoot    equ    (2800)
slClear   mov    clGate     ,clGate+clBoot ;clear and sweep share boot code
          mov    btClear    ,btSweep
slSweep   mov    <btSweep   ,{btSweep
          mov    <btSweep   ,{btSweep
          mov    <btSweep   ,{btSweep
          mov    <btSweep   ,{btSweep
          djn    -3         ,#3
btSweep   jmp    Sweep+10+5600,Sweep+10
clGate    dat    0,clBomb
btClear   jmp    Clear+10-btSweep+clBoot ,Clear+10-btSweep

Clear     add    #2671  ,clGate           ;one-shot scan
          jmz.f  -1     ,@clGate          ;with dclear

clSpl     spl    #4000  ,{clGate
          mov    clBomb ,>clGate
          mov    clBomb ,>clGate
          djn.f  -1     ,>clGate
          jmp    clSpl
          dat    {5335,12
clBomb    dat    {5335,12
          dat    0,0

Sweep     add    #2671   ,#2681           ;one-shot scan
          jmz.f  Sweep   ,@Sweep          ;with spl-dat wipe
          jmp    swWipe  ,<Sweep
          dat    #-100   ,{swWipe+7-Sweep
          dat    #-100   ,{swWipe+7-Sweep
swWipe    spl    #5900   ,{swWipe+7-Sweep
          mov    @3      ,>Sweep
          mov    @2      ,>Sweep
          mov    @1      ,>Sweep
          djn.b  -2      ,{swWipe
      for 28
          dat 0,0
      rof

PSTATE EQU 110
STATES EQU (loss_table-win_table)
      dat    0,init_table-state
in    dat    0,loss_table-state
      dat    0,win_table-state
      dat    0,tie_table-state

think ldp.a  #0,in              ; get input value
load  ldp.a  #PSTATE,state      ; load old state
      mod.a  #STATES,state      ; brainwash protection
      add.ba *in,state          ; select correct state table
store stp.a  *state,load        ; store new state
      mov    0,-1               ; eliminate accidental stp's

                                 ; p-table managing four options plus brainwash
                                 ; note that any number of brainwash values
                                 ; could be put in between valid values
                                 ;
                                 ; loss-table is designed to speed up
                                 ; search for best routine by skipping
                                 ; one or more trials of each program
w0 EQU slClear
w1 EQU slSweep
w2 EQU slStone

state jmp    @0        ,w1
tie_table
win_table
      spl    #wx0-win_table ,w0  ; Brainwash  (zero should not happen!)
ww1   spl    #ww1-win_table ,w1  ; Sweep
wx1   spl    #ww1-win_table ,w1
      spl    #ww1-win_table ,w1
ww0   spl    #ww0-win_table ,w0  ; Clear
wx0   spl    #ww0-win_table ,w0
      spl    #ww0-win_table ,w0
ww2   spl    #ww2-win_table ,w2  ; Stone
      spl    #ww2-win_table ,w2
      spl    #ww2-win_table ,w2
loss_table
      spl    #wx0-win_table ,w0  ; Brainwash
      spl    #1-loss_table  ,w1  ; Sweep
      spl    #1-loss_table  ,w1
      spl    #2-loss_table  ,w0
      spl    #1-loss_table  ,w0  ; Clear
      spl    #1-loss_table  ,w0
      spl    #3-loss_table  ,w2
      spl    #1-loss_table  ,w2  ; Stone
init_table
      spl    #1-loss_table  ,w2
      spl    #wx1-win_table ,w2

          end think
