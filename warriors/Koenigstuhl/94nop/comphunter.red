;redcode-94
;Name Comp-Hunter v2.2
;Author Randy W. Graham
;assert 1
;strategy cmp-scanning carpet bomber based on Rave.
;strategy v2.0 Better djn-stream.  Changed spltrap bomb.
;strategy v2.2 Try a new imp-gate/step size.

OPT equ 66     ;mod 2
LEN equ (fini-adder)
DIFF equ 12
BOMBS equ (DIFF+2)      ;how many bombs to lay
OFF equ -402    ;djn stream offset for long run     ;for OPT 7934
BEST equ -402   ;best I've found so far in length of run
ENDAT equ 78164 ;how long BEST runs

adder  add.f  spltrp,   cmper   ;adjust our compare sites
cmper  cmp.i  adder-DIFF-OPT, adder-OPT ;see if they differ
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
fini   end    cmper
