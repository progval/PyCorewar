;redcode-mixed
;name Can't think of any ...
;author Philip Kendall
;strategy Can't think of any decent names this week :-)
;strategy '88, '94 and multi: paper-launched imp
;strategy lp: dat bomber -> 1c clear
;assert 1

;NOTE TO BEPPE: this gives 2 warnings when compiled without the for/rofs in;
;these are due to repetition of the 'start' label and are perfectly OK.

;BDECWT round 5
;opponent Steven Morrell

;Well, the idea is to get lots of ties with the paper-launched imps in both
;'94 and '88, and hopefully get more points than Steven in the multi hill
;using _the same_ paper-launched imp as in '94. Therefore, because I have
;reused the same warrior in '94 and multi, I have lots of lines of code left
;(21 to be precise) for the low process environment, so I should be able
;to beat Steven over there as well (unless he comes up with a bomb dodger,
;in which case I'll crash like a stone :-( )

;code for '94 and multi hill here (MAXCYCLES == 79999 for multi hill)

        for     (MAXCYCLES <= 80000 && MAXPROCESSES > 8)

dist94  equ     (-40*127)
istep94 equ     2667

start   spl.a   1
        mov.i   -1,0
        spl.a   1

diehard spl.a   @0,dist94
        mov.i   }diehard,>diehard
        spl.a   #0
        spl.a   imp94+(2*istep94)
        spl.a   imp94+istep94
imp94   mov.i   #istep94,*0

rof

;code for '88 here

        for     (MAXCYCLES == 80001)

dist88  equ     (-40*127)
istep88 equ     2667
magic   equ     5715

start   spl     1
        spl     1
        mov     -1,0

paper   mov     <ptr1,<ptr2
        add     #magic,ptr1+dist88
ptr1    spl     paper+dist88,imp88+1
ptr2    spl     0,imp88+1+dist88
        spl     imp88+(2*istep88)
        spl     imp88+istep88
imp88   mov     0,istep88

rof

;code for low process here

        for     (MAXPROCESSES == 8)

step    equ     3205
bomb1   equ     (hit+step)
trigger equ     (hit-step)

ptr     equ     (cbomb-1)
cstart  equ     (mbomb+3-ptr)

cbomb   dat.f   -20,cstart
dbomb   dat.f   2,2
start   mov.i   dbomb,*stone
x       mov.i   mbomb,@stone
stone   mov.i   bomb1,*bomb1+step
        add.f   inc,@x
hit     jmz.f   start,trigger
inc     spl.a   #(step*3),>(step*3)
clear   mov.i   cbomb,>ptr
        mov.i   cbomb,>ptr
        djn.f   clear,>ptr
        dat.f   0,0
mbomb   mov.i   step,1

        rof

        end     start

