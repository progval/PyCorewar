;redcode-94x
;name BigImps
;author James Layland
;contact jlayland@grissom.jpl.nasa.gov
;assert CORESIZE==55440

;macro

;strategy Hope I have more time for the next round.
;strategy My 55440 scanner and paper were dismal failures, so...

offset1 equ 4141        ; constant randomly chosen from thin air

imp equ src +offset1 + 100

boot    mov <src, <dst
        mov <src, <dst
        mov <src, <dst
        mov <src, <dst
        mov <src, <dst

dst     spl @0, src+offset1

        mov imp1, imp

        mov wimp, imp -50
        spl @-1

        mov  c3, imp-120
        mov  c2, <-1
        mov  c1, <-2
        spl  @-3

; Gee, this automatic programmer thing is pretty cool!
; 26-process 13-point spiral (coresize 55440, '94 standard)
step    equ     34117
launch
        spl     lbl3
        spl     lbl5
        spl     lbl9
        spl     lbl17
        spl     lbl33
        jmp     imp+0*step+0
lbl33   jmp     imp+1*step+0
lbl17   spl     lbl35
        jmp     imp+2*step+0
lbl35   jmp     imp+3*step+0
lbl9    spl     lbl19
        spl     lbl37
        jmp     imp+4*step+0
lbl37   jmp     imp+5*step+0
lbl19   spl     lbl39
        jmp     imp+6*step+0
lbl39   jmp     imp+7*step+0
lbl5    spl     lbl11
        spl     lbl21
        spl     lbl41
        jmp     imp+8*step+0
lbl41   jmp     imp+9*step+0
lbl21   spl     lbl43
        jmp     imp+10*step+0
lbl43   jmp     imp+11*step+0
lbl11   spl     lbl23
        spl     lbl45
        jmp     imp+12*step+0
lbl45   jmp     imp+0*step+1
lbl23   spl     lbl47
        jmp     imp+1*step+1
lbl47   jmp     imp+2*step+1
lbl3    spl     lbl7
        spl     lbl13
        spl     lbl25
        spl     lbl49
        jmp     imp+3*step+1
lbl49   jmp     imp+4*step+1
lbl25   spl     lbl51
        jmp     imp+5*step+1
lbl51   jmp     imp+6*step+1
lbl13   spl     lbl27
        spl     lbl53
        jmp     imp+7*step+1
lbl53   jmp     imp+8*step+1
lbl27   spl     lbl55
        jmp     imp+9*step+1
lbl55   jmp     imp+10*step+1
lbl7    djn.b   0,      #2      ; Idle 2 cycles
        spl     lbl57
        jmp     imp+11*step+1
lbl57   jmp     imp+12*step+1
imp1     mov.i   0,      step

; extra-extra stone

stepsize equ 22964

stone    mov <3, 1+stepsize
extra    spl -1,<-11111                 ; get lots o' cycles
         add inc,stone
cnt      djn extra,<inc-129-1100
inc      dat #-stepsize,#stepsize

src     dat #0


c1      spl #0, <-10
c2      mov 10, <-10
c3      jmp -1, <-12

wimp    jmp 0, <-15

decoy

for 124
        dat <src, #1
rof
end boot

