;redcode-94x
;name Four Winds
;author John Metcalf
;strategy oneshot
;assert CORESIZE==800

     step  equ 694
     diff  equ 5

sc:  sub   inc,            ptr
ptr: sne.b >step*4+diff,   >step*4
     djn.f sc,             <ptr

inc: spl   #-step,         <-step-1
     mov   @bptr,          >ptr
     mov   @bptr,          >ptr
bptr:djn.f -2,             {clr

     dat   -5,             8
clr: spl   #-101,          16

     end   ptr
