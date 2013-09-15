;redcode-lp
;name Romulan Warbird
;author Philip Kendall
;strategy spl-jmp bombing scanner - Irongate inspired
;strategy Let's do something about those papers :-)
;assert CORESIZE==8000
;planar scan,stun,clear,gate

step    equ     98
protect equ     (adjust-scan)
stream  equ     -1308
scan1   equ     (loop+step)

ptr     equ     (inc-2)
cstart  equ     (adjust+2-ptr)

inc     dat.f   (step*2),(step*2)
loop    add.f   inc,@x
scan    cmp.i   scan1+step,scan1
        slt.ab  #protect,@x
        djn.f   loop,<stream
        mov.i   jbomb,@scan
x       mov.i   sbomb,<scan
        add.f   adjust,scan
        jmn.a   @x,inc
sbomb   spl.a   #0,}ptr
clear   mov.i   dbomb,>ptr
jbomb   jmp.a   -1,}ptr
dbomb   dat.f   >2667,>cstart
adjust  dat.f   step,(step+1)

        end     scan

