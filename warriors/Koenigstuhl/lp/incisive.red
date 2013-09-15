;redcode-lp
;name Incisive
;author Robert Macrae
;strategy Blatant rip-off of Limb-Rending Incisors.
;strategy Vamp enemy into the pit, dual clears
;assert (CORESIZE == 8000) && (MAXPROCESSES == 8)

step    equ     45                   ; I did tweak the step.
stfang  equ     (pfang+1+step*5)
sboot   equ     (main+2541+2300)
main    equ     (pit-56)
        org     start

; ---PIT---
pit     spl     1,     pclear
        mov     dbomb, >pclear
hit1    jmp     pit,   pclear
; ---------


        dat     0, 0
        dat     0, 0
        dat     0, 0
        dat     0, 0

hit2    dat     0, 0
        dat     0, 0
        dat     0, 0
pclear  dat     0, 350
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

vamp    add     inc,   fang
pfang   mov     fang,  @fang    ; drop fang
        mov     jbomb, *fang    ; drop jmp bomb
        jmp     vamp

      for 6
        dat     0, 0
      rof
; --Clear--
; works with the same ptr as the pit for a fast clear (max 200% c with enemy)

myclear mov     dbomb,   >pclear
        jmp     myclear 

hit5    dat     0,0
dbomb   dat     0, -pclear+1
        dat     0, 0
        dat     0, 0
fang    jmp     pit-stfang, stfang

      for MAXLENGTH-CURLINE-18
        dat     0, 0
      rof

; --The Sneak--
; This is backwards clear which will be booted away


sneak   mov     bomb, <bclear
        jmp     -1, <bclear

        dat     0,0
        dat     0,0
        dat     0,0

bomb    dat     0, -11
bclear  dat     0, -31


; Initialise

start   mov     sneak+1, sboot+1                ; Tweaked boot.
        mov     {-1,     <-1
        mov     bclear,  sboot+bclear-sneak 
        mov     {-1,     <-1

; 1 process to the sneak
        spl     sboot
; 1 process to the forward clear
        spl     myclear
; 5 processes to the vamp
        spl     vamp
        spl     vamp
        spl     vamp
        spl     vamp
        jmp     vamp

        end



