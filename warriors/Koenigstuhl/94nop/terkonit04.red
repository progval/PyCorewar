;redcode-94
;name Terkonit 0.4
;author Christian Schmidt
;strategy q^2 + paper-launching imp spiral
;assert 1

QB      equ     (start+400)
QS      equ     200
QD      equ     100
GAP     equ     15
REP     equ     6
pst1    equ     2200    
pst2    equ     3740    
pst3    equ     3044    ;mod-3 is simply the best!!!!
bst1    equ     1870
bst2    equ     2340
bdist   equ     500
ist     equ     2667

        org     start

                dat     10*QS, 2*QS 
table:          dat             4*QS, 1*QS 
                dat     23*QS, 3*QS 

qbomb:          jmp     -200, GAP
qinc:           dat     GAP,-GAP

tab:            add.a   table,table
slow:           add.ab  @tab,fnd
fast:           add.b   *tab,@slow
which:          sne.i   datz,@fnd
                add.ab  #QD,fnd

                mov.i   qbomb,@fnd
fnd:            mov.i   -GAP/2,@QB
                add.ba  fnd,fnd
                mov.i   qbomb,*fnd
                add.f   qinc,fnd
                mov.i   qbomb,@fnd
                djn.b   -3,#REP
                jmp     ip,}-300

start:
                seq.i  QB+QS*0,QB+QS*0+QD
                jmp    which,}QS*13 ; qinc+GAP

                seq.i  QB+QS*1,QB+QS*1+QD
                jmp    fast,}QB+QS*1+QD/2
                seq.i  QB+QS*2,QB+QS*2+QD
                jmp    fast,{tab
                seq.i  QB+QS*3,QB+QS*3+QD
                jmp    fast,}tab

                seq.i  QB+QS*13,QB+QS*13+QD
                jmp    fast,{fast

                seq.i  QB+QS*4,QB+QS*4+QD
                jmp    >fast,}QB+QS*4+QD/2
                seq.i  QB+QS*5,QB+QS*5+QD
                jmp    slow,}QB+QS*5+QD/2
                seq.i  QB+QS*6,QB+QS*6+QD
                jmp    slow,{tab
                seq.i  QB+QS*7,QB+QS*7+QD
                jmp    slow,}tab

                seq.i  QB+QS*10,QB+QS*10+QD
                jmp    >fast,<tab
                seq.i  QB+QS*11,QB+QS*11+QD
                jmp    slow,<tab
                seq.i  QB+QS*12,QB+QS*12+QD
                djn.f  slow,tab

                seq.i  QB+QS*23,QB+QS*23+QD
                jmp    >fast,>tab
                seq.i  QB+QS*24,QB+QS*24+QD
                jmp    slow,>tab

                seq.i  QB+QS*17,QB+QS*17+QD
                jmp    slow,{fast

                seq.i  QB+QS*8,QB+QS*8+QD
                jmp    <fast,}QB+QS*8+QD/2
                seq.i  QB+QS*9,QB+QS*9+QD
                jmp    tab,}QB+QS*9+QD/2

                seq.i  QB+QS*15,QB+QS*15+QD
                jmp    tab,<tab
                seq.i  QB+QS*16,QB+QS*16+QD
                jmp    tab,{tab
                seq.i  QB+QS*20,QB+QS*20+QD
                djn.f  <fast,tab
                seq.i  QB+QS*21,QB+QS*21+QD
                jmp    tab,{fast
                seq.i  QB+QS*22,QB+QS*22+QD
                djn.f  tab,tab
                seq.i  QB+QS*27,QB+QS*27+QD
                jmp    <fast,>tab
                seq.i  QB+QS*28,QB+QS*28+QD
                jmp    tab,>tab

                seq.i  QB+QS*30,QB+QS*30+QD
                jmp    tab,}tab

ip      spl     1,      <-1000          ;generates 8 parallel processes
        spl     1,      <-2000          
        spl     1,      <-7000

m1      mov     {bptr1, <bptr1          ;now boot the paper
m2      mov     {bptr2, <bptr2          ;to 3 different locations
m3      mov     {bptr3, <bptr3          ;impstep away from each other
                                
        spl     g3,     <-3000          ;OK, they are copied,
        spl     g2,     <-4000          ;now starting them with a
g1      jmp     @bptr1, <-5998          ;binary launcher
g2      jmp     @bptr2, <-5999          
g3      mov     qinc,   @-6000          
        spl     @bptr3                  ;spl to start also the master

s1      spl     @s1,    }pst1           ;first paper cell
        mov.i   }s1,    >s1
s2      spl     @s2,    }pst2           ;second paper cell
        mov.i   }s2,    >s2
        mov.i   {-bst1,<bst1            ;bombing a bite
s3      spl     @s3,    }pst3           ;third paper cell
        mov.i   }s3,    >s3
imp     mov.i   #ist, *0                        ;and the imp

bptr1   dat     imp+1,  imp+1+bdist             ;here are the
bptr2   dat     imp+1,  imp+1+bdist+ist         ;boot pointers  
bptr3   dat     imp+1,  imp+1+bdist+2*ist       

datz:   dat     0, 0
