;redcode
;name Gene Pool 239
;author Blake Escritt
;strategy P-switch (9 Evolved Warriors)
;strategy -=P-logic=-
;strategy Very agressive, switches on two consecutive losses/ties.
;strategy -=Evolvers=-
;strategy The best evolvers from generation 239 of an evolving run, pswitched.
;strategy Since this warrior is from a young run, it doesn't perform 
;strategy well at all.
;strategy May possibly smash simple warriors.
;assert 1

ORG think

STRAT equ 57
LAST equ 79

think   ldp.ab  #0,       #0      ;load result last match
str     ldp.a   #STRAT,  str1    ;load strategy in use
res2    ldp.ab #LAST, #0
       stp.b think, #LAST
   seq.ab  #1,     think   ;check result, win OK
lost    mov.a #1, switch
       seq.b res2, #1
switch  add.a #0, str1
mod.a   #9,     str1    ;secure jump
win     stp.ab  str1,   #STRAT    ;save strategy
str1    jmp     @0,     s9
        dat 0,   se
        dat 0,   sa
        dat 0,   s7       

        dat 0,   s8
        dat 0,   s1
        dat 0,   sf
        dat 0, ravens

        dat 0, s6
       
        jmp.i  $   -1 , }   -1
        spl.x  #   -2 , #-2281
        spl.b  @   -1 , } 1754
s9      mov.i  }   -1 , >   -2
        djn.ba $   -3 , {    1
        dat.x  {   -1 , #    0
        dat.a  $  119 , $    0
        
        spl.ab $   -1 , <    0
        spl.i  #   -1 , >   -1
se      spl.ab $   -1 , <   -1
        mov.i  #-3566 , > 1077
        jmp.b  } 2131 , }   -1
        spl.x  }  301 , # -447
        sub.x  {   -5 , *    2
        mul.f  #   -2 , *-1458
        dat.f  $   -1 , #    0
        sne.ab *   56 , { 1507
        
        ldp.ba #   -1 , {   -2
sa      spl.f  #    2 , #  442
        mov.i  {   -2 , {-3416
        spl.f  #   -1 , #  -27
        mov.i  {   -1 , {   -4
        mov.i  {    8 , {-3391
        mov.i  { -550 , {-2027
        add.i  }   -3 , #   -1
        jmz.f  >-3538 , <   -9
        dat.ab {-1032 , #-3108

s7      spl.a  $   -3 , $   -4
        mov.i  <  957 , <  -11
        djn.x  $   -1 , }   -1
        djn.x  $   -1 , @   -6
        
        mov.i  {   -1 , {   44
s8      spl.b  #   -9 , *    0
        mov.i  @ -149 , { -203
        jmp.b  $   -1 , @   -1
        mod.b  @   -3 , >   24

        spl.i  }   17 , <  -18
        mov.i  >  206 , <  -11
s1      jmp.ab $   -1 , }   -1
        jmz.ba #   -4 , @  -11

        djn.i  $    5 , } 2624
        mov.i  <  239 , {   -8
sf      djn.i  $   -1 , }   -1
        djn.i  $   -1 , }   -1
        dat.f  $    0 , $ 2328
        dat.f  $    7 , $   -1

        spl.b  #  -29 , #   62
ravens  spl.b  #  -29 , #    1
        stp.b  #-2291 , >   -2
        mov.i  *    3 , <   -1
        mov.i  <   -1 , <   -1
        djn.x  $   -2 , }   37
        mov.i  <  -17 , {   -6
        nop.ab $    1 , $    1
        mul.i  }    2 , $   -1
        sne.f  @-3204 , @ -618
        sub.a  }  -95 , $  284
        mul.ab $ -353 , @    3
        mul.i  {   16 , #    8
        sne.i  $  690 , >   16
        stp.f  < -191 , > 1535
        sne.b  >    0 , $   25
        div.b  *   -1 , {    1
        spl.ba $    0 , {  395
        slt.ab $  -20 , $  -20
        dat.b  $    1 , <   -1
        dat.f  $   -1 , $   -1

        mov.i  $   -6 , <    0
        mov.i  {    2 , <   -6
s6      djn.b  $   -1 , $   -7
        jmz.f  {-2324 , #    2
        mov.i  <    5 , <  -10
        add.ba >   -2 , >  -57
        spl.a  <   -4 , >   22
        add.b  }   -1 , >    0
        jmp.x  $   15 , <   63
        dat.i  }   -1 , {-3511

