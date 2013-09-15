;redcode-94x
;name dark skies
;author Simon Wainwright
;strategy oneshot test
;assert CORESIZE==800

st equ 272

gate   dat      ptr,   ptr-5
       dat   squash,       8
squash spl     #-70,      10
clear  mov    @bptr,   >gate
       mov    @bptr,   >gate
bptr   djn.f  clear, {squash

       for        4
       dat        0,       0
       rof

inc    spl    #st-1,     <st
ptr    seq     st-1,    st-9
       add.f    ptr,      }2
       add      inc,   *gate
       djn.f  *gate,    }ptr
       end      ptr

