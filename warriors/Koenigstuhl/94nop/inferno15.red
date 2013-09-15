;redcode-94
;name Inferno 1.5
;author Philip Kendall
;strategy Dat bomber -> 1c clear
;assert CORESIZE==8000

for 0

Just a simple stone - I haven't really got a) any good ideas b) any time
to code a decent warrior :-( This loses to almost everything I run it
against, but that isn't really that much of a shock as it only uses 1 process.
But, then again, so will Franz's warrior, so it may have a chance, but I'm
not expecting much...

If anyone's wondering why it's called Inferno, it's based on the engine I
used in an incendiary bomber a while back, and I couldn't think of any
new names, so it's still called Inferno...

rof

step    equ     3205
bomb1   equ     hit+step
ptr     equ     inc
cstart  equ     (cbomb+4-inc)
bomblen equ     ((CORESIZE/15))
bdist   equ     1265

inc     dat.i   #(3*step),#(3*step)
sptr    dat.i   #loop,#inc
dbomb   dat.i   #step,#0
loop    mov.i   @dbomb,*stone
        mov.i   @dbomb,@stone
stone   mov.i   @bomb1,*(bomb1+step)
        add.i   @sptr,@-2
hit     djn.b   *sptr,#bomblen
clear   mov.i   @cbomb,}inc
        mov.i   @cbomb,}inc
        djn.i   @safety,}inc
safety  jmp.a   @safety,#clear
        dat.i   #0,#0
cbomb   dat.i   #cstart,#0

bstone
dummy   for     (cbomb-inc+1)
        mov.i   }bptr1,}bptr2
        rof
        jmp.a   @0,#(loop+bdist)
bptr1   dat.i   #inc,#0
bptr2   dat.i   #(inc+bdist),#0

        for     (MAXLENGTH-CURLINE)/7
        dat.a   #1,#1
        dat.b   #1,#1
        dat.ba  #1,#1
        dat.x   #1,#1
        dat.i   #1,#1
        dat.a   #1,*1
        dat.b   #1,*1
        rof

        for     (MAXLENGTH-CURLINE)
        dat.a   #1,#1
        rof

        end     bstone


