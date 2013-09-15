;redcode-94
;name Always Cooperate
;author Ryan Coleman
;assert 1
;strategy play nice
;strategy still not happy after the last ruling.
;strategy i'd figured this strategy with a large 
;strategy 'pit' of spls and stps was the way to go
;strategy but that does defeat the PD aspect of this tourney
;strategy oh well
org time


;=---time-----

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
dat.f $0,$0
dat.f $0,$0


;----carb----

dbomb   dat     >-1, >1
carb    spl     #0, <-100
        mov     dbomb, tar-197*3500
tar     add     #197, -1                ; gets bombed to start coreclear
        djn.f   -2, <-1151
dat.f $0,$0
dat.f $0,$0
dat.f $0,$0
dat.f $0,$0
dat.f $0,$0
dat.f $0,$0
dat.f $0,$0
dat.f $0,$0

