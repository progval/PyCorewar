;redcode-94
;name Enough is enough!
;version 0.2
;author Ilmari Karonen
;strategy If you can't beat them, join them. :( There are way too many
;strategy Q^2 scans around already, but..
;strategy QScan -> Paper
;history 0.1 - works.
;history 0.2 - added some boot code.
;date October 13, 1996
;planar quick, scan, paper, boot
;assert CORESIZE == 8000

        org     start

step1   equ     -1718
step2   equ     2524
step3   equ     2841

hit1    equ     (bomb1+4024)
hit2    equ     (2667)
hit3    equ     (-2666)
hit4    equ     (bomb2+1)
hit5    equ     (-501)

away    equ     2222

QB      equ     (start+400)
QS      equ     200
QD      equ     100
COUNT   equ     6

GAP     equ     15
REP     equ     6

        dat     10*QS, 2*QS ; can get 21 values from this table
table:  dat      4*QS, 1*QS ; and can also use the initial value
        dat     23*QS, 3*QS ; of fnd
qbomb:  jmp     -200,GAP
qinc:   dat     GAP,-GAP

tab:    add.a   table,table
slow:   add.ab  @tab,fnd
fast:   add.b   *tab,@slow
which:  sne.i   datz,@fnd
        add.ab  #QD,fnd
                
        mov.i   qbomb,@fnd
fnd:    mov.i   -GAP/2,@QB
        add.ba  fnd,fnd
qloop:  mov.i   qbomb,*fnd
        add.f   qinc,fnd
        mov.i   qbomb,@fnd
        djn.b   qloop,#REP
        jmp     boot,}-300
                
start:
        seq.i   QB+QS*0,QB+QS*0+QD
        jmp     which,}QS*13 ; qinc+GAP
                
        seq.i   QB+QS*1,QB+QS*1+QD
        jmp     fast,}QB+QS*1+QD/2
        seq.i   QB+QS*2,QB+QS*2+QD
        jmp     fast,{tab
        seq.i   QB+QS*3,QB+QS*3+QD
        jmp     fast,}tab
                
        seq.i   QB+QS*13,QB+QS*13+QD
        jmp     fast,{fast
                
        seq.i   QB+QS*4,QB+QS*4+QD
        jmp     >fast,}QB+QS*4+QD/2
        seq.i   QB+QS*5,QB+QS*5+QD
        jmp     slow,}QB+QS*5+QD/2
        seq.i   QB+QS*6,QB+QS*6+QD
        jmp     slow,{tab
        seq.i   QB+QS*7,QB+QS*7+QD
        jmp     slow,}tab
                
        seq.i   QB+QS*10,QB+QS*10+QD
        jmp     >fast,<tab
        seq.i   QB+QS*11,QB+QS*11+QD
        jmp     slow,<tab
        seq.i   QB+QS*12,QB+QS*12+QD
        djn.f   slow,tab
                
        seq.i   QB+QS*23,QB+QS*23+QD
        jmp     >fast,>tab
        seq.i   QB+QS*24,QB+QS*24+QD
        jmp     slow,>tab
                
        seq.i   QB+QS*17,QB+QS*17+QD
        jmp     slow,{fast
                
        seq.i   QB+QS*8,QB+QS*8+QD
        jmp     <fast,}QB+QS*8+QD/2
        seq.i   QB+QS*9,QB+QS*9+QD
        jmp     tab,}QB+QS*9+QD/2
                
        seq.i   QB+QS*15,QB+QS*15+QD
        jmp     tab,<tab
        seq.i   QB+QS*16,QB+QS*16+QD
        jmp     tab,{tab
        seq.i   QB+QS*20,QB+QS*20+QD
        djn.f   <fast,tab
        seq.i   QB+QS*21,QB+QS*21+QD
        jmp     tab,{fast
        seq.i   QB+QS*22,QB+QS*22+QD
        djn.f   tab,tab
        seq.i   QB+QS*27,QB+QS*27+QD
        jmp     <fast,>tab
        seq.i   QB+QS*28,QB+QS*28+QD
        jmp     tab,>tab
                
        seq.i   QB+QS*30,QB+QS*30+QD
        jmp     tab,}tab

; *** Cannon Fodder 0.1

boot    spl     1, {500         ; \.
        spl     1, {1500        ; -\ create 16
        spl     1, {2000        ; -/ inline processes
        spl     1, {2500        ; /

        mov.i   }split1, >pois
pois    jmp     away, away


split1  spl     @0, <step1
        mov.i   }split1, >split1
split2  spl     @0, <step2
        mov.i   }split2, >split2
split3  spl     @0, <step3
        mov.i   }split3, >split3
        mov.i   #1, }hit2
        mov.i   bomb2, }hit3
foo1    mov.i   {hit4, <hit5
        mov.i   bomb2, <(-10*step3)+split1
        mov.i   bomb1, {hit1
        mov.i   bomb1, {hit1+2667
        mov.i   bomb1, {hit1+(2*2667)
        mov.i   bomb2, }foo1
bomb1   dat     <2667, <2*2667
bomb2   dat     >1, }1

datz    z for   (MAXLENGTH-CURLINE)
        dat     0, 0
        rof

        end
