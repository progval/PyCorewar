;redcode
;name Interlaced 0
;author Planar
;strategy p-switching Sad and Torch
;assert CORESIZE == 8000

;; For round 7 of the Redcode Maniacs Tournament.


PREVR   equ     348
NEXTR   equ     673

        org     think


think:
prevr:  ldp.a   #PREVR, prevr
        ldp.a   #NEXTR, nextr
        ldp.a   #0,     1
        add.a   #0,     prevr
        add.a   #1,     prevr
        stp.a   prevr,  pptr
        stp.ab  nextr,  pptr

        mod.a   #2,     nextr

nextr:  spl     @0,     bstone
        nop     0,      bpaper
pptr:   mod.f   #NEXTR, #PREVR
        dat     0,      0


;; Paper section: Sad 1.0 (as found in Benj's Revenge)

len     EQU 9
fcp     EQU 3039
scp     EQU 2365
tcp     EQU 777

away    equ     1387

pfirst: spl 1,  >-3000    ; 7 processes replace 9 in CCPaper
        spl 1,  <-3200    ; for cost of extra Mov in launcher.
        mov -1, 0

frog    spl @0,         <fcp-len
        mov }-1,        >-1
        mov }-2,        >-2
        spl @0,         <scp
        mov }-1,        >-1
        spl @0,         <tcp
        mov }-1,        >-1
        mov 2,          <-fcp+len+1   ; Wipe uncle.
        jmp -1,         <-10
plast:  dat <2667,      <2667*2

bpaper:
    i FOR plast+1-pfirst
        mov.i   <pboot, {pboot
    ROF
pboot:  jmp     away,   plast+1


;; Stone section: Torch t18

step     equ   54
count    equ   2000
boot     equ   4300

bstone:  mov   sm,*p1               ; boot away
         mov   w2,@p1
spl1     spl   1,1                  ; using 2 processes
         mov   <bp,{bp
         mov   <bp,{bp
         mov   <bp,{bp
         mov   <bp,{bp
         djn   *p2,#1               ; ignite torch
         mov   spl1,@p2
p1       div.f #sm+boot,#w2+boot    ; erase pointers
p2       div.f #sp+boot,#sm+boot+30 ;
bp       div.f #cp+1+boot,#cp+1     ;
     for 10
         dat   0,0
     rof

gate     dat   0,0
     for 3
         dat   0,0
     rof
w2       dat   -7,cp-gate+3
         dat   0,0
wipe     dat   -7,cp-gate+3
sp       spl   #-1-step,-step    ; spl half of the incendiary
in       sub   #step+step,1
msm      mov   sm,*tgt+(step*count)-17228
msp      mov   sp,@msm           ; bomb alternately with spl & mov
tgt      jmz   in,#0             ; bombed with spl to start clear
clr      mov   @cp,>gate
cp       djn.b clr,{wipe+1
     for 2
         dat   0,0
     rof
sm       mov   step+1,>step+1    ; mov half of the incendiary


;; Decoy

    FOR MAXLENGTH-CURLINE
        spl     #1, 1
    ROF

        end
