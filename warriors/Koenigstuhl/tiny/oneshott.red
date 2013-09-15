;redcode-94x
;name One Shot 'T'
;author Philip Kendall
;strategy Boot -> one shot
;assert CORESIZE==800 
;planar boot, scan, clear, gate

        for     CORESIZE==800
step    equ     24
sep     equ     12
bdist   equ     108
stream  equ     -150
scan1   equ     (cptr+22)
        rof

        for     CORESIZE==8000
step    equ     30
sep     equ     15
bdist   equ     1083
stream  equ     -1500
scan1   equ     (cptr+22)
        rof

ptr     equ     (dbomb-3)
cstart  equ     (cptr+2-ptr)

start   spl.a   1,>-100
        for     5
        mov.i   >sptr,>dptr
        rof
sptr    mod.a   #1,#dbomb
dptr    spl.a   (scan+bdist),(dbomb+bdist)
        div.f   dptr,dptr
        dat.f   0,0

dbomb   dat.f   -20,>cstart
sbomb   spl.a   #0,>cstart
loop    sub.f   inc,scan
scan    sne.i   scan1,scan1+sep
        djn.f   loop,<stream
        mov.ab  scan,ptr
inc     spl.a   #-step,>-step
clear   mov.i   @cptr,>ptr
        mov.i   @cptr,>ptr
cptr    djn.b   clear,{sbomb

        end     start

