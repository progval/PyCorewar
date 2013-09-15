;redcode-94nop verbose
;assert 1
;name           sptst (4D-p)
;author         Stefan Foerster
;contact        stefan@francall.com
;url            http://www.home.mnet-online.de/foerster
;version        1.24xp
;date           June 22, 2001
;strategy       paper/clear
;strategy       brainwashing (if PSPACE==1)
;strategy       version 1.24xp
; bigsf: 	107.18
; wilmoo:
PSPACE          equ    0
                org     paper_2
; *********
; constants
; *********
I_BOOT          equ     8
I_SILK          equ     4
I_CLR           equ     (3+PSPACE)
I_REPL          equ     (I_SILK+I_CLR)
I_PAPER         equ     (I_BOOT+I_REPL)
I_BOOT2         equ     8
I_SILK2         equ     4
I_CLR2          equ     (3+PSPACE)
I_REPL2         equ     (I_SILK2+I_CLR2)
I_PAPER2        equ     (6+I_BOOT2+I_REPL2)
I_BOOT3         equ     8
I_SILK3         equ     4
I_CLR3          equ     (3+PSPACE)
I_REPL3         equ     (I_SILK3+I_CLR3)
I_PAPER3        equ     (I_BOOT3+I_REPL3)
I_BOOT4         equ     8
I_SILK4         equ     4
I_CLR4          equ     (3+PSPACE)
I_REPL4         equ     (I_SILK4+I_CLR4)
I_PAPER4        equ     (I_BOOT4+I_REPL4)
;!! I_REPL == I_REPL2 == I_REPL3 == I_REPL4 !!
SC              equ     CORESIZE)/8000)
SPTR0           equ     (silk1+ 1*(CORESIZE/17)-(( 34*SC)  ;  1,- 34
SPTR00          equ     (silk1+ 4*(CORESIZE/17)+(( 20*SC)  ;  4,+ 20
SPTR000         equ     (silk1+ 8*(CORESIZE/17)+((131*SC)  ;  8,+131
SPTR0000        equ     (silk1+13*(CORESIZE/17)+((  0*SC)  ; 13,+  0
SPTR1           equ     (silk1+((2477*SC)    ; +2477
SPTR2           equ     (silk1-((1792*SC)    ; -1792
CINIT           equ     (bomb+45*MINDISTANCE)     ; +45* / +17*
SPTR02          equ     (silk1+10*(CORESIZE/17)+((  0*SC)  ; 10,+  0
SPTR002         equ     (silk1+ 2*(CORESIZE/17)-((  0*SC)  ;  2,-  0
SPTR0002        equ     (silk1+14*(CORESIZE/17)+((  0*SC)  ; 14,-  0
SPTR00002       equ     (silk1+15*(CORESIZE/17)-((  0*SC)  ; 15,+  0
SPTR12          equ     (silk1+((3055*SC)                  ; +3055
SPTR22          equ     (silk1-((3055*SC)                  ; -3055
CINIT2          equ     (bomb_2+27*MINDISTANCE)   ; +27*
SPTR03          equ     (silk1+16*(CORESIZE/17)+((371*SC)  ; 16,+371
SPTR003         equ     (silk1+ 6*(CORESIZE/17)+((293*SC)  ;  6,+293
SPTR0003        equ     (silk1+11*(CORESIZE/17)-((307*SC)  ; 11,-307
SPTR00003       equ     (silk1+ 5*(CORESIZE/17)+((  0*SC)  ;  5,+  0
SPTR13          equ     (silk1+((2798*SC)                  ; +2798
SPTR23          equ     (silk1-((3055*SC)                  ; -3055
CINIT3          equ     (bomb_3-5*MINDISTANCE)      ; -5*
SPTR04          equ     (silk1+ 9*(CORESIZE/17)+((  0*SC)  ;  9,+  0
SPTR004         equ     (silk1+12*(CORESIZE/17)-((123*SC)  ; 12,-123
SPTR0004        equ     (silk1+ 3*(CORESIZE/17)-((329*SC)  ;  3,-329
SPTR00004       equ     (silk1+ 7*(CORESIZE/17)+((  0*SC)  ;  7,+  0
SPTR14          equ     (silk1+((1393*SC)                  ; +1393
SPTR24          equ     (silk1-((2798*SC)                  ; -2798
CINIT4          equ     (bomb_4-39*MINDISTANCE)     ; -39*
TOTAL           equ     (I_PAPER+I_PAPER2+I_PAPER3+I_PAPER4)
; ***********************************
; paper [I_PAPER=I_BOOT+I_REPL instr]
; ***********************************
; boot [I_BOOT=6]
sboot           mov.i   {silk1, {silk0
silk0           spl     SPTR0+I_REPL, {-((666*SC
                mov.i   <silk00, {silk00
silk00          spl     SPTR00+I_REPL, #bomb+1
                mov.i   <silk000, {silk000
silk000         spl     SPTR000+I_REPL, #bomb+1
                mov.i   <silk0000, {silk0000
silk0000        spl     SPTR0000+I_REPL, #bomb+1
; silk replicator  [I_SILK=4]
silk1           spl     @I_REPL, >SPTR1
cpy1            mov.i   }silk1, >silk1
cpy2            mov.i   {silk1, {silk2
silk2           spl     SPTR2+I_REPL, {-((777*SC
; clear bomber [I_CLR=3+PSPACE instr]
shoot           mov.i   bomb, >bomb
                for     (PSPACE==1)
                stp.f   >bomb, bomb
                rof
                djn.f   shoot, >bomb
bomb            dat     >((2667*SC, <CINIT
; *************
; empty space 1
; *************
                for     (MAXLENGTH-TOTAL)/3
                spl     {0, {0     ; {0, {0
                rof
; *****************************************
; paper2 [I_PAPER2=6+I_BOOT2+I_REPL2 instr]
; *****************************************
paper_2         spl     1, {-((333*SC    ; 7+PSPACE processes
                spl     1, {-((433*SC
                for     (PSPACE!=1)
                mov.i   -1, 0
                rof
                for     (PSPACE==1)
                spl     1, {-((533*SC
                rof
                spl     sboot_4, {-((345*SC
                spl     sboot_3, {-((456*SC
                spl     sboot,   {-((321*SC
; boot2 [I_BOOT2=6]
sboot_2         mov.i   {silk1_2, {silk0_2
silk0_2         spl     SPTR02+I_REPL2, {-((666*SC
                mov.i   <silk00_2, {silk00_2
silk00_2        spl     SPTR002+I_REPL2, #bomb_2+1
                mov.i   <silk000_2, {silk000_2
silk000_2       spl     SPTR0002+I_REPL2, #bomb_2+1
                mov.i   <silk0000_2, {silk0000_2
silk0000_2      spl     SPTR00002+I_REPL2, #bomb_2+1
; silk replicator  [I_SILK2=4]
silk1_2         spl     @I_REPL2, >SPTR12
cpy1_2          mov.i   }silk1_2, >silk1_2
cpy2_2          mov.i   {silk1_2, {silk2_2
silk2_2         spl     SPTR22+I_REPL2, {-((777*SC
; clear bomber [I_CLR2=3+PSPACE instr]
shoot_2         mov.i   bomb_2, >bomb_2
                for     (PSPACE==1)
                stp.f   >bomb_2, bomb_2
                rof
                djn.f   shoot_2, >bomb_2
bomb_2          dat     >((2667*SC, <CINIT2
; *************
; empty space 2
; *************
                for     (MAXLENGTH-TOTAL)/3
                spl     {0, {0     ; {0, {0
                rof
; ***************************************
; paper3 [I_PAPER3=I_BOOT3+I_REPL3 instr]
; ***************************************
; boot3 [I_BOOT3=6]
sboot_3         mov.i   {silk1_3, {silk0_3
silk0_3         spl     SPTR03+I_REPL3, {-((666*SC
                mov.i   <silk00_3, {silk00_3
silk00_3        spl     SPTR003+I_REPL3, #bomb_3+1
                mov.i   <silk000_3, {silk000_3
silk000_3       spl     SPTR0003+I_REPL3, #bomb_3+1
                mov.i   <silk0000_3, {silk0000_3
silk0000_3       spl     SPTR00003+I_REPL3, #bomb_3+1
; silk replicator  [I_SILK3=4]
silk1_3         spl     @I_REPL3, >SPTR13
cpy1_3          mov.i   }silk1_3, >silk1_3
cpy2_3          mov.i   {silk1_3, {silk2_3
silk2_3         spl     SPTR23+I_REPL3, {-((777*SC
; clear bomber [I_CLR3=3+PSPACE instr]
shoot_3         mov.i   bomb_3, <bomb_3
                for     (PSPACE==1)
                stp.f   <bomb_3, bomb_3
                rof
                djn.f   shoot_3, <bomb_3
bomb_3          dat     >((2667*SC, <CINIT3
; *************
; empty space 3
; *************
 
                for     (MAXLENGTH-TOTAL)/3
                spl     {0, {0     ; {0, {0
                rof
; ***************************************
; paper4 [I_PAPER4=I_BOOT4+I_REPL4 instr]
; ***************************************
; boot4 [I_BOOT3=6]
sboot_4         mov.i   {silk1_4, {silk0_4
silk0_4         spl     SPTR04+I_REPL4, {-((666*SC
                mov.i   <silk00_4, {silk00_4
silk00_4        spl     SPTR004+I_REPL4, #bomb_4+1
                mov.i   <silk000_4, {silk000_4
silk000_4       spl     SPTR0004+I_REPL4, #bomb_4+1
                mov.i   <silk0000_4, {silk0000_4
silk0000_4      spl     SPTR00004+I_REPL4, #bomb_4+1
; silk replicator  [I_SILK4=4]
silk1_4         spl     @I_REPL4, >SPTR14
cpy1_4          mov.i   }silk1_4, >silk1_4
cpy2_4          mov.i   {silk1_4, {silk2_4
silk2_4         spl     SPTR24+I_REPL4, {-((777*SC
; clear bomber [I_CLR4=3+PSPACE instr]
shoot_4         mov.i   bomb_4, <bomb_4
                for     (PSPACE==1)
                stp.f   <bomb_4, bomb_4
                rof
                djn.f   shoot_4, <bomb_4
                for     (PSPACE!=1)
bomb_4          dat     >((2667*SC, <CINIT4
                rof
                for     (PSPACE==1)
bomb_4          stp.f   <0, #CINIT4
                rof
                end

