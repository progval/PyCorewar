;redcode-tiny
;name holograph
;author Simon Wainwright
;strategy oneshot
;assert CORESIZE==800

st equ 48
gp equ 120
fi equ (ptr+st+5)

       dat        0,       0
gate   dat        0,       0
       dat        0,       0
       dat      -30,      10
squash spl    #-100,      12
       mov    @bptr,   >gate
clear  mov    @bptr,   >gate
       mov    @bptr,   >gate
bptr   djn.f  clear, {squash

       dat        0,       0

inc    spl     #-st,    <-st
scan   sub      inc,     ptr
ptr    sne    fi+gp,      fi
       sub      inc,     ptr
p      sne     *ptr,    @ptr
       djn.f   scan,    @ptr
       mov.f     @p,    gate
       sne     @ptr,   <-197
       add.x    #gp,    gate
       djn.f squash,    <195
       end      ptr

