;redcode-94
;name Maybe
;author Ilmari Karonen
;strategy Very simple table-based pseudorandom switcher
;strategy  Weights optimized using an "ecosystem" approach
;strategy  since I have no idea what I'll be against.
;assert CORESIZE == 8000
;planar pspace, other, boot, scan, stun, bomber, clear, paper

;>These particular values give a rather good overall performance.
;>This tends to do rather badly against TimeScape, though. Since
;>other versions do that too, I can only assume my test population
;>is biased. I just wish I knew what I'm facing.

; Switcher constants
PSTRAT  equ     375
PRAND   equ     7
rmagic  equ     6441

; TimeScape constants
TSTEP   equ     1800
CSTEP   equ     3740
NSTEP   equ     -1922
FSTEP   equ     1870

; Mini HSA constants
hstep   equ     9
hptr    equ     (hbomb-5)

        org     think

; ** TimeScape

strat2  stp.a   #2, think       ; I hope it's OK to leave these around..
        stp.a   rand, guess

        spl     1,              <-200
        spl     1,              <-300
        mov.i   -1,             0

tim1    spl     @tim1,          }TSTEP
        mov.i   }tim1,          >tim1
cel1    spl     @cel1,          }CSTEP
        mov.i   }cel1,          >cel1
        mov.i   {-FSTEP,        <FSTEP
        mov.i   {cel1,          <ncl1
ncl1    jmp     @ncl1,          >NSTEP

; ** Switching table

in      dat     0, loss-strat
strat   dat     0, win-strat
rand    dat     0, tie-strat

; ** Carbonite & boot

strat1  stp.a   #1, think
        stp.a   rand, guess

        mov.i   dbomb, }cboot
cboot   spl     datz+4, }969    ; silk-style boot
        z for 4
        mov.i   dbomb+z, }cboot
        rof

dbomb   dat     >-1, >1
        spl     #0, <-100
        mov     dbomb, tar-197*3500
tar     add     #197, -1        ; gets bombed to start coreclear
        djn.f   -2, <-1151

; ** Mini HSA & boot

strat0  stp.a   #0, think
        stp.a   rand, guess

        mov.i   hbtm, @hboot
        z for   8
        mov.i   hbtm-z, <hboot
        rof
        spl     @hboot, }999
hboot   mov.ab  #250, @datz+14  ; just enough to keep ptr outside the decoy
        mov.i   hbomb, <hboot
        div.f   #0, hboot

hbomb   spl     #1, {1
hkill   mov.i   hbomb, <hptr
hmptr   mov.i   >hptr, >hptr
        jmn.f   hkill, >hptr
ha      add.ab  #hstep+1, @hmptr
hscan   jmz.f   ha, <hptr
        slt.b   @hmptr, #hbtm-hptr+3
        djn.b   hkill, @hmptr
        djn.b   ha, #16
hbtm    jmp     ha, {hkill

; ** P-switcher with pseudorandom number generator

; 7+2(+1) cycles
; no need for anti-brainwash
; STPs included with components

think   ldp.a   #PSTRAT, strat  ; load previous strategy
        ldp.a   #0, in          ; load result
        add.ba  *in, strat      ; get table index
guess   ldp.a   #PRAND, rand    ; load random value
        mul.a   #rmagic, rand   ; iterate
        slt.a   *strat, rand
        jmp     strat0, }rand
        slt.ba  *strat, rand
        jmp     strat1, }rand
        jmp     strat2, }rand

; ** Probability table

loss    spl     #0091, 0091+2369
        spl     #0587, 0587+2964
        spl     #0512, 0512+2535

win     spl     #1030, 1030+4053
        spl     #3712, 3712+0552
        spl     #1385, 1385+2465

tie     spl     #3145, 3145+1514
        spl     #1584, 1584+2173
        spl     #4488, 4488+0281

; ** Decoy

decoy   z for   (MAXLENGTH-CURLINE)
        spl     #-666z, 999z
        rof

datz    end
