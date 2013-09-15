;redcode-lp
;name LP and Feelin' Fine.
;author John K Wilkinson
;assert (CORESIZE == 8000) && (MAXPROCESSES==8)

; pspacing 3 lp warriors such as to be able to beat every LP warrior
; I could get my hands on, except for one, which it ties...
; Too bad pizza's down or I'd test this thing.

step    equ     15
stfang  equ     (stcode-7981+step*3)
sboot   equ     (sneak+1+2541)

        org     start

; --The Sneak--
; This is backwards clear which will be booted away
sneak   mov     bomb, <bclear
        jmp     -1, <bclear
        dat     0,0
        dat     0,0
        dat     0,0
bomb    dat     0, -11
bclear  dat     0, -31

lri
        mov     sneak+0, sboot+0
        mov     sneak+1, sboot+1
        mov     sneak+5, sboot+5
        mov     sneak+6, sboot+6
; 1 process to the sneak
        spl     sboot

; 5 processes to the vamp
        spl     vamp
        spl     vamp
        spl     vamp
        spl     vamp
        spl     vamp

; 1 process to the forward clear
        jmp     myclear

        for     34
        dat     0, 0
        rof

; ---PIT---
pit     spl     1, pclear
        mov     dbomb, >pclear
hit1    jmp     pit, pclear
; ---------

        dat     0, 0
        dat     0, 0
        dat     0, 0
        dat     0, 0

hit2    dat     0, 0
        dat     0, 0
        dat     0, 0
pclear  dat     0, 50
        dat     0, 0

hit3    dat     0, 0
        dat     0, 0
        dat     0, 0
        dat     0, 0
jbomb   jmp     #0, #0

hit4    dat     0, 0

; --Bomber--
stcode
inc     spl     #-step, step
        dat     0,0
vamp    add     inc, fang
pfang   mov     fang, @fang     ; drop fang
        mov     jbomb, *fang    ; drop jmp bomb
        jmp     vamp, @pfang    ; My memory's hazy about this line
                                ; a jmp vamp, 0 should work exactly the same
        dat     0, 0

; --Clear--
; works with the same ptr as the pit for a fast clear (max 200% c with enemy)
myclear mov     dbomb, >pclear
        jmp     myclear, pclear

hit5    dat     0,0
dbomb   dat     0, 50
        dat     0, 0
        dat     0, 0
fang    jmp     pit-stfang, stfang

;******* BEGIN PSPACE ********

        dat     0,       GAP-1 ; should point to an about-to-switch thingy
in      dat     0,       1  ;loss
        dat     1,      -1  ;win
        dat     1,       0  ;tie

start
think ldp.a  #0,in              ; get input value
load  ldp.a  #PSTATE,state      ; load old state
      mod.a  #STATES,state      ; brainwash protection
      add.ba *in,state          ; select correct state table
store stp.a  *state,load        ; store new state

state jmp    @-state+1, w0
      spl    #-state,   w0
      spl    #-state,   w0
      spl    #-state,   w0
      spl    #-state,   w0
      spl    #(-state+GAP)%STATES, w1

      spl    #-state+1, w1
      spl    #-state,   w1
      spl    #-state,   w1
      spl    #-state,   w1
      spl    #-state,   w1
      spl    #(-state+GAP)%STATES, w2

      spl    #-state+1, w2
      spl    #-state,   w2
      spl    #-state,   w2
      spl    #-state,   w2
      spl    #-state,   w2
      spl    #(-state+GAP)%STATES, w0

w0 equ lri
w1 equ tempest
w2 equ spire
STRATEGIES_PER_STATE equ 6
NUM_STRATEGIES equ 3
GAP EQU (STRATEGIES_PER_STATE-1)
STATES EQU (STRATEGIES_PER_STATE*NUM_STRATEGIES)  ; brainwash protection
PSTATE EQU 250 ; pspace location containing current state

;************** BEGIN TEMPEST *****************

boots equ -801
incr  equ 2946
time  equ 3980

p1    mov #6, #0
      mov <-1, <3
      jmn -1, @-2
      spl @-3, <2151
      jmz.b @0, 3039
      dat {1, <1

for 28
      dat 0,0
rof

stone add.f  2, 1
      mov  > 0+(2*time), 0-(incr*time)
      jmp   -2, <incr

tempest mov stone+2, {ptrs
      mov stone+1, {ptrs
      mov stone+0, {ptrs
      spl p1, {0
      spl p2, {0
ptrs  spl ptrs+boots+3, 0
      spl       * ptrs, 0
      spl       * ptrs, 0
      jmp       * ptrs, {ptrs

for 24
      dat 0,0
rof

p2    mov #6, #0
      mov <-1, <3
      jmn -1, @-2
      spl @-3, <2151
      jmz.b @0, 3359
      dat {1, <1

;************* 8-PROC SPIRAL ****************

d equ 2667

spire   spl 1
        spl 1
        spl 1

        jmp *1, }0
        dat imp+d*0, 0
        dat imp+d*1, 0
        dat imp+d*2, 0
        dat imp+d*3, 0
        dat imp+d*4, 0
        dat imp+d*5, 0
        dat imp+d*6, 0
        dat imp+d*7, 0

        imp: mov.i #0, 2667

