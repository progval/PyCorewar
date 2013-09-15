;redcode-lp
;name Judgement Day
;author Philip Kendall
;strategy pspacing dodger & scanner
;assert CORESIZE==8000

for 0

BDECWT final replay: opponent Ian Oversby

right, OK, after we both submitted Die Hards for the final, we've got chucked
off here into low process... what this basically is a pspacing a bomb dodger
(a slightly modified Clisson) and a one-pass scanner -> 1c core-clear - this
combination successfully beats most things, which the exception of scanners,
but I don't think it's that likely I'll end up against one (at least, I hope
I won't). What Ian will hopefully come up with: a stone or a dodger, or even
a pspaced dodger/stone

rof

pspace  equ     238

start   ldp.ab  #0,#0
str     ldp.a   #pspace,strat
        jmn.b   good,start
        nop.f   }strat,}2667
        stp.ab  strat,#pspace
good    mod.a   #2,strat
strat   jmp.a   @0,bootcl
        dat.f   0,syzygy

bdist2  equ     -231

Clisson sne.i   {watch1,{watch1      ; Clisson to beat fast bombers
        jmz.f   -1,@64
        add.a   #3,watch1
        mov.i   <watch1,{watch1
        djn.b   -1,#5
        add.a   #1,watch1
watch1  jmp.a   -200,qb+5
qb      dat.f   #1 ,-3               ; Clisson's killer
q1      spl.a   #0 ,#0
        mov.i   qb ,<q4
q4      djn.b   -2 ,#qb
q5      dat.f   0,0

bootcl
i       for     (q5-Clisson+1)
        mov.i   (Clisson+i-1),>bptr2
        rof
bptr2   spl.a   (Clisson+bdist2),(Clisson+bdist2)
        mul.f   bptr2,bptr2

scan1   equ     109
sep     equ     6
step    equ     15
bomblen equ     10
stream  equ     (-211+loop)
cstart  equ     (last+4-ptr)
ptr     equ     (dbomb-5)
istep   equ     2667
bdist   equ     1032

dbomb   dat.f   -20,cstart
ibomb   dat.f   >istep,>(2*istep)
loop    add.f   inc,scan
scan    sne.i   scan1,scan1+sep
        add.f   inc,scan
        sne.i   *scan,@scan
        djn.f   loop,<stream
        mov.ab  #bomblen,count
bloop   mov.i   ibomb,}scan
count   djn.b   bloop,#0
        sub.a   #bomblen,scan
        seq.i   loop,ibomb
        jmp.a   loop,}2667
inc     spl.a   #step,>step
clear   mov.i   dbomb,>ptr
        mov.i   dbomb,>ptr
        djn.f   clear,>ptr
last    jmp.a   inc,>step

syzygy
i       for     (last-dbomb+1)
        mov.i   (dbomb+i-1),>bptr
        rof
bptr    spl.a   (scan+bdist),(dbomb+bdist)
i       for     5               ; prevent self-scanning
        mov.i   start+3+((i-1)*step),start+3+((i-1)*step)+sep
        rof
        mul.f   bptr,bptr

        for     (MAXLENGTH-CURLINE)/15
        dat.f   1,1
        dat.f   1,#1                    ; scanned
        dat.f   1,*1
        dat.f   1,@1
        dat.f   #1,1
        dat.f   #1,#1
        dat.f   #1,*1
        dat.f   1,#1                    ; scanned
        dat.f   #1,@1
        dat.f   *1,1
        dat.f   *1,#1
        dat.f   *1,*1
        dat.f   *1,@1
        dat.f   @1,1
        dat.f   @1,#1
        rof

        end     start
