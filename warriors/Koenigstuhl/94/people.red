;redcode-94
;name People
;author Randy Graham
;strategy Trying this pspace thing - combine imp/stone and a scanner.
;strategy check every few rounds and alter which to use.
;assert 1

CHECK      equ    5     ;how often to check
SWITCH     equ    3     ;how many wins to keep current strategy
_RESULT    equ    #0    ;predefined register of last result
_COUNTER   equ    #71   ;counter for between round checks
_WINS      equ    #81   ;count our wins for determining switch
_STRATEGY  equ    #64   ;which strategy to fight with

DUELTO     equ    (psetup+720)
STONETO    equ    (psetup+840)
IMPTO      equ    (STONETO+128)

for 0
    I have had stones that worked well in the past, but there is
    always the problem of beating paper with them.  So, since we
    now have pspace, I am using one of these stones, but using a
    switch to change to a scanner if I lose too much as a stone.
rof

psetup   ldp    _RESULT,  #0   
won      ldp    _WINS,    #0
timer    ldp    _COUNTER, #0
strategy ldp    _STRATEGY,#0
         add.ab #1,       timer
         jmz.b  chkstrat, psetup
         djn.b  chkstrat, psetup  ;consider change if not a win
         add.ab #1,       won     ;we won, so increase counter
chkstrat slt.ab #CHECK-1, timer   ;have we played enough to change?
         jmp.a  memory,   #0      ;no, so just store what we have
         mov.ab #0,       timer   ;reset our counter
         slt.b  won,      #SWITCH ;change if we haven't won enough
         jmp    memory,   #0      ;stay how we are
switch   sub.b  strategy, #1
         mov.b  switch,   strategy
         mov.ab #0,       won     ;reset our wins
memory   stp    won,      _WINS
         stp    timer,    _COUNTER
         stp    strategy, _STRATEGY
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
         mov.i  imp,      IMPTO

         spl    i
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
OFF equ -410	;djn stream offset for long run
BEST equ -410   ;best I've found so far in length of run
ENDAT equ 78147 ;how long BEST runs


adder  add.f  spltrp,   cmper   ;adjust our compare sites
cmper  sne.i  adder-DIFF-OPT, adder-OPT ;see if they differ
       add.f  spltrp,   cmper
       seq.i  *cmper,   @cmper
       slt.ab #LEN+BOMBS, cmper ;different, only bomb if not us
       djn.i  adder,  <OFF      ;lay djn stream, jump to add line
setup  mov.ab #BOMBS, traps     ;get bombs ready
       mov.i  spltrp, }cmper    ;start carpetting
traps  djn.b  -1,     #0        ;keep bombing for a while
       add.i  datadd, cmper     ;reset compare pointer
       jmz.i  cmper,  adder-1   ;if we haven't bombed ourself, scan more
spltrp spl.a  #0-OPT, #0-OPT    ;trap, and stay alive line
sweep  mov.i  1, <traps         ;lay dats down til we bomb here
datadd dat.f  <0-OPT-BOMBS, <0-OPT      ;sets up gate


SSTEP  equ    168

stone  mov.i  <6,     1
       spl.a  -1,     <-24
       add.f  3,      stone
       djn.f  -2,     <-26
smover mov.i  SSTEP,  <-SSTEP

