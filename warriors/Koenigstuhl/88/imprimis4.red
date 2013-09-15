;redcode
;name Imprimis 4
;author P.Kline
;strategy stone like ExtraExtra
;strategy two 3-point spirals like Impression
;strategy anti-vampire code
;strategy core clear -> imp-gate
;strategy sorry - sink wouldn't fit
;assert CORESIZE==8000

d        equ 2667

stone    mov <5630,stone+3044+1
extra    spl -1,<inc-129-1100        ; stone soaks up cycles early
         add inc,stone               ; but kills itself after mod-4 is complete
cnt      djn extra,<inc-129-1100
inc      dat #2667,#3044
copyf1   dat #0
copyt1   dat #copyf1+1025

hide1    spl 0,<-7                   ;
hide2    mov 26,<7887                ; traces vampire snares back to vampire
hide3    sub @hide2,<hide2           ; hide3 will be killed by stone after a while
copyf2   dat #0                      ; to make hidex a core clear
copyt2   dat #extra+1254
hide4    dat <-8,#0                  ; hide1 + hide4 make an imp-gate very late
copyf3   dat #0
copyt3   dat #extra+1254+25

start   mov imp,imp+1000+97+132      ; put imps out there
        mov imp,imp+2333+97+132
        mov <copyf1,<copyt1          ; put stone out there
        mov <copyf1,<copyt1
        mov <copyf1,<copyt1
        mov <copyf1,<copyt1
        mov <copyf1,<copyt1
        add #1,copyt1
        mov <copyf2,<copyt2          ; put hidex out there
        mov <copyf2,<copyt2
        mov <copyf2,<copyt2
        mov <copyf3,<copyt3
        mov <4000,copyt3
        spl stst
        spl sttr
        spl 1                        ; double #processes in the spirals
        spl 16                       ; binary-launch imp spirals
        spl 8                        ; each spiral is six instructions wrapped
        spl 4                        ; around three points, with two
        spl 2                        ; processes at each instruction
        jmp imp+(d*0)+1000+97+132
        jmp imp+(d*1)+1000+97+132
        spl 2
        jmp imp+(d*2)+1000+97+132
        jmp imp+(d*3)+1000+97+132
        spl 4
        spl 2
        jmp imp+(d*4)+1000+97+132
        jmp imp+(d*5)+1000+97+132
        spl 2
        jmp imp+(d*0)+2333+97+132
        jmp imp+(d*1)+2333+97+132

        spl 8
        spl 4
        spl 2
        jmp imp+(d*2)+2333+97+132
        jmp imp+(d*3)+2333+97+132
        spl 2
        jmp imp+(d*4)+2333+97+132
        jmp imp+(d*5)+2333+97+132
stst    spl 1                      ; give the stone some cycles
        spl 1
        spl 1
        spl 1
        jmp @copyt1
        
sttr    spl @copyt2                ; give hidex some cycles
        spl @copyt2                ; (must be an even number of these)
        spl @copyt2
        spl @copyt2
        spl @copyt2
        spl @copyt2
        spl @copyt2
        spl @copyt2
        mov <2000,copyt1           ; don't leave pointers to stone,etc.
        mov <3000,copyt2
        dat #0
        dat #0
imp     mov 0,2667
        dat #(0-imp)*256           ; this stuff is just decoy
        dat #(0-imp)*256
        dat #(0-imp)*256
        dat #(0-imp)*256
        dat #(0-imp)*256
        dat #(0-imp)*256
        dat #(0-imp)*256
        dat #(0-imp)*256
        dat #(0-imp)*256
        dat #(0-imp)*256
        dat #(0-imp)*256
        dat #(0-imp)*256
        dat #(0-imp)*256
        dat #(0-imp)*256
        dat #(0-imp)*256
        dat #(0-imp)*256
        dat #(0-imp)*256
        dat #(0-imp)*256
        dat #(0-imp)*256
        dat #(0-imp)*256
        dat #(0-imp)*256
        end start
