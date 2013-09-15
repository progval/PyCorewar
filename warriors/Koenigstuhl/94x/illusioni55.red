;redcode-94x
;author Randy Graham
;name Illusion-94/55
;contact graham@mathcs.rhodes.edu
;NSFCWT round 8
;strategy Original '88 illusion with '94 optimizations and 55440 core
;strategy one-shot f-scanner with spl/spl/dat/dat... coreclear
;assert CORESIZE==55440

OPT     equ    22964
GATE    equ    (sweep3-1)

sweep3  dat.f  #GATE-10, repeat-GATE+5
sweep2  spl.a  #GATE-10, repeat-GATE+5
sweep1  spl.a  #GATE-10, repeat-GATE+5
        dat.f  #0,       #0         ;danger
adder   add.ab #OPT,     seat
check   jmz.f  adder,    @seat
setup   add.b  seat,     GATE
seat    spl.a  0,        #OPT       ;danger
clean   mov.i  @repeat,  >GATE
repeat  djn.b  clean,    {sweep1
end check
