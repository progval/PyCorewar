;redcode-94x
;name clock strikes twelve
;author John Metcalf
;strategy .75c oneshot
;assert CORESIZE==800

     s equ 17
     o equ 14 ; 3

ptr: dat   o+s*4,  o+s*3

     for 2
     dat 0,0
     rof

     dat   -5,     10
clr: spl   #-300,  20
     mov   @bptr,  >ptr
     mov   @bptr,  >ptr
     mov   @bptr,  >ptr
bptr:djn.f -2,     {clr

     for 6
     dat 0,0
     rof

loop:sub   a,      @a
sc:  sne.x *ptr,   @ptr
a:   sub.x #-2*s,  ptr     ; s = a-ptr
     jmz.f loop,   @ptr
     jmp   clr,    <ptr                                           

     end   sc

