;redcode-94
;name Al's Cave
;author P.Kline
;assert CORESIZE == 8000
;strategy pswitching stone, CLP, one-shot spl/dat wiper

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
slSweep   mov    <btSweep   ,{btSweep
          mov    <btSweep   ,{btSweep
          mov    <btSweep   ,{btSweep
          mov    <btSweep   ,{btSweep
          djn    -3         ,#3
btSweep   jmp    Sweep+10+5600,Sweep+10

Sweep     add    #2671   ,#2681           ;one-shot scan
          jmz.f  Sweep   ,@Sweep          ;with spl-dat wipe
          jmp    swWipe  ,<Sweep
          dat    #-100   ,swWipe+7-Sweep
          dat    #-100   ,swWipe+7-Sweep
swWipe    spl    #5900   ,swWipe+7-Sweep
          mov    @2      ,>Sweep
          mov    @2      ,>Sweep
          mov    @1      ,>Sweep
          djn.b  -2      ,{swWipe

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
w1 EQU slSweep
w2 EQU slStone
w3 EQU slDodger

state jmp    @0        ,w1
tie_table
win_table
ww1   spl    #ww1-win_table,w1   ; Sweep
      spl    #ww1-win_table,w1
      spl    #ww1-win_table,w1
      spl    #ww1-win_table,w1
      spl    #ww1-win_table,w1
ww2   spl    #ww2-win_table,w2   ; Stone
      spl    #ww2-win_table,w2
      spl    #ww2-win_table,w2
ww3   spl    #ww3-win_table,w3   ; Dodger
      spl    #ww3-win_table,w3
      spl    #ww3-win_table,w3
      spl    #ww3-win_table,w3
      spl    #ww3-win_table,w3
loss_table
      spl    #1-loss_table  ,w1  ; Sweep
      spl    #1-loss_table  ,w1
      spl    #1-loss_table  ,w1
      spl    #1-loss_table  ,w1
      spl    #2-loss_table  ,w2
      spl    #1-loss_table  ,w2  ; Stone
      spl    #1-loss_table  ,w2
      spl    #ww1-win_table ,w1
init_table
      spl    #1-loss_table  ,w3  ; Dodger (never selected after first trial)
      spl    #1-loss_table  ,w3
      spl    #1-loss_table  ,w3
      spl    #1-loss_table  ,w3
      spl    #ww2-win_table ,w2

slDodger  mov    <btDodger,{btDodger
          mov    <btDodger,{btDodger
          mov    <btDodger,{btDodger
          djn    -3,#5
btDodger  jmp    pescape+300,pescape
                                    ; code from "Curious Little Program"
                                    ; after "Cowboy"
pescape   equ    (pb+1)
plen      equ    (pescape-p1)
pstep     equ    (5093)
p1        mov    pb       ,@pfence  ; build fences
          mov    pb       ,*pfence
ploop     mov    pwash    ,}psnare
          mov    psnare   ,<psnare
pfence    sne    pb-56    ,pb+26    ; monitor fences
          djn.f  ploop    ,<p1-pstep
pmove     add    preset   ,psnare   ; adjust snare for new base
          mov    pb       ,pescape  ; set copy pointers
pcopy     mov    >pescape ,}pescape ; make copy
          jmn.b  -1       ,pescape  ;
preset    jmp    p1+pstep ,-p1-pstep; jump to new location
psnare    jmp    ptrap-4001,+4001
ptrap     stp.ab #0       ,#250     ; brainwash Electric Head
pwash     stp.ab #6       ,#123     ; brainwash Nomolos
pb        dat    pstep+p1-pescape,-plen

          end think
