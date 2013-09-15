;redcode-94
;name Circle of Friends
;author Randy Graham
;strategy A trio of friends taking turns fighting.  Wins keep one
;strategy going, losses let the next one go, ties let the previous go.
;assert 1

CHECK      equ    7     ;how often to check
TIESWITCH  equ    3     ;how many ties to change current strategy
LOSSWITCH  equ    4     ;how many losses
_RESULT    equ    #0    ;predefined register of last result
_COUNTER   equ    #71   ;counter for between round checks
_TIES      equ    #81   ;count our wins for determining switch
_LOSSES    equ    #98   ;count our losses also
_STRATEGY  equ    #64   ;which strategy to fight with

DUELTO     equ    (psetup+720)
STONETO    equ    (psetup+840)
IMPTO      equ    (STONETO+128)
PAPERTO    equ    (STONETO+191)
PAPEROFF   equ    1800

for 0
  This is a collection of 3 warrior friends.  Each takes a few turns
  fighting.  If one does well enough, the others let him keep going.
  If he looses too much, he lets the next guy fight.  If he ties too
  much, he lets the previous fellow fight.
rof

psetup   ldp    _RESULT,  #0   
         sne.ab #-1,      psetup  ;first round?
         jmp.a  begin,    #0
tie      ldp    _TIES,    #0
loss     ldp    _LOSSES,  #0
timer    ldp    _COUNTER, #0
strategy ldp    _STRATEGY,#0
         add.ab #1,       timer
         jmz.b  lost,     psetup
         seq.ab #1,       psetup  ;consider change if not a win
         add.ab #1,       tie     ;we won, so increase counter
         jmp.a  chkstrat, #0
lost     add.ab #1,       loss
chkstrat slt.ab #CHECK-1, timer   ;have we played enough to change?
         jmp.a  memory,   #0      ;no, so just store what we have
         mov.ab #0,       timer   ;reset our counter

         slt.ab #LOSSWITCH, loss
         jmp.a  chkties,  #0
         add.ab #2,       strategy
         jmp.a  switch,   #0
chkties  slt.b  tie,      #TIESWITCH
         add.ab #1,       strategy
switch   mod.ab #3,       strategy
         mov.ab #0,       tie     ;reset our ties and losses
         mov.ab #0,       loss

         stp    strategy, _STRATEGY
memory   stp    tie,      _TIES
         stp    loss,     _LOSSES
         stp    timer,    _COUNTER
begin    djn.b  moveston, strategy

moveduel mov.i  }final,   >final
for 12
         mov.i  }final,   >final
rof
final    mov.i  adder,    DUELTO
         jmp.a  DUELTO,   #0

moveston mov.i  }last,    >done
         mov.i  }last,    >done
         mov.i  }last,    >done
last     mov.i  stone,    >done
         spl.a  STONETO+1,>done
done     mov.i  smover,   STONETO
paperimp djn.b  moveimp,  strategy

movpapr  spl    1,        paper1
         spl    1
         spl    1
         mov.i  -1,       #0
starter  spl.a  @0,       PAPERTO
         mov.i  >movpapr, >starter
stopper  dat.f  <2667,    <2667*2

moveimp  mov.i  imp,      IMPTO
         spl    i                ;bluefunk imp launch
         spl    i31
i12      spl    imp2
imp1     jmp    >0,       IMPTO
i31      spl    imp1
imp3     jmp    >0,       IMPTO+5334
i        spl    i12
         spl    imp3
imp2     jmp    >0,       IMPTO+2667

imp    mov.i  #1143,  2667

OPT equ 66     ;mod 2
LEN equ (14)
DIFF equ 12
BOMBS equ (DIFF+2)	;how many bombs to lay
OFF equ -478	;djn stream offset for long run
BEST equ -410   ;best I've found so far in length of run
ENDAT equ 78147 ;how long BEST runs

adder  sub.f  spltrp,   cmper   ;adjust our compare sites
cmper  sne.i  adder-DIFF+OPT, adder+OPT ;see if they differ
       sub.f  spltrp,   cmper
       seq.i  *cmper,   @cmper
       slt.ab #LEN+BOMBS, cmper ;different, only bomb if not us
       djn.i  adder,  <OFF      ;lay djn stream, jump to add line
setup  mov.ab #BOMBS, traps     ;get bombs ready
       mov.i  spltrp, }cmper    ;start carpetting
traps  djn.b  -1,     #0        ;keep bombing for a while
loop   add.i  datadd, cmper     ;reset compare pointer
       jmz.i  cmper,  adder-1   ;if we haven't bombed ourself, scan more
spltrp spl.a  #0-OPT, <0-OPT    ;trap, and stay alive line
sweep  mov.i  1, }loop          ;lay dats down til we bomb here
datadd dat.f  <OPT-BOMBS, <OPT      ;sets up gate

;very weak stone with core clear

SSTEP  equ    168

stone  mov.i  <6,     1
       spl.a  -1,     <-24
       add.f  3,      stone
       djn.f  -2,     <-26
smover mov.i  SSTEP,  <-SSTEP

paper1   spl.a  @0,       PAPEROFF
breeder  mov.i  }paper1,  >paper1
getimps  mov.i  nonimp,   >-550
novamp   mov.i  static,   }399
again    spl.a  paper1,   {paper1
nonimp   dat.f  <2667,    <5334
static   dat.f  <1,       <1

         end

