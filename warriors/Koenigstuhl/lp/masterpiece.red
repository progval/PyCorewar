;redcode-94
;name masterpiece
;author Zul Nadzri

;Note: line above was originally `;author L.O.S.E.R.' PK 98/4/17

;strategy  A little bit late to enter this cool tournament.
;strategy  My first entry but this is the last round already.
;strategy  However, here is my redcode.
;strategy  A combination of paper, stone and imp.
;strategy  Slow to boot. Using artificial pspace.
;strategy  OK, let's have some fun.
;strategy  Round 9 (8 processes & 8000 processes)
;assert 1

org start

d       mov a1,>aptr             ;boot
dd      mov c6,3686
        jmz 2,check
        dat {6350,{6250
        mov c3,>cptr
        spl *cptr,{5010
        jmp *cptr,{5000

b       spl e,>check             ;boot
        mov a2,>aptr
        jmz 2,check              
        jmp *aptr,{5050
        mov b2,>bptr
        mov c4,>cptr
        jmp *cptr,{5100

e       mov a3,>aptr             ;boot
        jmz 2,check
        jmp @dd,{4800
        mov b3,>bptr
        mov c5,>cptr
        jmp @dd,{5200

a       spl c,>check             ;boot
        spl f,>check
        mov a4,>aptr
        jmz 2,check
        dat {2900,<3100
        mov b4,>bptr
        spl *cptr,{5350
        jmp *bptr,{5300

f       mov a5,>aptr             ;boot
        jmz 2,check
        dat {2700,<2500
        mov b5,>bptr
        spl *cptr,{5350
        jmp *cptr,{5400

c       spl g,>check             ;boot
        mov a6,>aptr
        jmz 2,check
        dat {2300,<2100
        add.ab #2,bptr
        jmp *cptr,{5500

g       mov a7,>aptr             ;boot
        jmz 2,check
        dat {1900,<1700
        mov b7,>bptr
        spl *cptr,{5550
        jmp *cptr,{5600
        
check   dat 0,-9                 ;boot
start   spl a,>check
        spl b,>check
        spl d,>check
        spl h,>check
        mov a8,>aptr
        jmz 2,check
        dat {1500,<1300
        mov c1,>cptr
        jmp *cptr,{5700

h       jmp 1,>check              ;junkie
        mov b1,>bptr
        mov c2,>cptr
        jmp *cptr,{5800
;----------------------------
a1      dat 0,0                   ;paper
a2      mov #12,a1  
a3      mov @a1,<a8 
a4      djn a3,a1   
a5      spl @a8,0     
a6      add #653,a8
a7      jmz a2,a1
a8      dat #0,#833
aptr    dat 2000+1,2000

b1      spl #0,0                  ;stone
b2      spl #845,<-845
b3      mov >845,-844
b4      add -2,-1
b5      djn.f -2,<-848
b6      dat 0,0
b7      dat 0,#-9
bptr    dat 3000,3000

c1      spl 1,<1000
c2      spl 3,<1234               ;imp
c3      spl 2668,<1345
c4      mov 0,2667
c5      jmp -2667,<1456
c6      jmp 0,0                   
cptr    dat 3500,3500

	end
