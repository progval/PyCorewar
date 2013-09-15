;redcode-94 quiet
;name Harmony
;author P.Kline
;assert CORESIZE == 8000
;strategy 66% cmp-scan with spl-spl-jmp bombs, forward dat coreclear
;strategy making decoys is faster than booting
;strategy start clear when overrun by djn.b

step    equ    98                    ; actually not the REAL one :-)

reset1  dat    #step-2,#step         ; if overrun by djn.b, #step counts
                                     ;     down fast

ct1     jmp    split1+1,2000         ; if overrun by djn.f, ctr1 will go here
scan1   add    split1,@cmpptr1
comp1   seq    2*step,3*step         ; take a look
        slt    #start-comp1+step+3,comp1
ctr1    djn    scan1,ct1             ; countdown to finish
attack1 mov    jump1,*comp1          ; drop wide bomb on a-pointer
cmpptr1 mov    split1,{comp1         ;
        mov    split1,{comp1         ; after bombing, reset to
        sub    reset1,@cmpptr1       ; make b-pointer the next a-pointer
        jmn    scan1,ct1
split1  spl.i  #(2*step),#(2*step)
        mov    wipe1,>reset1-3       ; clear
        mov    wipe1,>reset1-3       ; clear
jump1   jmp    -2
wipe1   dat    {2667,wipe1-reset1+10
    for 8+12
        dat    0,0
    rof
reset2  dat    #step-2,#step
ct2     jmp    split2+1,1800
scan2   add    split2,comp2
comp2   seq    (comp1+4000+4)+2*step,(comp1+4000+4)+3*step     ; take a look
        slt    #start-comp2+step+3,@cmpptr2
ctr2    djn    scan2,ct2             ; countdown to finish
attack2 mov    jump2,*comp2          ; drop wide bomb on a-pointer
cmpptr2 mov    split2,{comp2         ;
        mov    split2,{comp2         ; after bombing, reset to
        sub    reset2,@cmpptr2       ; make b-pointer the next a-pointer
        jmn    scan2,ct2
split2  spl.i  #2*step,#2*step
        mov    wipe2,>reset2-3       ; clear
        mov    wipe2,>reset2-3       ; clear
jump2   jmp    -2
wipe2   dat    {2667,wipe2-reset2+10

    for 38-12
        dat    0,0
    rof
decoyA  equ    5501                  ; decoy parameters are tuned to 
decoyS  equ    48                    ; trigger a 75% once-through scanner
decoyB  equ    5501+13*decoyS+36

start   spl    comp2                 ; make a decoy and bomb space
    for 12
        mov    {decoyA-decoyS*start,{decoyB-decoyS*start
    rof
        jmp    comp1
        end    start
