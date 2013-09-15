;redcode-94
;name Building Blocks
;author Randy Graham
;assert 1
;strategy Stone from Non Plussed and a simple vampire working together.


STONE   equ    (stoneup+1472)      ;where to move the stone
VAMPOFF equ    (STONE+VSTEP-1)     ;where to move the vampire
PITOFF  equ    (VAMPOFF+DIFF)      ;where to put the pit

SSTEP   equ    36    ;step size for stone
VSTEP   equ    108   ;step size for fangs

WHICH   equ    (1)    ;which line off the stone to bomb (well = 0)
TRAP    equ    (DIFF+3)    ;where the fang is
DIFF    equ    (35)        ;how far past vamp to put pit


org     stoneup

stoneup mov.i  <splto,  {splto       ;setup for stone
        mov.i  <splto,  {splto 
        mov.i  <splto,  {splto 
        mov.i  <splto,  {splto 
splto   spl.a  STONE+4, well+4
        mov.i  mover,   STONE-SSTEP-1

vampup  mov.i  <splvamp,{splvamp
        mov.i  <splvamp,{splvamp
        mov.i  <splvamp,{splvamp
        mov.i  <splvamp,{splvamp
splvamp spl.a  VAMPOFF+4,vamp+4

        mov.i  {pitto,  <pitto
        mov.i  {pitto,  <pitto
        mov.i  {pitto,  <pitto

pitto   dat.f  pit+3,   PITOFF+3

well    spl.a  #SSTEP,  <-SSTEP
stoner  mov.i  <-1-SSTEP,     >WHICH+SSTEP
        sub.f  well,   -1
        djn.f  stoner, <-381
mover   mov.i  3,      {1

vamp    spl.a  #VSTEP,  <-VSTEP
fanger  mov.i  TRAP-2,  @TRAP-2
        sub.f  vamp,    fanger+TRAP-2
        djn.f  fanger,  <-381


pit     spl.a  #0,      <-12
        jmp.a  -1,      <-12
fang    jmp.a  pit+TRAP-3-VSTEP, 0-TRAP+3+VSTEP

;for MAXLENGTH-CURLINE
;        dat.f  0,      0
;rof
end stoneup
