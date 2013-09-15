;redcode-94
;name Dan Dare
;author Simon Wainwright
;strategy paper, oneshot
;assert 1

       org    think

w1 
gate   mul    #5753,    #325
       jmz.f   gate,   <gate

       spl     #0,         0
clear  mov    @bptr,   >gate
       mov    @bptr,   >gate
bptr   djn.f  clear, {squash
       dat       -5,       8
squash spl    #-200,      15


       for       18
       dat        0,       0
       rof

state  equ (w1-300)

think  ldp   }state,   state
       ldp.ab state,  @state
       stp.a @state,<state+1
       jmz.b     w1,@state+1
       jmp       w2

       for       20
       dat        0,       0
       rof

w2     spl        1
       spl        1
       spl        1
papera spl       @0,   >3039 
       mov  }papera, >papera
paperb spl       @0,   >2936 
       mov  }paperb, >paperb
       mov    sting,   >2376 
       mov  {paperb, <paperc
paperc jmz.a     @0,    2346 
sting  dat        1,       1

       end

