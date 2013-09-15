;Notes:
;    I chose this warrior because of one BIG reason ... it is my only 
; warrior that actually does well on the hill. It has probe's qscan
; since the paper doesn't kill as good so we need some killing power
; then it jumps to the paper. The paper has three silk copiers and then
; jumps to the most stupid backwards coreclear you have ever seen ...
;    The paper itself is basically a rewritten Papyrus 9 ... the only
; thing that is the same anymore is the fact that it's 3 silk copiers
; and that's because the timescape engine never worked well for me.
; I think had a lucky choice of constants on the first Frog and then 
; Frogz which have similiar silk engines as CC Paper. But by this time
; I don't think you can do something totally original with silk though.

;redcode
;name CC Paper 3T
;author Franz
;strategy qscan+silk+coreclear
;strategy Tournament version of CC Paper 3 (diff constants)
;assert CORESIZE==8000 && MAXPROCESSES>100 && MAXLENGTH>=79

; the paper constants
fcp equ 3030
scp equ 2365
tcp equ 777

; the qscan constants
QB equ (start+400)
QS equ 200
QD equ 100
GAP equ 15
REP equ 6
        
        org     start

; this is the qscan from Probe (Core Warrior 40) almost without
; change

        dat     10*QS,    2*QS ; can get 21 values from this table
table   dat     4*QS,     1*QS ; and can also use the initial value
        dat     23*QS,    3*QS ; of fnd

qbomb   dat     >-200,    >GAP
qinc    dat     >GAP,     >-GAP

tab     add.a   table,    table
slow    add.ab  @tab,     fnd
fast    add.b   *tab,     @slow
which   sne.i   datz,     @fnd
        add.ab  #QD,      fnd

        mov.i   qbomb,    @fnd
fnd     mov.i   -GAP/2,   @QB
        add.ba  fnd,      fnd
        mov.i   qbomb,    *fnd
        add.f   qinc,     fnd
        mov.i   qbomb,    @fnd
        djn.b   -3,       #REP
        jmp     boot,     }-300

start   seq.i   QB+QS*0,  QB+QS*0+QD
        jmp     which,    }QS*13

        seq.i   QB+QS*1,  QB+QS*1+QD
        jmp     fast,     }QB+QS*1+QD/2
        seq.i   QB+QS*2,  QB+QS*2+QD
        jmp     fast,     {tab
        seq.i   QB+QS*3,  QB+QS*3+QD
        jmp     fast,     }tab

        seq.i   QB+QS*13, QB+QS*13+QD
        jmp     fast,     {fast

        seq.i   QB+QS*4,  QB+QS*4+QD
        jmp     >fast,    }QB+QS*4+QD/2
        seq.i   QB+QS*5,  QB+QS*5+QD
        jmp     slow,     }QB+QS*5+QD/2
        seq.i   QB+QS*6,  QB+QS*6+QD
        jmp     slow,     {tab
        seq.i   QB+QS*7,  QB+QS*7+QD
        jmp     slow,     }tab

        seq.i   QB+QS*10, QB+QS*10+QD
        jmp     >fast,    <tab
        seq.i   QB+QS*11, QB+QS*11+QD
        jmp     slow,     <tab
        seq.i   QB+QS*12, QB+QS*12+QD
        djn.f   slow,     tab

        seq.i   QB+QS*23, QB+QS*23+QD
        jmp     >fast,    >tab
        seq.i   QB+QS*24, QB+QS*24+QD
        jmp     slow,     >tab

        seq.i   QB+QS*17, QB+QS*17+QD
        jmp     slow,     {fast

        seq.i   QB+QS*8,  QB+QS*8+QD
        jmp     <fast,    }QB+QS*8+QD/2
        seq.i   QB+QS*9,  QB+QS*9+QD
        jmp     tab,      }QB+QS*9+QD/2

        seq.i   QB+QS*15, QB+QS*15+QD
        jmp     tab,      <tab
        seq.i   QB+QS*16, QB+QS*16+QD
        jmp     tab,      {tab
        seq.i   QB+QS*20, QB+QS*20+QD
        djn.f   <fast,    tab
        seq.i   QB+QS*21, QB+QS*21+QD
        jmp     tab,      {fast
        seq.i   QB+QS*22, QB+QS*22+QD
        djn.f   tab,      tab
        seq.i   QB+QS*27, QB+QS*27+QD
        jmp     <fast,    >tab
        seq.i   QB+QS*28, QB+QS*28+QD
        jmp     tab,      >tab

        seq.i   QB+QS*30, QB+QS*30+QD
        jmp     tab,      }tab

boot    spl     1,        >-3000 ; letz get 8 processes together
        spl     1,        >3000  ; in the meantime lets increment
        spl     1,        >4000  ; a few instructions maybe hitting 
                                 ; something

; 3 copier silk engine, a very 
; remote cousin of of Papyrus 9
paper   spl     @0,       <fcp   ; first copy
        mov     }-1,      >-1
        spl     @0,       <scp   ; second copy
        mov     }-1,      >-1
        spl     @0,       <tcp   ; third copy
        mov     }-1,      >-1

; the most stupid coreclear with
; the most stupid imp gate
        mov     2,        <-1    ; let's get some ...
        djn.f   -1,       -10    ; only a gate djn

datz    end
