;redcode-94b
;author John K. Lewis
;strategy "Smart" program.  Uses P-Space to remember last fight.
;name Batz Maru
;assert 1
result  ldp #0,#0       ; load in last result
prog    ldp #1, #0      ; load in last program
        seq #1, -2      ; stick with a winner
        add #1, prog    ; if we lost try next program
        seq #0,prog
        mov.ba prog, 3  ; grab program pointer
        mod.a 2,#2
        stp.a #1,1
        jmp.a @1, dbomb+1       ; eventual pointer

dat 0, scan
dat 0, time

dbomb   dat     >-1, >1
        spl     #0, <-100
        mov     dbomb, tar-197*3500
tar     add     #197, -1                ; gets bombed to start coreclear
        djn.f   -2, <-1151

dat 0,0
dat 0,0

step EQU 9
ptr EQU (bomb-5)

bomb: spl    #1,{1
kill: mov    bomb,<ptr
mptr: mov    >ptr,>ptr
      jmn.f  kill,>ptr
a:    add    #step+1,@mptr
scan: jmz.f  a,<ptr
      slt    @mptr,#btm-ptr+3
      djn    kill,@mptr
      djn    a,#16
btm:  jmp    a,{kill




dat 0,0
dat 0,0

TSTEP equ 1800
CSTEP equ 3740
NSTEP equ -1922
FSTEP equ 1870

time    spl     1,              <-200
        spl     1,              <-300
        mov.i   -1,             0

tim1    spl     @tim1,          }TSTEP
        mov.i   }tim1,          >tim1
cel1    spl     @cel1,          }CSTEP
        mov.i   }cel1,          >cel1
        mov.i   {-FSTEP,        <FSTEP
        mov.i   {cel1,          <ncl1
ncl1    jmp     @ncl1,          >NSTEP

end
