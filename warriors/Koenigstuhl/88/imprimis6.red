;redcode quiet
;name Imprimis 6
;author P.Kline
;strategy stone like ExtraExtra
;strategy one 3-point spiral like Impression - binary launch
;strategy one 7-point spiral like Nimbus     - jmp/add launch
;strategy anti-vampire code -> reverse coreclear
;strategy clears startup code after it should have completed
;strategy startup-clear -> forward coreclear for redundancy
;assert CORESIZE==8000
d       equ 2667
d2      equ 1143
impp1   equ (1000+97+139)
impp2   equ (2033+97+153+65)

        dat #2
        dat #0
        add #2,ptrcl
clear   spl @-3,<3864
movcl   mov switch,<ptrcl
        djn -2,<3862
ptrcl   dat #ia
        dat #0
switch  dat <2667,#3

stone    mov <5630,stone+3044+3
extra    spl -1,<inc-129-1100        ; stone soaks up cycles early
         add inc,stone               ; but kills itself after mod-4 is complete
cnt      djn extra,<inc-129-1100
inc      dat #2667,#3044
copyf1   dat #0
copyt1   dat #copyf1+1025
copyt1a  dat #copyf1+1025-12
copyt1b  dat #copyf1+1025-34

hide1    spl 0,<-7                   ;
hide2    mov 23,<7834                ; traces vampire snares back to vampire
hide3    sub @hide2,<hide2           ; hide3 will be killed by stone after a while
copyf2   dat #0                      ; to make hidex a core clear
copyt2   dat #extra+1256
hide4    dat <-8,#0                  ; hide1 + hide4 make an imp-gate very late
copyf3   dat #0
copyt3   dat #extra+1254+24
start   mov <copyf1,<copyt1          ; put stone out there
        mov @copyf1,<copyt1a         ; with reflections
        mov @copyf1,<copyt1b
        mov <copyf1,<copyt1
        mov @copyf1,<copyt1a
        mov @copyf1,<copyt1b
        mov <copyf1,<copyt1
        mov @copyf1,<copyt1a
        mov @copyf1,<copyt1b
        mov <copyf1,<copyt1
        mov @copyf1,<copyt1a
        mov @copyf1,<copyt1b 
        mov <copyf1,<copyt1
        mov @copyf1,<copyt1a
        mov @copyf1,<copyt1b
        add #1,copyt1
        mov imp,imp+impp1    ; start first imp-spiral
        mov imp2,imp+impp2   ; start second imp-spiral
ia      spl iab
iaa     spl 4
        spl 2
        jmp imp+(d*0)+impp1
        jmp imp+(d*1)+impp1
        spl 2
        jmp imp+(d*2)+impp1
        jmp imp+(d*3)+impp1
iab     spl stst
        spl 2
        jmp imp+(d*4)+impp1
        jmp imp+(d*5)+impp1
ib      spl 2
        spl 1
        spl 1
        spl 1
        spl 1
        spl 2
ibb     jmp @0,imp+impp2
        add #d2,ibb
        dat #0
stst    spl @copyt1                ; give the stone some cycles
        spl @copyt1                ; give the stone some cycles
        spl @copyt1                ; give the stone some cycles
        mov <2000,copyt1           ; don't leave pointers to stone,etc.
        mov <copyf2,<copyt2        ; put hidex out there
        mov <copyf2,<copyt2
        mov <copyf2,<copyt2
        mov <copyf3,<copyt3
        spl ib
        spl clear                  ; start routine to erase startup code
        spl clear
        spl @copyt2                ; give hidex some cycles
        spl @copyt2                ; (must be an even number of these)
        spl @copyt2
        spl @copyt2
        spl @copyt2
        spl @copyt2
imp     mov 0,2667
imp2    mov 0,1143
        dat #1

        dat #1
        dat #1
dat1    dat #1
ptr1    dat #0
        dat #1
        dat #1
        dat #1
        dat #1
        dat #1
        dat #1
        dat #1
        dat #1
        dat #1
  
        end start
