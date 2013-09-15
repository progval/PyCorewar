;redcode-94
;name Clisson Lite
;author P.Kline
;assert CORESIZE == 8000
;strategy p-switching X with paper/imp

PIN       1111
PFLAG     equ 250

rstep     equ    12
rincr     dat    -rstep,rstep*2              ; spray core to kill scanners
raid      mov    rincr,@2                    ; before launching paper
          mov    rincr,*1
          mov    150,*-150
          sub    rincr,-1
          djn    raid,#(8000/rstep)/3
          jmp    paperfx
      for 3
          dat     0,0
      rof
imp       equ     1143
space     equ     (2390)
paperfx   stp.ab  #1,#PFLAG                  ; paper choice is permanent
          mov     0,-1                       ; erase stp

paper     spl     1
          mov     -1,0
          mov     -1,0
s0        spl     @0,space
          mov.i   }s0,>s0
          mov.i   }s0,>s0
s1        spl     @0,imp*2
          mov.i   }s1,>s1
          spl     #0
          spl     1+imp
          mov.i   #imp,*0
      for 3
          dat    0,0
      rof
Pmod      equ    17
          dat    0,+7820     ; first round
PRESULT   dat    0,+Pmod     ; loss
          dat    0,-Pmod*2   ; win
          dat    1,0         ; tie

start     ldp.a  #0,PRESULT              ; pspace stuff
PTEST     ldp.ab #PFLAG,#0               ; get status
          add.b  PTEST,*PRESULT          ; update with result of last battle
          stp.b  *PRESULT,#PFLAG         ; store
          mov    0,-1                    ; prevent accidental stores
          slt    *PRESULT,#-(Pmod*2*200) ; status should never be less than this
          mod    #Pmod,*PRESULT          ; and it should always be mod this
          jmz    wait1,*PRESULT          ; if so - go to Clisson watch-for-bomb
                                         ; if too many losses or brainwash
                                         ;   make permanent switch to paper
          jmz.a  raid,*PRESULT           ; after a win or loss, bomb core first
          jmp    paperfx                 ;   else start paper
watch2    dat    0,0
          dat    1,1
      for 19
          dat    0,0
      rof
q1        spl    #0,<-10                 ; this is the bomber-killer
          mov    qb,<qp                  ; when overrun by djn.b or djn.f
          mov    qb,<qp                  ; it keeps on ticking :-)
          jmp    -2,<qp
          dat    <-11,-9
qb        dat    <-11,-9
          dat    0,-2000
qp        dat    0,-11

watch4    equ    watch2+100

wait1     mov    #-100,watch4
          sne    {watch1,<watch1         ; linear scans for bombs
          jmz.f  -1,@watch4              ; internal check for silent carpet 
attack
          sne    datzero,*watch1         ; which pointer has the target?
          mov.x  watch1,watch1
          sub.a  #5,watch1
          mov    datzero,}watch1         ; dat-bomb a place for killer
          djn    -1,#9
          mov    <launch2,{watch1        ; then put killer there
          djn    -1,#8
launch2   jmp   *watch1,q1+8
      for 3
          dat    0,0
      rof
datzero   dat    0,0
watch1    dat    5000,7000
      for 3
          dat    0,0
      rof
datone    dat    1,1

          end    start

