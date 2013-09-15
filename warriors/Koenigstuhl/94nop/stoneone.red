;redcode-94
;name Stone One
;author Philip Kendall
;strategy Stone/imp
;assert CORESIZE==8000

qb      equ     (qscan+400)
qs      equ     200
qd      equ     100
gap     equ     15
rep     equ     6
empty   equ     (first-1)

step    equ     3044
stream  equ     (inc-31)

first   spl.a   #0,6
inc     spl.a   #step,>-step
stone   mov.i   <(step-2),(1-step)
        add.f   inc,stone
        djn.f   stone,<stream
last    nop.f   >-1,}-2680

istep   equ     5091

spiral  spl.a   #0,>prime
prime   mov.i   imp,imp
        add.a   #(istep+1),jumper
jumper  jmp.a   (imp-istep-1),}-1000
imp     mov.i   #istep,*0

         dat    10*qs, 2*qs ; can get 21 values from this table
table    dat     4*qs, 1*qs ; and can also use the initial value
         dat    23*qs, 3*qs ; of fnd
qbomb    jmp    -200,gap
qinc     dat    gap,-gap

tab      add.a  table,table
slow     add.ab @tab,fnd
fast     add.b  *tab,@slow
which    sne.i  empty,@fnd
         add.ab #qd,fnd

         mov.i  qbomb,@fnd
fnd      mov.i  -gap/2,@qb
         add.ba fnd,fnd
         mov.i  qbomb,*fnd
         add.f  qinc,fnd
         mov.i  qbomb,@fnd
         djn.b  -3,#rep
         jmp    boot,}-300

qscan    seq.i  qb+qs*0,qb+qs*0+qd
         jmp    which,}qs*13 ; qinc+gap

         seq.i  qb+qs*1,qb+qs*1+qd
         jmp    fast,}qb+qs*1+qd/2
         seq.i  qb+qs*2,qb+qs*2+qd
         jmp    fast,{tab
         seq.i  qb+qs*3,qb+qs*3+qd
         jmp    fast,}tab
         seq.i  qb+qs*13,qb+qs*13+qd
         jmp    fast,{fast

         seq.i  qb+qs*4,qb+qs*4+qd
         jmp    >fast,}qb+qs*4+qd/2
         seq.i  qb+qs*5,qb+qs*5+qd
         jmp    slow,}qb+qs*5+qd/2
         seq.i  qb+qs*6,qb+qs*6+qd
         jmp    slow,{tab
         seq.i  qb+qs*7,qb+qs*7+qd
         jmp    slow,}tab
         seq.i  qb+qs*10,qb+qs*10+qd
         jmp    >fast,<tab
         seq.i  qb+qs*11,qb+qs*11+qd
         jmp    slow,<tab
         seq.i  qb+qs*12,qb+qs*12+qd
         djn.f  slow,tab
         seq.i  qb+qs*17,qb+qs*17+qd
         jmp    slow,{fast
         seq.i  qb+qs*23,qb+qs*23+qd
         jmp    >fast,>tab
         seq.i  qb+qs*24,qb+qs*24+qd
         jmp    slow,>tab

         seq.i  qb+qs*8,qb+qs*8+qd
         jmp    <fast,}qb+qs*8+qd/2
         seq.i  qb+qs*9,qb+qs*9+qd
         jmp    tab,}qb+qs*9+qd/2
         seq.i  qb+qs*15,qb+qs*15+qd
         jmp    tab,<tab
         seq.i  qb+qs*16,qb+qs*16+qd
         jmp    tab,{tab
         seq.i  qb+qs*20,qb+qs*20+qd
         djn.f  <fast,tab
         seq.i  qb+qs*21,qb+qs*21+qd
         jmp    tab,{fast
         seq.i  qb+qs*22,qb+qs*22+qd
         djn.f  tab,tab
         seq.i  qb+qs*27,qb+qs*27+qd
         jmp    <fast,>tab
         seq.i  qb+qs*28,qb+qs*28+qd
         jmp    tab,>tab
         seq.i  qb+qs*30,qb+qs*30+qd
         jmp    tab,}tab

bdist1  equ     -113
bdist2  equ     123

boot
i       for     5
        mov.i   (first+i-1),>bptr1
        mov.i   (spiral+i-1),>bptr2
        rof
        mov.i   last,>bptr1
bptr2   spl.a   (spiral+bdist2),(spiral+bdist2)
        mul.f   bptr2,bptr2
bptr1   spl.a   (first+bdist1),(first+bdist1)
        mul.f   bptr1,bptr1

        dat.f   1,1
        spl.a   #1,1
        spl.b   #1,1
        spl.ab  #1,1
        spl.ba  #1,1
        spl.f   #1,1

        end     qscan
