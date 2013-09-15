;redcode-94
;name Harmony II
;author P.Kline
;assert CORESIZE == 8000
;strategy 66% cmp-scan with spl-spl-jmp bombs, forward dat coreclear
;strategy start clear when overrun by djn.b
;strategy improved decoy
;strategy now about those imps :-))
step1   equ    98                           ; attempted separate steps
step2   equ    98                           ; but was less effective

reset1  dat    #step1-2,#step1-1
scan1   add    *splptr1,@cmpptr1
comp1   seq    step1*4,step1*5              ; check two locations
        slt    #ender-comp1+step1+5,@cmpptr1; check for self
ctr1    djn    scan1,#2500                  ; countdown to clear
splptr1 mov    split1,{comp1                ; attack centers 4-line bomb
        mov    split1,{comp1
        sub    reset1 ,comp1
cmpptr1 mov    jump1 ,@comp1
gate1   mov    split1,<comp1
        jmn    ctr1,ctr1                    ; ready for clear?
split1  spl.i  #2*step1,#2*step1             
        mov    wipe1,@gate1                 ; spiral clear a'la Paul
        add.ab incr1,gate1                  ; forward clear kills copy2
jump1   djn    -2,#0
incr1   mov.x  #381,#5091                   ; after each pass, swap increment
wipe1   dat.x  #1,#8                        ; to wipe any shadows
    for 38
        dat    0,0
    rof
reset2  dat    #step2-2,#step2-1            ; mostly the same as above 
scan2   add    *splptr2,@cmpptr2            
comp2   seq    comp1+3961,comp1+3961+step2  
        slt    #ender-comp2+step2+5,@cmpptr2
ctr2    djn    scan2,#3000                  ; usually copy1 finishes first
splptr2 mov    split2,{comp2                ; but if it is crippled this
        mov    split2,{comp2                ; one should scan a little longer
        sub    reset2 ,comp2
cmpptr2 mov    jump2 ,@comp2
gate2   mov    split1,<comp2
        jmn    ctr2,ctr2
split2  spl.i  #2*step2,#2*step2
        mov    wipe2,@wipe2+2
        sub.ab incr2,wipe2+2                ; backwards clear to kill copy1
jump2   djn    -2,#0                        ; (for speed)
incr2   mov.x  #381,#5091
wipe2   dat.x  #1,#gate2-1
        dat    0,0
    for 11
        dat    0,0
    rof
decA    equ    (reset1-2200)
decB    equ    (reset2-4005)
decC    equ    201

start   mov    <decB,{decA-decC*start          ; create a decoy
        mov    <decA+1-decC*(start+1),{decA-decC*start
        mov    <decA+1-decC*(start+1),{decA-decC*start
        mov    <decA+1-decC*(start+1),{decA-decC*start
        mov    <decA+1-decC*(start+1),{decA-decC*start
        mov    <decA+1-decC*(start+1),{decA-decC*start
        mov    <decA+1-decC*(start+1),{decA-decC*start
        mov    <decA+1-decC*(start+1),{decA-decC*start
        spl    comp1,{decB+1
ender   jmp    comp2,{decB+2
        dat    1,1                             ; recommended trailer
        end    start
