;redcode-94
;name Non Plussed
;author Randy Graham
;assert 1
;strategy A moderate stone with self-destruct forward dat and
;strategy addition core-clear and djn stream twice through core.
;strategy Added paper since imp-ring gets blasted by forward clear.

STONE   equ    (begin+1472)    ;where to move the stone
SSTEP   equ    28    ;step size for stone
PAPEROFF equ    1495   ;paper step size - still needs tweaking

begin   mov.i  <splto,  {splto 
        mov.i  <splto,  {splto 
        mov.i  <splto,  {splto 
        mov.i  <splto,  {splto 
        mov.i  <splto,  {splto 
splto   spl.a  STONE+5, keepup+5
        mov.i  mover,   STONE-SSTEP

startup spl.a  1,       }STONE-SSTEP+1
        spl.a  1,       }STONE-SSTEP+1
        spl.a  1,       <STONE-SSTEP+1
        spl.a  STONE+230,<STONE-SSTEP+1
        mov.i  }stopp,  }-1
        spl.a  >stopp,  }STONE-SSTEP+1  ;extra guys into the stone

stopp   dat.f  >paper,  STONE

keepup  spl.a  #0,     <-SSTEP-1
sbegin  spl.a  #SSTEP, <-SSTEP
stoner  mov.i  <-1-SSTEP,     >1+SSTEP
        sub.f  sbegin, -1
        djn.f  stoner, <-381
mover   mov.i  3,      >1

paper   spl.a  @0,     PAPEROFF
movpapr mov.i  }paper, >paper
getimp  mov.i  nonimp, >-550
novamp  mov.i  static, }400
again   spl.a  paper,  {paper
incr    dat.f  >getimp+(3*PAPEROFF),>novamp+(2*PAPEROFF)
   ;increment correct childrens imp bombs and vamp bombs
nonimp  dat.f  <2667,  <5334
static  dat.f  >1,     >1
 ;add blank lines to make me look long in a combat report
for MAXLENGTH-CURLINE
        dat.f  0,      0
rof
