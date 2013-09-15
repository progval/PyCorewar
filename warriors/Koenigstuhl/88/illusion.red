;redcode
;author Randy Graham
;name Illusion
;assert 1
;strategy '88 code only b-scanner with spl/spl/dat/dat coreclear

OPT     equ   3044

sweep3  dat    <2667,    #-10 ;<2667 added 100 points vs. blue funk
        dat    #0,       #0         ;danger
adder   add    #OPT,     seat
check   jmz    adder,    @seat
setup   add    seat,     site2
seat    spl    0,        #OPT       ;danger
clean   mov    @site1,   <site2
repeat  jmp    clean,    <sweep3-4
sweep2  spl    -1,       sweep3-2
site2   dat    #0,       #0         ;danger
site1   dat    #0,       #sweep1
sweep1  spl    -1,       sweep2+1
end check
