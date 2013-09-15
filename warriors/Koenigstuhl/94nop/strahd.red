;redcode-94
;name Strahd the Night Hunter
;Author Randy Graham
;strategy Combine the startup effectiveness of a Quick Vamp against
;strategy imps with the long term effectiveness of a cmp-scanner
;strategy against paper.
;assert 1

OPT equ 42      ;mod 2
LEN equ (fini-adder)
DIFF equ 11
BOMBS equ (DIFF+3)      ;how many bombs to lay
MOVETO equ -744 ;where we move to
OFF equ -397    ;djn stream offset - longest run

QSTART  equ      fini      ;reference point for all scans
QSTEP   equ      95        ;how far apart to look
QJUMP   equ      3900      ;how far away from sne to seq
QFORW   equ      (2*QSPACE);how far past found location
QBACK   equ      (4*QSPACE);how far extra to start back to when bombing
QSPACE  equ      7         ;how far apart to space the fangs
QRUN    equ      (QSTEP+QBACK+QFORW)/QSPACE+1  ;how many bombs to
    ;meet above criteria
A       equ      7         ;how many scan triples in first run
B       equ      6         ;how many scan triples in first run
C       equ      6         ;how many scan triples in first run

start
qscana for A
        sne.x    (QSTART+(2*qscana*QSTEP)), (QSTART+(2*qscana*QSTEP)+QSTEP)
        seq.x    (QSTART+(2*qscana*QSTEP)+QJUMP), (QSTART+(2*qscana*QSTEP)+QSTEP+QJUMP)
        mov.ab   #(QSTART+(2*qscana*QSTEP)+QSTEP)-found, found   ;point to sne.a
rof
        jmn.b    found+1,  found

qscanb for B
        sne.x    (QSTART+(2*(qscanb+A)*QSTEP)), (QSTART+(2*(qscanb+A)*QSTEP)+QSTEP)
        seq.x    (QSTART+(2*(qscanb+A)*QSTEP)+QJUMP), (QSTART+(2*(qscanb+A)*QSTEP)+QSTEP+QJUMP)
        mov.ab   #(QSTART+(2*(qscanb+A)*QSTEP)+QSTEP)-found, found
rof
        jmn.b    found+1,  found

qscanc for C
        sne.x    (QSTART+(2*(qscanc+A+B)*QSTEP)), (QSTART+(2*(qscanc+A+B)*QSTEP)+QSTEP)
        seq.x    (QSTART+(2*(qscanc+A+B)*QSTEP)+QJUMP), (QSTART+(2*(qscanc+A+B)*QSTEP)+QSTEP+QJUMP)
        mov.ab   #(QSTART+(2*(qscanc+A+B)*QSTEP)+QSTEP)-found, found
rof

found   jmz.b    moveme,   #0
        add.b    found,    repeat
        sne.x    @found,   @repeat
        add.ab   #QJUMP,   found
        sne.i    start-1,  @found
        sub.ab   #QSTEP,   found
        sub.ab   #QBACK,   found
        add.b    found,    qvamp
        sub.ba   found,    qvamp
attack  mov.i    qvamp,    @qvamp
        add.f    qdatadd,  qvamp
        djn.b    attack,   #QRUN

moveme  mov.i    >traps,   >moveto
for 6
        mov.i    >traps,   >moveto
rof
moveto  spl.a    MOVETO+1, #MOVETO
for 3
        mov.i    >traps,   >moveto
rof
        mov.i    sweep,    >moveto
        mov.i    datline,  >moveto

qdatadd dat.f    #-QSPACE,  #QSPACE
qvamp   jmp.a    -found+spltrp, found
sweep   mov.i    1,        <-4          ;lay dats down til we bomb here
datline dat.f    <0-OPT-BOMBS,  <0-OPT  ;sets up gate

;here's Cmp-Hunter

adder   add.f    spltrp,   cmper        ;adjust our compare sites
cmper   cmp.i    adder-DIFF-OPT-OPT, adder-OPT-OPT    ;see if they differ
        slt.ab   #LEN+BOMBS, cmper      ;different, only bomb if not us
        djn.i    adder,    <OFF         ;lay djn stream, jump to add line
setup   mov.ab   #BOMBS,   traps        ;get bombs ready
        mov.i    spltrp,   }cmper       ;start carpetting
traps   djn.b    -1,       #adder       ;keep bombing for a while
        add.i    spltrp+2, cmper        ;reset compare pointer
        jmz.i    cmper,    adder-1      ;if haven't bombed ourself, scan more
spltrp  spl.a    #0-OPT,   <0-OPT       ;trap, and stay alive line
repeat  jmp.a    spltrp,   #found-QSTEP ;run away in the pit
fini    end      start
